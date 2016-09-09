module Api::V1
  class IssueTypesController < ApiController

    def index
      @issue_types = IssueType.all
      render json: @issue_types
    end

  end
end
