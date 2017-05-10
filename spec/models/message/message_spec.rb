require 'rails_helper'

RSpec.describe Message, :type => :model do
  describe '#create' do
    it "本文がない場合に、保存できない場合のテスト" do
      message = build(:message,body:"")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end
    it "本文がある場合に保存できる場合のテスト" do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end
  end
end
