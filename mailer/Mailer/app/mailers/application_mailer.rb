class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: user.email, subject: 'Welcome to My Site')
    attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
  end

  def create
    u = User.create(user_params)

    msg = UserMailer.welcome_email(u)
    msg.deliver_now

    render :root
  end
end
