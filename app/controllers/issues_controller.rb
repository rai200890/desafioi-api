class IssuesController < ApplicationController
  include PaginationConcern

  def index
    @issues = apply_scopes(Issue.with_details.group_by_creation_and_state.order_by_date)
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
