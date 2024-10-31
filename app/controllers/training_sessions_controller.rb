class TrainingSessionsController < ApplicationController
    before_action :authenticate_user!
    def index
        @training_sessions = current_user.training_sessions.order
    end
    def new
      @training_session = current_user.training_sessions.build
    end
    def create
        @training_session = current_user.training_sessions.build(training_session_params)
        if @training_session.save
          redirect_to training_sessions_path, notice: 'Training session created successfully!'
        else
          render :new
        end
    end
    def edit
        @training_session = current_user.training_sessions.find(params[:id])
    end
    def update
        @training_session = current_user.training_sessions.find(params[:id])
        if @training_session.update(training_session_params)
          redirect_to training_sessions_path, notice: 'Training session updated successfully.'
        else
          render :edit
        end
    end
    def destroy
        @training_session = current_user.training_sessions.find(params[:id])
        @training_session.destroy
        redirect_to training_sessions_path, notice: 'Training session deleted successfully.'
    end
    private

  def training_session_params
    params.require(:training_session).permit(:date, :activity, :duration, :description)
  end
end
