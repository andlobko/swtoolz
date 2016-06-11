class PppoeServer < ActiveRecord::Base
  audited
  validates :name, presence: true, uniqueness: true
  validates :description, on: [:create, :update],
            length: { maximum: 150, long: "length should be less then %{count} characters." }
  validates :address, presence: true, uniqueness: true
  validates :telnet_password, presence: true
  validate :address_should_be_ipv4, on: [:create, :update]

  def to_s
    self.name
  end

  private
  def address_should_be_ipv4
    IPAddress::IPv4.new address rescue errors.add(:address, 'invalid. Should be IPv4 addr(no netmask/prefix).')
  end

end
