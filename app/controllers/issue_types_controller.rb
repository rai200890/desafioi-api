class IssueTypesController  < ApplicationController

  def index
     @issue_types = IssueType.all
     render json: @issue_types
  end

end
