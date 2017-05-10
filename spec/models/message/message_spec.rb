require 'rails_helper'
RSpec.describe Message, :type => :model do
  describe '#create' do
    it "バリデーションに引っかかり、保存できない場合のテスト" do
      message = FactoryGirl.build(:message,body:"")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end
    it "バリデーションに引っかからずに保存できる場合のテスト" do
      message = FactoryGirl.build(:message)
      message.valid?
      expect(message).to be_valid
    end
  end
end
