module Api::V1
  class IssueReasonsController < ApiController

    def index
      @issue_reasons = IssueReason.all
      render json: @issue_reasons
    end

  end
end
