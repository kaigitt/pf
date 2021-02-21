module NotificationsHelper

  # 通知確認の有無
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

 def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_play_list = link_to 'あなたの投稿', play_list_path(notification), style:"font-weight: bold;"
    @visiter_comment = notification.comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:play_list_path(notification.play_list_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
          @comment = Comment.find_by(id: @visiter_comment)&.content
          tag.a(@visiter.name, href:_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:play_list_path(notification.play_list_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end
end
