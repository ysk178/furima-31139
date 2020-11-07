require 'rails_helper'
RSpec.describe Item, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it '商品画像がないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end  

    it '商品名がない場合は登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないと登録できないこと' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報がないと登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'カテゴリーの情報が1だと登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態についての情報がないと登録できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
    end

    it '配送料の負担についての情報がないと登録できないこと' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank", 'Charge is not a number')
    end

    it '発送元の地域についての情報がないと登録できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it '発送までの日数についての情報がないと登録できないこと' do
      @item.day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank", 'Day is not a number')
    end

    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が、¥300未満だと登録できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '価格が、¥9,999,999以上だと登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '販売価格は半角数字でないと保存できないこと' do
      @item.price = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
end
