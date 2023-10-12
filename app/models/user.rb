class User < ApplicationRecord
        has_secure_password
        has_many :articles
    #     PASSWORD_FORMAT = /\A
    #     (?=.{8,})          # Must contain 8 or more characters
    #     (?=.*\d)           # Must contain a digit
    #     (?=.*[a-z])        # Must contain a lower case character
    #     (?=.*[A-Z])        # Must contain an upper case character
    #     (?=.*[[:^alnum:]]) # Must contain a symbol
    # /x
    #     validates :name, length: { minimum: 2 }, presence: true
    #     validates :surname, length: { maximum: 32 }, presence: true
    #     validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    #     validates :password , presence: true, format: { with: PASSWORD_FORMAT }
    #     validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
    #     validates :mobile, presence: true, uniqueness: true, length: { minimum: 10 ,maximum:10}
end