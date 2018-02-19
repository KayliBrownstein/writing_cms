class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(email: data['email']).first
    if user
      return user
    else
      registered_user = User.where(email: access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          first_name: data["first_name"],
          last_name: data["last_name"],
          provider: access_token.provider,
          email: data["email"],
          photo: data["image"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
end
