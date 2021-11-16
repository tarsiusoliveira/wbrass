class Project < ApplicationRecord
  has_one_attached :autocad_file
  serialize :dxf_layers, Hash

  after_create_commit :parse_autocad_file, if: ->{autocad_file.present?}

  private
  def parse_autocad_file
    require "./lib/tasks/dxf2ruby"
    pp autocad_file
    autocad_file.open do |file|
      pp file
      dxf_parsed = JF::Dxf2Ruby.parse(file.path)
    end
    dxf_parsed['ENTITIES'].each do |entity|
      if entity[0] != 'POLYLINE'
        if entity[10] != nil
          case entity[0]
          when 'VERTEX'
            dxf_layers[entity[8]+entity[330]] ||= []
            dxf_layers[entity[8]+entity[330]] << {
              shape: entity[0],
              id: entity[5],
              x: entity[10],
              y: entity[20],
              z: entity[30]
            } #layer name
          when 'POINT'
            dxf_layers[entity[8]] ||= []
            dxf_layers[entity[8]] << {
              shape: entity[0],
              id: entity[5],
              x: entity[10],
              y: entity[20],
              z: entity[30]
            } #layer name
          end
        end
      end
    end
    self.save!
  end
end
