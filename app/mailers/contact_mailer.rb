class ContactMailer < ActionMailer::Base
  default from: "no-reply@sabairean.com"

  def contact(message, subject, email)
    @message = message
    @email = email
    mail(to: 'stephanie@enspiral.com', 'reply-to' => email,  subject: "[Sabairean Contact] #{subject}")
  end
end
