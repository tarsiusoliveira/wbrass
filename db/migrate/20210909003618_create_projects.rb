class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.decimal :temperature, precision: 8, scale: 2
      t.decimal :pressure, precision: 8, scale: 2
      t.decimal :humidity, precision: 8, scale: 2
      t.integer :sampleRate
      t.decimal :irDuration, precision: 8, scale: 2
      t.integer :maxReflections
      t.integer :energyDecay
      t.integer :numRays
      t.integer :clusterOrder
      t.boolean  :diffuseProcessing
      t.boolean  :saveLateRays
      t.boolean  :artificialTail
      t.boolean  :saveDiffuseRays
      t.boolean  :auralization

      t.timestamps
    end
  end
end
