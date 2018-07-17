class Ability
  include CanCan::Ability

  def initialize(use)
    # Define abilities for the passed in user here. For example:
    alias_action(:create, :read, :update, :delete, to: :crud)

    use ||= Use.new # guest user (not logged in)
    if use.admin?
      can :manage, :all
    else
      can :read, :all
    end
    
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    can(:delete, Idea) do |idea|
      idea.use == use
    end

    # :manage is a special action that essentially allows
    # a user to perform any action on the class' instances
    # if the block returns true.
    can(:crud, Idea) do |idea|
      use == idea.use
    end

    can(:crud, Review) do |review|
      use == review.use
    end
  end
end
