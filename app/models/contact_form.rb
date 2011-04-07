class ContactForm < ActiveRecord::Base
  after_save { |form| ContactMailer.deliver_contact_email(form.content) }
end
