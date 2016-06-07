class LogsController < ApplicationController
  def show
    @log_actions = Log.unscoped.select(:action).distinct
    @log_types = Log.unscoped.select(:auditable_type).distinct
    @logs = Log.unscoped.
        search_action(params[:log_action]).
        search_type(params[:log_type]).
        search_comment(params[:log_comment]).
        search_changes(params[:log_changes]).
        order(created_at: :desc).paginate(page: params[:page], per_page: params[:per_page])
    respond_to do |format|
      format.html
      format.js {}
    end
  end
end
