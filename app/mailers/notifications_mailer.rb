class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"
  default to: "kaylas.email.address@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[kaylahowser.com] #{message.subject}")
  end
end
