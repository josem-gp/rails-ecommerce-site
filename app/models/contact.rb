class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: true
  attribute :message
  def headers
    { 
      #this is the subject for the email generated, it can be anything you want
      subject: "My Contact Form",
      to: %("#{name}" <#{email}>),
      from: ENV['GMAIL_SMTP_USER']
      #the from will display the name entered by the user followed by the email
    }
  end
end