module ApplicationHelper
 #Confirms a logged in user
    def logged_in_user
      #check if user logged_in is true
      unless logged_in?
        #call the method store_location which locat at app/helper/session_helper
        store_location
        #set the flash message with danger key
        flash[:danger]="Please log in."
        #link to loggin page
        redirect_to login_url
      end
    end
end
