class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  belongs_to :role
  before_save :assign_role

  def admin?
    self.role.name == "admin"
  end

  def manager?
    self.role.name == "manager"
  end

  def user?
    self.role.name == "user"
  end

  private
  def assign_role
    self.role = Role.find_by_name('user') if self.role.nil?
  end

end
