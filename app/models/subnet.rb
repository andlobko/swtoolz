class Subnet < ActiveRecord::Base
  has_many :ip_addrs, dependent: :destroy
  before_validation :normalize_subnet_addr, on: :create
  validate :subnet_should_be_uniq, on: :create
  validate :subnet_addr_should_not_change, on: :update
  validates :description, on: [:create, :update], length: { maximum: 150,
                       too_long: "length should be less then %{count} characters." }
  after_create :fill_subnet

  private

  def normalize_subnet_addr
    begin
      ip = IPAddress.parse(subnet_addr)
      ip.prefix = 24
      self.subnet_addr = "#{ip.network}/24"
    rescue
      errors.add(:subnet_addr, 'invalid. Should be IPv4 addr(no netmask/prefix).')
    end
  end

  def subnet_should_be_uniq
    errors.add(:subnet_addr, 'already exists') if Subnet.find_by(subnet_addr: subnet_addr)
  end

  def subnet_addr_should_not_change
    errors.add(:subnet_addr, 'should not be changed') if subnet_addr_changed?
  end

  def fill_subnet
    IPAddress(subnet_addr).each_host do |host|
      self.ip_addrs.create(ip: host)
    end
  end

end
