class User < ActiveRecord::Base
#use method before save to run before save for convert the email into lower case
before_save {email.downcase!}
#check that user name cannot be blank and have maximum length 50 charater
validates :name, presence: true, length:{maximum: 50}
#declare constant variale for user email format
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
#check that user email cannot be blank and have maximum length 80 charater
#one email can have only for one user and not care about letter case
validates :email, presence: true, length:{maximum: 80},format: {with:VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
#add method has secure password for make password more secure
has_secure_password
#user password must have and have length at leave 6 charater
validates :password, length: {minimum: 6}
end
