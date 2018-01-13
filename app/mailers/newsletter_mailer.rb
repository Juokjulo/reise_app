class NewsletterMailer < ActionMailer::Base
  default from: 'newsletter@we-cycle.asia'
 
  
    def newsletter_email(user, newsletter)
      @user = user
      @newsletter = newsletter
      @url  = 'localhost:3000' 
      mail(to: @user.email, subject: @newsletter.title)
   end
end
