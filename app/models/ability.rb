class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, [IpAddr, Subnet]
    elsif user.user?
      can :read, [IpAddr, Subnet]
    end
  end
end
