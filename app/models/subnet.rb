class Subnet < ActiveRecord::Base
  validate :subnet_should_be_valid
  #validates_uniqueness_of :subnet_addr

  def subnet_should_be_valid
    errors.add(:subnet_addr, 'invalid') unless IPAddress.valid?(subnet_addr)
    errors.add(:subnet_addr, 'already exists') if Subnet.find_by(subnet_addr: subnet_addr)
  end
end
