require 'csv'

class Admin::ManagementController < ApplicationController
  def management
    @users_csv = User.group_by_month(:created_at).count.to_a
    @play_lists_csv = PlayList.group_by_month(:created_at).count.to_a
    i = 0
    values = []
        @users_csv.count.times do
          value = []
          value << @users_csv[i][0]
          value << @users_csv[i][1]
          value << @play_lists_csv[i][1]
          i += 1
          values << value
        end
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_datas_csv(values)
      end
    end
  end

  def send_datas_csv(values_csv)
    csv_data = CSV.generate do |csv|
      column_names = %w(年月 新規登録者数 月別プレイリスト投稿数)
      csv << column_names
      value = []
        values_csv.each do |vc|
          column_values = [
            vc[0],
            vc[1],
            vc[2]
            ]
            csv << column_values
        end
    end
    send_data(csv_data, filename: "月別.csv")
  end
end
