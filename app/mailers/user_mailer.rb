class UserMailer < ActionMailer::Base
  default from: "hello@citycoasting.com"

  def new_user_geet(new_user)
  	recipients = ['j.odwyer320@gmail.com', 'talthoren@gmail.com']
  	@user = new_user
  	mail(to: recipients, subject: "CityCoasting new user: #{@user.name}")
  end

end
