class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'manager'
      can :manage, Hospital
      can :create, HospitalVerificationRequest
    elsif user.role == 'user'
      can :manage, [
                     Question,
                     AnswerLike,
                     DoctorLike,
                     Follow,
                     HospitalLike,
                     Review
                 ]
      can :read, :all
    elsif user.role == "doctor"
      can :create, DoctorVerificationRequest
      can :manage, [
                   Answer,
                   Follow,
                   # Question,
                   Article
                 ]
      can :read, Question
    else
      can :access, :ckeditor   # needed to access Ckeditor filebrowser
      # Performed checks for actions:
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile
      can :manage, Question do |question|
        user == question.user
      end
      can :manage, Article do |article|
        user == article.user
      end
      can :manage, Hospital do |hospital|
        user.role == 'manager' && user == hospital.manager
      end
      can :manage, Answer do |answer|
        user.role == "doctor" && user == answer.user && user.verified?
      end
      can :read, :destroy, DoctorVerificationRequest do |request|
        user.role == "manager" && user.hospitals.include?(request.hospital)
      end
    end

      # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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
  end
end
