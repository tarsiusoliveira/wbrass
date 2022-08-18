class Project < ApplicationRecord
  has_one_attached :autocad_file
  has_one_attached :results_file
  serialize :dxf_layers, Hash
  serialize :results, Hash

  validate :acceptable_autocad_file
  validate :acceptable_results_file

  after_save :schedule_autocad_file_parse
  after_save :read_results_file

  has_many :positions, dependent: :delete_all
  has_many :sources, through: :positions, source: :positionee, source_type: "Source"
  has_many :receivers, through: :positions, source: :positionee, source_type: "Receiver"
  has_many :plans, through: :positions, source: :positionee, source_type: "Plan"


  attr_accessor :positionee_source_names
  attr_accessor :positionee_receiver_names
  attr_accessor :positionee_plan_names

  before_validation :associate_to_positions

  def acceptable_autocad_file
    return unless autocad_file.attached?

    unless autocad_file.byte_size <= 1.megabyte
      errors.add(:autocad_file, "is to big")
    end

    acceptable_type = ["image/vnd.dxf"]
    unless acceptable_type.include?(autocad_file.content_type)
      errors.add(:autocad_file, "must be a DXF file")
    end
  end

  def acceptable_results_file
    return unless results_file.attached?

    unless results_file.byte_size <= 1.megabyte
      errors.add(:results_file, "is to big")
    end

    acceptable_type = ["application/zip"]
    unless acceptable_type.include?(results_file.content_type)
      errors.add(:results_file, "must be a ZIP file")
    end
  end

  def positionee_source_names
    @positionee_source_names || sources.map{|s| s.name}
  end

  def positionee_receiver_names
    @positionee_receiver_names || receivers.map{|r| r.name}
  end

  def positionee_plan_names
    @positionee_plan_names || plans.map{|s| s.name} 
  end
  
  private
  def schedule_autocad_file_parse
    if self.autocad_file.attached?
      DxfReaderJob.set(wait: 1.seconds).perform_later(self.id)
    end
  end

  def read_results_file
    if self.results_file.attached?
      require 'rubygems'
      require 'zip'
      @max_size = 2048**2 
      Zip::File.open(self.results_file.filename.to_s) do |zip_file|
        zip_file.each do |entry|
          puts "Extracting #{entry.name}"
          raise 'File too large when extracted' if entry.size > @max_size
          entry.extract 
          pp '================='
          pp entry.name
          pp entry.get_input_stream.read
          pp '================='
          
          self.results = {name: entry.name, content: entry.get_input_stream.read}
        end
      end
    end
  end


  def associate_to_positions
    self.sources |= positionee_source_names.filter{|x| !x.empty?}.map do |name|
      self.dxf_layers[name].map do |layer|
        Source.find_or_create_by(name: (name), x: layer[:x], 
            y: layer[:y], z: layer[:z])
      end
      Source.find_by(name: name)
    end

    self.receivers |= positionee_receiver_names.filter{|x| !x.empty?}.map do |name|
      self.dxf_layers[name].map do |layer|
        Receiver.find_or_create_by(name: (name), x: layer[:x], 
            y: layer[:y], z: layer[:z])
      end
      Receiver.find_by(name: name)
    end
    
    self.plans |= positionee_plan_names.filter{|x| !x.empty?}.map do |name|
      plan_positions = []
      i = 0
      @comparator = 0
      self.dxf_layers[name].map do |layer|
        if (@comparator == 0 || @comparator == layer[:id])
          @comparator = layer[:id]
          plan_positions << layer[:x].round(2)
          plan_positions << layer[:y].round(2)
          plan_positions << layer[:z].round(2)
          i += 1
          Plan.find_or_create_by(name: name, id: layer[:id].hex).update_columns(xyz: plan_positions.join(" "), vertices: i)
        else
          @comparator = 0
          plan_positions = []
          i = 0
          plan_positions << layer[:x].round(2)
          plan_positions << layer[:y].round(2)
          plan_positions << layer[:z].round(2)
          i += 1
          Plan.find_or_create_by(name: name, id: layer[:id].hex).update_columns(xyz: plan_positions.join(" "), vertices: i)
       end
      end
      Plan.find_by(name: name)
    end
  end
end
