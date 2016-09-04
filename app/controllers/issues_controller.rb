class IssuesController < ApplicationController
  include PaginationConcern

  has_scope :page, default: 1
  has_scope :per, default: 15

  def index
    @issues = apply_scopes(Issue.sort_by(['state', 'asc'], ['created_at', 'desc']))
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
