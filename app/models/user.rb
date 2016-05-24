class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable, :confirmable,
     :omniauthable, :omniauth_providers => [:facebook]

def self.new_with_session(params, session)
   super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
 end

def self.find_from_hash(hash)
find_by_provider_and_uid(hash['provider'], hash['uid'])
end

def self.find_or_create(auth_hash)
	p "DSFDSFDSFDSFDSFDSF"
	p auth_hash
	p auth_hash['info']['email']
	p "DDFDGFDGFDGFDGFDGFDG"
unless user = User.find_by_email(auth_hash["info"]["email"])
 email = "#{auth_hash['uid']}@gmail.com"
uid = auth_hash["uid"]
provider = auth_hash["provider"]
user = User.new :email => email, :uid => uid, :provider => provider
 user.save(:validate => false)
 end
 return user
end



protected

  def confirmation_required?
    self.provider.nil?
  end


end

