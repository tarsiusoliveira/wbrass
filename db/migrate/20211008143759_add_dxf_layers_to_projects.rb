class AddDxfLayersToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :dxf_layers, :json
  end
end
