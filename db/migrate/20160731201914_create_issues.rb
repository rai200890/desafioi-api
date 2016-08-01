class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.references :issue_type, index: true
      t.references :issue_reason, index: true
      t.text :body
      t.timestamps
    end
  end
end
