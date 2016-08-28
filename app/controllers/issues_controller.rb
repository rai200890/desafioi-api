class IssuesController < ApplicationController
  include PaginationConcern

  has_scope :sort_by, using: [:field, :order], type: :hash, default: {field: "created_at", order: "desc"}
  has_scope :page, default: 1
  has_scope :per, default: 15

  def index
    @issues = apply_scopes(Issue).all
    render json: @issues, meta: pagination_info(@issues)
  end

  def create
    @issue = Issue.new
    if @issue.save
     render json: @issue
    else
     render json: @issue.errors
    end
  end

end
