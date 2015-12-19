require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe '1. create new USER:' do

    it 'a. with VALIDS ATTRIBUTES' do   
      expect(User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678').valid?).to eq(true)
    end
    
    describe 'b. VALIDATIONS, with invalid:' do

      it '- attribute PRESENCE (nickname, email-devise, gender, role, password-devise)' do
        expect(User.create(nickname: nil, email: 'robin1@gmail.com', gender: nil, role: nil, password: '12345678').valid?).to eq(false)
        expect(User.create(nickname: '', email: 'robin2@gmail.com', gender: '', role: nil, password: '12345678').valid?).to eq(false)
      end

      it '- attribute UNIQUENESS (nickname, email-devise)' do
        robin1 = User.create(nickname: 'robin1', email: 'robin1@gmail.com', gender: 'male', role: 'user', password: '12345678')        
        robin1.save
        expect(User.create(nickname: 'robin1', email: 'robin2@gmail.com', gender: 'male', role: 'user', password: '12345678').valid?).to eq(false)
        expect(User.create(nickname: 'robin2', email: 'robin3@gmail.com', gender: 'male', role: 'user', password: '12345678').valid?).to eq(true)
      end
      
      it '- attribute LENGTH (nickname:-14, password-devise:+7)' do
        expect(User.create(nickname: 'robinrobinrobinrobinrobin', email: 'robin1@gmail.com', gender: 'male', role: 'user', password: '12345678').valid?).to eq(false)
        expect(User.create(nickname: 'r', email: 'robin2@gmail.com', gender: 'male', role: 'user', password: '12345678').valid?).to eq(true)
      end

      it '- attribute INCLUSION options predefined (gender:male/female, role:user/ads/admin)' do
        expect(User.create(nickname: 'da igual', email: 'robin1@gmail.com', gender: 'chulo', role: 'surfista',password: '12345678').valid?).to eq(false)
      end
    end

  end

end
