class AddCostumerRefToIssues < ActiveRecord::Migration[5.0]
  def change
    add_reference :issues, :customer, foreign_key: true, index: true
  end
end
