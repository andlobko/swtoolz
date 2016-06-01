Log = Audited.audit_class

class Log
  def self.search_action(action)
    if action.present?
      where(action: action)
    else
      where(nil)
    end
  end


end