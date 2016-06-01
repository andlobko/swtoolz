class LogsController < ApplicationController
  def show
    @log_actions = Log.unscoped.select(:action).distinct
    @logs = Log.unscoped.
        search_action(params[:log_action]).
        order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
