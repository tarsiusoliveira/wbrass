class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.decimal :x, precision: 8, scale: 2
      t.decimal :y, precision: 8, scale: 2
      t.decimal :z, precision: 8, scale: 2
      t.integer :numRays
      t.decimal :rotAz
      t.decimal :rotEl
      t.integer :spl1m
      t.string :name

      t.timestamps
    end
  end
end
