require_relative "../lib/db.rb"

DB.seed_from_file("#{Rails.root}/db/states.json", State, [:id, :abbreviation, :name])
DB.seed(IssueType, [:name], [["telefone"], ["chat"], ["email"]])
DB.seed(IssueReason, [:name], [["duvidas"], ["elogios"], ["sugestoes"]])
