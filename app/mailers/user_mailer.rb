class UserMailer < ActionMailer::Base
  default from: "hello@citycoasting.com"

  def new_user_geet(new_user)
  	user = new_user
  	mail(to: 'j.odwyer320@gmail.com', subject: 'New User Signup: #{user.name} - #{user.email}')
  end

end
