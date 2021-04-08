# Throttle login attempts for a given email parameter to 6 reqs/minute
# Return the email as a discriminator on POST /login requests
# 【訳】
class Rack::Attack
  # ログイン試行を 60秒あたり6リクエストに抑えます
  # メールアドレスを POST /login リクエストの区別要因として返す
  # Rack::Attack.throttle('limit logins per email', limit: 6, period: 60) do |req|
  #   if req.path == '/login' && req.post?
  #     req.params['email']
  #   end
  # end
  # deviseのlockableで対応？

  # 同一IPアドレスからのリクエストを5回/秒に制限
  Rack::Attack.throttle('req/ip', limit: 5, period: 1.second) do |req|
    req.ip
  end

  # 同一IPアドレスからのリクエストを100回/分に制限
  Rack::Attack.throttle('req/ip', :limit => 100, :period => 1.minutes) do |req|
    req.ip
  end
end