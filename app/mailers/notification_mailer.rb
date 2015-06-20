class NotificationMailer < ApplicationMailer
  @reason = "Verification Notification."
  @url  = "https://enquire-med.herokuapp.com/"

  def doctor_removed user, hospital
    @doctor = user
    @hospital = hospital
    @url  = "https://enquire-med.herokuapp.com/"
    attachments.inline['logo.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'logo.png'))
    attachments.inline['signature.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'signature.png'))
    mail(to: @doctor.email, subject: @reason)
  end

  def hospital_removed user, hospital
    @manager = user
    @hospital = hospital
    @url  = "https://enquire-med.herokuapp.com/"
    attachments.inline['logo.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'logo.png'))
    attachments.inline['signature.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'signature.png'))
    mail(to: @manager.email, subject: @reason)
  end

  def doctor_verified user, hospital
    @doctor = user
    @hospital = hospital
    @url  = "https://enquire-med.herokuapp.com/"
    attachments.inline['logo.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'logo.png'))
    attachments.inline['signature.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'signature.png'))
    mail(to: @doctor.email, subject: @reason)
  end

  def hospital_verified user, hospital
    @manager = user
    @hospital = hospital
    @url  = "https://enquire-med.herokuapp.com/"
    attachments.inline['logo.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'logo.png'))
    attachments.inline['signature.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'signature.png'))
    mail(to: @manager.email, subject: @reason)
  end

  def doctor_verification_email user, manager
    @doctor = user
    @manager = manager
    @url  = "https://enquire-med.herokuapp.com/"
    attachments.inline['logo.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'logo.png'))
    attachments.inline['signature.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'signature.png'))
    mail(to: @manager.email, subject: @reason)
  end

  def hospital_verification_email manager, hospital
    @admin = User.is_admin.first
    @manager = manager
    @hospital = hospital
    @url  = "https://enquire-med.herokuapp.com/"
    attachments.inline['logo.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'logo.png'))
    attachments.inline['signature.png'] = File.read(File.join(Rails.root, 'app','assets', 'images', 'signature.png'))
    mail(to: @admin.email, subject: @reason)
  end
end
