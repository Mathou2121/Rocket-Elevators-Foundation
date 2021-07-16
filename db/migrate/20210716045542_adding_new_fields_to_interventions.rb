class AddingNewFieldsToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :enddate, :datetime
    add_column :interventions, :report, :string    
  end
end
