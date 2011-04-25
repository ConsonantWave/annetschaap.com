class ContactMailer < ActionMailer::Base
  def contact_email(email_address, content)
    recipients ["daniel_f_berg@rogers.com", "sascha.adler@gmail.com"]
    from "annetschaap.com Contact Form <contact@annetschaap.com>"
    subject "New comment on the site!"
    sent_on Time.now
    body "From email address: #{email_address}\n\n#{content}"
  end
end
