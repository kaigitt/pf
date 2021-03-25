require 'rails_helper'

RSpec.describe User, type: :model do

  it "メール、パスワード、名前がある場合、有効" do
    expect(FactoryBot.create(:user)).to be_valid
  end
# 未確認
  it "メールがない場合、登録できない" do
    user = FactoryBot.build(:user, email: "")
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

# 未確認
  it "パスワードがない場合、登録できない" do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "名前がない場合、無効" do
    expect(FactoryBot.build(:user, name: "")).to_not be_valid
  end
end
