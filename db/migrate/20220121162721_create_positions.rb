class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.decimal :x
      t.decimal :y
      t.decimal :z
      t.integer :shape
      t.string :name
      t.references :project, null: false, foreign_key: true
      t.references :positionee, polymorphic: true, null: false

      t.timestamps
    end
  end
end
