class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :nickname, presence: true
  validates :nickname_kana, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true


  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
