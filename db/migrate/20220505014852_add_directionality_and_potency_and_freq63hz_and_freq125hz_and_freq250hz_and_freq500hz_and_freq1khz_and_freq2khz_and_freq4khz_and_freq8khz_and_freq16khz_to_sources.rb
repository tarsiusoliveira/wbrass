class AddDirectionalityAndPotencyAndFreq63hzAndFreq125hzAndFreq250hzAndFreq500hzAndFreq1khzAndFreq2khzAndFreq4khzAndFreq8khzAndFreq16khzToSources < ActiveRecord::Migration[6.1]
  def change
    add_column :sources, :directionality, :string
    add_column :sources, :potency, :integer
    add_column :sources, :freq63hz, :decimal
    add_column :sources, :freq125hz, :decimal
    add_column :sources, :freq250hz, :decimal
    add_column :sources, :freq500hz, :decimal
    add_column :sources, :freq1khz, :decimal
    add_column :sources, :freq2khz, :decimal
    add_column :sources, :freq4khz, :decimal
    add_column :sources, :freq8khz, :decimal
    add_column :sources, :freq16khz, :decimal
  end
end
