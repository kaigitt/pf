class Batch::ReportWeekly

  def self.report_weekly
    ContactMailer.report_mail.deliver
    @play_lists = PlayList.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).sort {|a,b| b.favorites.count <=> a.favorites.count}.first(5)

    @client.update("【今週の人気プレイリスト】\n
    #{ @play_lists[0].title }\n
    #{ @play_lists[1].title }\n
    #{ @play_lists[2].title }\n
    #{ @play_lists[3].title }\n
    #{ @play_lists[4].title }\n")
  end

    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = 'vKDgmqwPWuWOwp1GaKPwLUHxM'
    config.consumer_secret     = 'bh3p8JU5prZr1EjMnVZwHvVa0LC3yqGOHHwfNthZfLtcKmrWLI'
    config.access_token        = '1336291744313344000-Qe6YR7ugsvu0YVBDlYrLSP9mp0EQMi'
    config.access_token_secret = '1rjkr8p3wqfJikMY2056OwxEkzlmSfBZGkaXm1b0hgPqi'
  end
end