class IpAddr < ActiveRecord::Base
  belongs_to :subnet, touch: true
  audited associated_with: :subnet, on: [:update, :destroy]
  validate :ip_should_not_change, on: :update
  validates :description, on: :update, length: { maximum: 150,
                                                            too_long: "length should be less then %{count} characters." }
  scope :unassigned, -> { where(description: nil) }
  scope :assigned,   -> { where.not(description: nil) }


  def free
    self.update(description: nil)
  end

  def to_s
    self.ip
  end

  private

  def ip_should_not_change
    errors.add(:ip, 'should not be changed') if ip_changed?
  end


end
