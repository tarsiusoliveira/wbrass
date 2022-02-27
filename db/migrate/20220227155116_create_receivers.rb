class CreateReceivers < ActiveRecord::Migration[6.1]
  def change
    create_table :receivers do |t|
      t.decimal :x
      t.decimal :y
      t.decimal :z
      t.integer :reception_ray
      t.integer :rotation
      t.string :name

      t.timestamps
    end
  end
end
