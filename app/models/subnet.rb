class Subnet < ActiveRecord::Base
  validate :subnet_should_be_valid, on: :create
  validate :subnet_addr_should_not_change, on: :update

  private

  def subnet_should_be_valid
    errors.add(:subnet_addr, 'invalid') unless IPAddress.valid?(subnet_addr)
    errors.add(:subnet_addr, 'already exists') if Subnet.find_by(subnet_addr: subnet_addr)
  end

  def subnet_addr_should_not_change
    errors.add(:subnet_addr, 'should not be changed') if subnet_addr_changed?
  end

end
