require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end
  describe '出品画面作成' do
    context '出品できるとき' do
      it '正常に出品できる' do
        expect(@event).to be_valid
      end
    end
    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @event.images = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Images can't be blank")
      end
      it 'titleが空では出品できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      it 'catch_copyが空では出品できない' do
        @event.catch_copy = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'conceptが空では出品できない' do
        @event.concept = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Concept can't be blank")
      end
      it 'priceが空では出品できない' do
        @event.price = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では出品できない' do
        @event.price = 299
        @event.valid?
        expect(@event.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが10000000以上では出品できない' do
        @event.price = 10_000_000
        @event.valid?
        expect(@event.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが全角数字では出品できない' do
        @event.price = '１００００'
        @event.valid?
        expect(@event.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが半角英字では出品できない' do
        @event.price = 'abcde'
        @event.valid?
        expect(@event.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが半角英数字混合では出品できない' do
        @event.price = 'abc123'
        @event.valid?
        expect(@event.errors.full_messages).to include('Price Half-width number')
      end
      it 'addressが空では出品できない' do
        @event.address = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Address can't be blank")
      end
      it 'userが紐付いてないと出品できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('User must exist')
      end 
    end
  end
end
