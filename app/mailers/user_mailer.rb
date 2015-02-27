class UserMailer < ActionMailer::Base
  default from: "hello@citycoasting.com"

  def new_user_geet(new_user)
  	user = new_user
  	mail(to: 'hello@citycoasting.com', subject: 'New user has signed up CityCoasting')
  end

end
