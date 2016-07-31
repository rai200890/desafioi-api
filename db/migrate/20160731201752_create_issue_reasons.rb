class CreateIssueReasons < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_reasons do |t|
      t.string :name
    end
  end
end
