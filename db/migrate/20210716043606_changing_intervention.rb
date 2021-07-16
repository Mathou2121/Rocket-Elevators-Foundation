class ChangingIntervention < ActiveRecord::Migration[5.2]
  def change
    remove_column :interventions, :enddate, :string
    remove_column :interventions, :report, :text
  end
end
