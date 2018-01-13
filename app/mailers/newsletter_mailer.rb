class NewsletterMailer < ActionMailer::Base
  default from: 'from@example.com'
 
  
    def welcome_email(user, newsletter)
      @user = user
      @newsletter = newsletter
      @url  = 'localhost:3000' 
      mail(to: @user.email, subject: @newsletter.title)
   end
end
