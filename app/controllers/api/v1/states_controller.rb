module Api::V1
  class StatesController < ApiController

    def index
       @states = State.all
       render json: @states
    end

  end
end
