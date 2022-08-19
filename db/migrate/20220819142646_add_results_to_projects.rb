class AddResultsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :results, :json
  end
end
