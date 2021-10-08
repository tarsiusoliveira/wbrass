require "./lib/tasks/dxf2ruby"
dxf = JF::Dxf2Ruby.parse("teste-thalles.dxf")
# header = dxf['HEADER']
# acad_version = header['$ACADVER'][1] # ==> "AC1015"
#
# def show_data(v)
#   pp v[5], 'x', v[10].round(2), 'y', v[20].round(2), 'z', v[30].round(2)
# end

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
