class Project < ApplicationRecord
  has_one_attached :autocad_file
  serialize :dxf_layers, Hash

  validate :acceptable_autocad_file

  after_save :schedule_autocad_file_parse
  has_many :positions
  has_many :sources, through: :positions, source: :positionee, source_type: "Source"
  has_many :receivers, through: :positions, source: :positionee, source_type: "Receiver"

  attr_accessor :positionee_source_names
  attr_accessor :positionee_receiver_names

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

  def positionee_source_names
    @positionee_source_names || sources.map{|s| s.name}
  end

  def positionee_receiver_names
    @positionee_receiver_names || receivers.map{|r| r.name}
  end

  # def positionee_plan_names
  #   @positionee_plan_names || plan.map{|s| s.name} 
  # end
  
  private
  def schedule_autocad_file_parse
    if self.autocad_file.attached?
      DxfReaderJob.set(wait: 3.seconds).perform_later(self.id)
    end
  end


  def associate_to_positions
      self.sources = positionee_source_names.filter{|x| !x.empty?}.map do |name|
        Source.find_or_create_by(name: name)
      end

      self.receivers = positionee_receiver_names.filter{|x| !x.empty?}.map do |name|
        Receiver.find_or_create_by(name: name)
      end
  end

end
