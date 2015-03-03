class UserMailer < ActionMailer::Base
  default from: "hello@citycoasting.com"

  def new_user_geet(new_user)
  	recipients = ['j.odwyer320@gmail.com', 'talthoren@gmail.com']
  	user = new_user
  	mail(to: recipients, subject: "New user, #{user.username}, has signed up for CityCoasting")
  end

end
