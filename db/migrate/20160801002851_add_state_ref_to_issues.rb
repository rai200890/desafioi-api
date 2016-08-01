class AddStateRefToIssues < ActiveRecord::Migration[5.0]
  def change
    add_reference :issues, :state, foreign_key: true, index: true
  end
end
