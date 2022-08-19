class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :project, null: false, foreign_key: true
      t.json :content
      t.string :filename

      t.timestamps
    end
  end
end
