require "./lib/tasks/dxf2ruby"

class Planos

  def self.from_dxf(file)

    planos = Planos.new
    pontos.new


    dxf = JF::Dxf2Ruby.parse(file)
    dxf['ENTITIES'].each do |entity|
      if entity[0] != 'POLYLINE'
        if entity[10] != nil
          case entity[0]
          when 'VERTEX'


            }





    group_by_layer = {}
            group_by_layer[entity[8]+entity[330]] ||= []
            group_by_layer[entity[8]+entity[330]] << {
              shape: entity[0],
              id: entity[5],
              x: entity[10],
              y: entity[20],
              z: entity[30]
            } #layer name
          when 'POINT'
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
    end

    pontos = {}

    group_by_layer.each do |layer|
      if layer[:shape] == 'VERTEX'
        pontos ||= []
        pontos << group_by_layer[:x]

    end
    sources = group_by_layer.each_pair
  end
end
