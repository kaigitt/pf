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
    config.consumer_key        = ENV['TWITTER_API_KEY']
    config.consumer_secret     = ENV['TWITTER_API_SECRET_KEY']
    config.access_token        = ENV['YOUR_ACCESS_TOKEN']
    config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
  end
end