class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: 's12201600350@gmail.com', subject: 'お問い合わせ内容'
  end
end
