class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, [IpAddr, Subnet]
      can :read, Log
    elsif user.user?
      can :read, [IpAddr, Subnet, Log]
    end
  end
end
