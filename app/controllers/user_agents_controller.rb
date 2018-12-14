class UserAgentsController < ApplicationController
  before_action :set_and_update_user_agent, only: [:index, :show, :edit, :new]

  # GET /user_agents
  # GET /user_agents.json
  def index
    @user_agents = UserAgent.all.order(:counter)
    respond_to do |format|
      format.html
      format.json {
        render json: @user_agents
      }
    end
  end

  # GET /user_agents/1
  # GET /user_agents/1.json
  def show
  end

  # GET /user_agents/new
  def new
    @user_agent = UserAgent.new
  end

  # GET /user_agents/1/edit
  def edit
  end

  private
    def set_and_update_user_agent
      @user_agent = UserAgent.find_or_create_by(user_agent_string: request.user_agent)
      @user_agent.increment!(:counter)
      @user_agent.updated_at = Time.now
    end
end
