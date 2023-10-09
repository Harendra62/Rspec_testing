require 'rails_helper'

RSpec.describe User, type: :model do
    context 'validations' do
        it 'will create a user when all fields are correct' do
            user = build(:user)
            user.save
            # user = User.create(name: "", surname: "",username: "sfgts",mobile: "" ,email: "", password: "")
            expect(user.id).to eq(User.last.id)
        end

        it 'will raise error when name is blank' do
            user = build(:user, name: "")
            # user = User.create(name: "", surname: "sfgts",username: "",mobile: "",email: "", password: "" )
            
            expect(user.save).to eq(false)
            expect(user.errors[:name]).to eq(["is too short (minimum is 2 characters)", "can't be blank"])
        end

        it 'will raise error when name is having only one alphabet ' do
            user = build(:user, name: "a")
            # user = User.create(name: "", surname: "sfgts",username: "",mobile: "",email: "", password: "" )
            
            expect(user.save).to eq(false)
            expect(user.errors[:name]).to eq(["is too short (minimum is 2 characters)"])
        end
    
        it 'will raise error when surname is blank' do
          user = build(:user, surname: "")
        user.save
        expect(user.id).to eq(nil)
        expect(user.errors[:surname]).to eq(["can't be blank"])
        end

        it 'will raise error when surname is having more than 32 char ' do
            user = build(:user, surname: "abcdefghijklmnopqrstuvwxyzqwertyu")
          user.save
          expect(user.id).to eq(nil)
          expect(user.errors[:surname]).to eq(["is too long (maximum is 32 characters)"])
          end
      
    
        it 'will raise error when email blank' do
          user = build(:user, email: "")
          expect(user.save).to eq(false)
          expect(user.errors[:email]).to eq(["can't be blank", "is invalid"])
        end
        
        it 'will raise error when @ is not present on email' do
            user = build(:user, email: "usergmail.com")
            expect(user.save).to eq(false)
            expect(user.errors[:email]).to eq(["is invalid"])
        end
        
        it 'will create a user with already exist email' do
        
            user = build(:user,email:"user@gmail.com")
            user.save
            user = build(:user,email:"user@gmail.com")
            user.save
            expect(user.errors[:email]).to eq(["has already been taken"])
        end

        it 'will raise error when username is not present ' do
            user = build(:user, username: "")
            expect(user.save).to eq(false)
            expect(user.errors[:username]).to eq(["can't be blank", "is invalid"])
        end
        
        it 'will create a username with already exist username' do
            user = build(:user,username:"rzssmjwn3u")
            user.save
            user = build(:user,username:"rzssmjwn3u")
            user.save
            expect(user.errors[:username]).to eq(["has already been taken"])
        end
      

        it 'will raise error when mobile is not present ' do
            user = build(:user, mobile: nil)
            expect(user.save).to eq(false)
            expect(user.errors[:mobile]).to eq(["can't be blank", "is too short (minimum is 10 characters)"])
        end

        it 'will raise error when mobile number length grater than 10 ' do
            
            user = build(:user, mobile: 966933654732344)
            expect(user.save).to eq(false)
            expect(user.errors[:mobile]).to eq(["is too long (maximum is 10 characters)"])
        end

        it 'will raise error when mobile number length less than 10 ' do
            user = build(:user, mobile: 966933654)
            expect(user.save).to eq(false)
            expect(user.errors[:mobile]).to eq(["is too short (minimum is 10 characters)"])
        end

        it 'will create a mobile with already exist mobile' do
            user = build(:user,mobile:"9669336547")
            user.save
            user = build(:user,mobile:"9669336547")
            user.save
            expect(user.errors[:mobile]).to eq(["has already been taken"])
        end
        
        it 'will raise error when password is not present ' do
            user = build(:user, password: "")
            expect(user.save).to eq(false)
            expect(user.errors[:password]).to eq(["can't be blank", "is invalid"])
        end
        
        it 'will raise error when password is not valid  ' do
        
            user = build(:user, password: "harendra")
            expect(user.save).to eq(false)
            expect(user.errors[:password]).to eq(["is invalid"])
        end
        
        it 'will raise error when password also contain on special character  ' do
        
            user = build(:user, password: "Harendra")
            expect(user.save).to eq(false)
            expect(user.errors[:password]).to eq(["is invalid"])
        end

        it 'will raise error when password also contain one number   ' do
        
            user = build(:user, password: "Harendra$")
            expect(user.save).to eq(false)
            expect(user.errors[:password]).to eq(["is invalid"])
        end
       
        it 'will raise error when password also contain one number   ' do
        
            user = build(:user, password: "HAPPY")
            expect(user.save).to eq(false)
            expect(user.errors[:password]).to eq(["is invalid"])
        end

        it 'will raise error when password is smaller than 8 char   ' do
        
            user = build(:user, password: "HAPY@a1")
            expect(user.save).to eq(false)
            expect(user.errors[:password]).to eq(["is invalid"])
        end
    end
end
