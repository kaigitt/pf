 # musicrows

## サイト概要

musicrowsは、好きな音楽をまとめたプレイリストを共有できるサービスです。<br>
既にある楽曲を「楽曲に対するユーザ独自の思い出・考え」を基準にプレイリストとしてまとめ、ユーザに価値提供します。
「どんな場面で聴くと気持ちがいいのか」や「この楽曲にはどんな思い入れがあるのか」を投稿してもらい、
JPOP、洋楽、アニメ、演歌、クラシックなどのジャンルや「夏」「通学・通勤」「睡眠」などのキーワードなどから検索できます。
また、プレイリストにコメントをする、投稿したユーザをフォローするなどの機能により、ユーザの音楽を広げる手助けをします。

### サイトテーマ
好きな音楽を自分で見つけよう

### テーマを選んだ理由

・Google,Appleなどの音楽ビジネスの参入により日常生活で楽曲の選択をAIに頼ることが多くなった。<br>
その中で音楽に限らずAIからのレコメンドを消費するだけの人間でいいのかと疑問を持ち、
音楽をより楽しむためには、自分で音楽の世界を広げていく必要があると感じた。
そして、自らの音楽の世界を広げるためのプラットフォームをこのアプリで実現した。

### ターゲットユーザ
・高校生、大学生、20代の音楽に関心が高い層

### 主な利用シーン
・移り変わりの早い近年の音楽業界において、他人よりもいち早く新しい音楽を知りたい・聞きたいと考えている人に向けて

## 設計書
詳細設計書　https://docs.google.com/spreadsheets/d/1kbCovqBmVcFILPIDRSiNhuAIIp-9geHypQvODz3W8mQ/edit#gid=0<br>
テーブル定義書　https://docs.google.com/spreadsheets/d/1x5gCQTDN92lIq13M9aTCvdfLtn559yPjLu2vmerayr4/edit#gid=0

## 機能一覧
https://docs.google.com/spreadsheets/d/1bVxC7ldB10IFk4zfEUb5jYWyB-pHAIPOx0W2C7T2HYo/edit#gid=0

## 開発・使用技術

### フロントエンド
・Bootstrap 4.5.0<br>
・JavaScript、jQuery、Ajax

### バックエンド
・ruby 2.6.3<br>
・Rails 5.2.4.5

### 開発環境
・AWS(cloud9)

### 本番環境
・AWS (EC2、RDS for MySQL、Route53)<br>
・MySQL2<br>
・Nginx、Puma<br>
・CircleCIを用いて自動デプロイ

### テスト
・Rspec（単体/結合）

### その他使用技術
・ActionMailer<br>
・ActionCable<br>
・Whenever（定時処理、毎金、日曜に自動ツイート、データ収集後メール送信）<br>
・外部API（Twitter, Google, Spotify)

## ER図
![ER_musicrows drawio](https://user-images.githubusercontent.com/73706481/113313495-43d5a200-9346-11eb-97ba-42d5cad960f2.png)
