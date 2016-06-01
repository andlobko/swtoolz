class LogsController < ApplicationController
  def show
    @logs = Audited.audit_class.unscoped.order(created_at: :desc)
  end
end
