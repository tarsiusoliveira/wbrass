class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.decimal :freq63hz
      t.decimal :freq125hz
      t.decimal :freq250hz
      t.decimal :freq500hz
      t.decimal :freq1k
      t.decimal :freq2k
      t.decimal :freq4k
      t.decimal :freq8k
      t.decimal :freq16k
      t.decimal :scattering_coefficient

      t.timestamps
    end
  end
end
