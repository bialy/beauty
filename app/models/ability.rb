class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user

    @role = Role.find_by_name('klient')
    
    if user.roles.empty?
      user.roles << @role  
    end
    
    if user.role? :administrator
      can :manage, :all
    elsif user.role? :operator
      can :manage, [Offer, Price]
      can :read, :all
    else
      can :read, :all
    end
  end
end