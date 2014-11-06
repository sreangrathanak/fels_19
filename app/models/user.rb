class User < ActiveRecord::Base
#create the accessible attribut remember_token
attr_accessor :remember_token
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

#define the method for the return of user password in string to make more secure
def User.digest(string)
	#declare the cost to get BCrypt Engine after checked on  ActiveModel SecurePassword
	cost=ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	#return the string of password after convert
	BCrypt::Password.create(string,cost: cost)
end
#define the method for return the random token
def User.new_token
	#return the Secure Random of url 
	SecureRandom.urlsafe_base64
end
#return a user in the database for use in persistent sessions.
def remember
	#assign remember_token attribute with the methos User.new_token that we define above which its function is return Secure Random url
	self.remember_token=User.new_token
	#update attribute into database which user User.digest methods to convert string above
	update_attribute(:remember_digest,User.digest(remember_token))
end
#define the methods to return the boolean with the compare of remember_token and remember_digest
def authenticated?(remember_token)
	#return false if no remember digest in the database
	return false if remember_digest.nil?
	#Return true if remember digest and remember token is match or false if not
	BCrypt::Password.new(remember_digest).is_password?(remember_token)
end
#define methods for forget user
def forget
	#update the attibute remember digest with empty
	update_attribute(:remember_digest,nil)
end
end
