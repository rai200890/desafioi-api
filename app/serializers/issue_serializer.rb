class IssueSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at

  has_one :issue_type
  has_one :issue_reason
  has_one :customer
  has_one :state

end
