class AddDirectionalityToReceivers < ActiveRecord::Migration[6.1]
  def change
    add_column :receivers, :directionality, :string
  end
end
