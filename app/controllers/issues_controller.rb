class IssuesController < ApplicationController

  def index
    @issues = Issue.all
    render json: @issues
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
