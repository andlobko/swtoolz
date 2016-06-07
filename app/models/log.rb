Log = Audited.audit_class

class Log
  def self.search_action(action)
    if action.present?
      where(action: action)
    else
      where(nil)
    end
  end

  def self.search_type(type)
    if type.present?
      where(auditable_type: type)
    else
      where(nil)
    end
  end

  def self.search_comment(comment)
    if comment.present?
      where("comment LIKE ?", "%#{comment}%")
    else
      where(nil)
    end
  end

  def self.search_changes(changes)
    if changes.present?
      where("audited_changes LIKE ?", "%#{changes}%")
    else
      where(nil)
    end
  end

end