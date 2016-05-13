



class User <  ActiveRecord::Base
  include Clearance::User
   has_many :authentications, :dependent => :destroy
   has_many :listings
   has_many :purchases
   has_many :reservations, through: :purchases
   mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
  	
    create! do |u|
     u.first_name = auth_hash["info"]["first_name"]
     u.last_name = auth_hash["info"]["last_name"]
     
     u.image = auth_hash["info"]["image"]
     u.email = auth_hash["extra"]["raw_info"]["email"]
     u.password = [*('A'..'Z')].sample(8).join
     u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  def cart_total_price
    user_total = 0
    
    Reservation.where(user_id: self.id).each do  |rez|  
      byebug
     user_total+=rez.totalcost
    end
    byebug
    return user_total
  end



end
