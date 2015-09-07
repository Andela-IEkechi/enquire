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
  end
end
