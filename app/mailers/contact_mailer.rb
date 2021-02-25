class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: 's12201600350@gmail.com', subject: 'お問い合わせ内容'
  end

  def report_mail
    # usersとplay_listsそれぞれ、今週一週間分のデータを検索
    @users = User.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
    @play_lists = PlayList.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
    mail to: 's12201600350@gmail.com', subject: '週次レポート'
  end
end