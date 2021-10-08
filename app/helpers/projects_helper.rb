module ProjectsHelper
require "./lib/tasks/dxf2ruby"

  def dxf_parser
    dxf = JF::Dxf2Ruby.parse("teste-thalles.dxf")
    group_by_layer = {}
    dxf['ENTITIES'].each do |entity|
      case entity[0]
      when 'VERTEX'
        group_by_layer[entity[8]+entity[330]] ||= []
        group_by_layer[entity[8]+entity[330]] << {
          shape: entity[0],
          id: entity[5],
          x: entity[10],
          y: entity[20],
          z: entity[30]
        } #layer name
      when 'POINT'
        if entity[10] != nil
          group_by_layer[entity[8]] ||= []
          group_by_layer[entity[8]] << {
            shape: entity[0],
            id: entity[5],
            x: entity[10],
            y: entity[20],
            z: entity[30]
          } #layer name
        end
      end
    end

    p "=" * 50
    p "group_by_layer"
    p "-" * 50
    pp group_by_layer
    p "=" * 50

  end
end
