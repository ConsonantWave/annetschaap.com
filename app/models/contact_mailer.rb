class ContactMailer < ActionMailer::Base
  def contact_email(content)
    recipients ["daniel_f_berg@rogers.com", "sascha.adler@gmail.com"]
    from "annetschaap.com Contact Form <contact@annetschaap.com>"
    subject "New comment on the site!"
    sent_on Time.now
    body content
  end
end
