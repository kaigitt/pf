require 'rails_helper'

RSpec.describe PlayList, type: :model do
  it "ユーザIDがなければ投稿不可" do
    expect(FactoryBot.build(:play_list, user_id: "")).to_not be_valid
  end

  it "プレイリストタイトルがなければ投稿不可" do
    expect(FactoryBot.build(:play_list, title: "")).to_not be_valid
  end
end
