module ApplicationHelper

  def bootstrap_class_for flash_type
    {
        success: "alert-success",
        info: "alert-info",
        warning: "alert-warning",
        danger: "alert-danger",
        alert: "alert-warning",
        notice: "alert-success",
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    if flash.any?
      message = ""
      flash.each do |flash_type, msg|
        message << '<div class="alert ' << bootstrap_class_for(flash_type) << '" role="alert">'
        message << msg
        message << '</div>'
      end
      message.html_safe
    end
  end

  def object_name_for_audits(record)
    record.auditable_type.constantize.find(record.auditable_id).to_s rescue "n/a"
  end

  def get_changes_for_audits(record)
    html = ""
    record.each do |key, value|
      html += "<br>" unless html.blank?
      html += "<strong>#{key}:</strong> #{value}"
    end
    html.html_safe
  end

  def self.encryption_key
    ENV["SwToolzKey"] ||= 'development_keydevelopment_keydevelopment_keydevelopment_key'
  end

end
