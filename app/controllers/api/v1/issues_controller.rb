module Api::V1
  class IssuesController < ApiController
    include PaginationConcern

    has_scope :page, default: 1
    has_scope :per, default: 15

    def index
      @issues = apply_scopes(Issue.group_by_date_and_state)
      render json: @issues, meta: pagination_info(@issues)
    end

    def create
      @issue = Issue.new issue_params
      if @issue.save
        render json: @issue, status: :created
      else
        render json: {errors: @issue.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def show
      @issue = Issue.where(id: params[:id]).first
      if @issue
        render json: @issue
      else
        render :nothing, status: :not_found
      end
    end

    private

    def issue_params
      params.require(:issue).permit(:customer_id, :issue_type_id, :issue_reason_id, :state_id, :body)
    end
  end
end
