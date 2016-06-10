class DeviceTemplate < ActiveRecord::Base
  audited

  def to_s
    self.name
  end
end
