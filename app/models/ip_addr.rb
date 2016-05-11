class IpAddr < ActiveRecord::Base
  belongs_to :subnet, touch: true
  validate :ip_should_not_change, on: :update

  def free
    self.update(description: nil)
  end

  private

  def ip_should_not_change
    errors.add(:ip, 'should not be changed') if ip_changed?
  end


end
