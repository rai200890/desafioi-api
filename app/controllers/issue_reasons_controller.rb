class IssueReasonsController  < ApplicationController

  def index
     @issue_reasons = IssueReason.all
     render json: @issue_reasons
  end

end
