class NewsletterMailer < ActionMailer::Base
  default from: 'we.are.cycling.asia@gmail.com'
 
  
    def welcome_email(user, newsletter)
      @user = user
      @newsletter = newsletter
      @url  = 'localhost:3000' 
      mail(to: @user.email, subject: @newsletter.title)
   end
end
