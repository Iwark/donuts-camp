class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :entries
  has_many :camps, through: :entries

  validates :email, presence: true, format: { with:/@donuts.ne.jp\z/ }

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first
 
    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end

    entry = Entry.where(user_id: user.id, camp_id: 1).first
    if entry
      if entry.status != "going"
        entry.status = "going"
        entry.save
      end
    else
      Entry.create(user_id: user.id, camp_id: 1, status: "going")
    end

    user
  end
end
