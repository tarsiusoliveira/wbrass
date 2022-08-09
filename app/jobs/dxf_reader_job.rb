class DxfReaderJob < ApplicationJob
  queue_as :projects


  def perform(project_id)
    require "./lib/tasks/dxf2ruby"

    project = Project.find(project_id)
    dxf = JF::Dxf2Ruby.parse(project.autocad_file.filename.to_s)
    group_by_layer = {}
    dxf['ENTITIES'].each do |entity|
      if entity[0] != 'POLYLINE'
        if entity[10] != nil
          case entity[0]
          when 'VERTEX'
            group_by_layer[entity[8]] ||= []
            group_by_layer[entity[8]] << {
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

    project.update_columns(dxf_layers: group_by_layer)
   end
end
