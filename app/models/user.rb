class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  audited only: [:name, :role_id, :email]
  validates :password, confirmation: true
  validates :name, presence: true, uniqueness: true
  belongs_to :role

  before_save :assign_role

  def to_s
    self.name
  end

  def admin?
    self.role.name == "admin"
  end

  def manager?
    self.role.name == "manager"
  end

  def user?
    self.role.name == "user"
  end

  def last_sign_in_date
    if self.last_sign_in_at?
      self.last_sign_in_at.localtime.strftime('%d/%m/%Y %H:%M:%S')
    else
      "Never"
    end
  end

  def history(limit = 100)
    Audited.audit_class.unscoped.where(user_id: self.id).order(created_at: :desc).limit(limit)
  end

  private
  def assign_role
    self.role = Role.find_by_name('user') if self.role.nil?
  end

end
