class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :vertices
      t.json :xyz
      t.string :name
      t.string :material

      t.timestamps
    end
  end
end
