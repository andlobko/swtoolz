class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  belongs_to :role

  def admin?
    self.role.name == "admin"
  end

  def manager?
    self.role.name == "manager"
  end

  def user?
    self.role.name == "user"
  end

end
