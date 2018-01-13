class NewsletterMailer < ActionMailer::Base
  default wecycleasia: 'we.are.cycling.asia@we-cycle.asia'
 
  
    def welcome_email(user, newsletter)
      @user = user
      @newsletter = newsletter
      @url  = 'localhost:3000' 
      mail(to: @user.email, subject: @newsletter.title)
   end
end
