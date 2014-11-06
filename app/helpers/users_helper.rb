module UsersHelper
#define global method for use in this App which function use to show user photo by following their eamil address
#and with its size
def gravatar_for(user, options={size:80})
	#convert user email to hexa number and store into gravatar_id
	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	#declare size variable for staore the size of image
	size=options[:size]
	#declare gravarta_url to store link of user image which we convert into size we want
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #return the user photo 
    image_tag(gravatar_url, alt: user.name, class: "gravatar")	
end
end
