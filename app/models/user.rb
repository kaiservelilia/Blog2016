class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :posts
         has_many :comments
         has_many :replies
   end

  
    class User < ActiveRecord::Base
      def self.omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.image = auth.info.image
          user.token = auth.credentials.token
          user.expires_at = Time.at(auth.credentials.expires_at)
          user.save!
      end
    end

    def to_s
      "#{firstname} #{middlename} #{lastname}"
    end
end
