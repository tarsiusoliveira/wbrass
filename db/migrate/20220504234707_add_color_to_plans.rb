class AddColorToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :color, :string
  end
end
