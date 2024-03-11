class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :carrier
      can :manage, Transport
    elsif user.has_role? :client
      can :read, Transport
    end
  end
end