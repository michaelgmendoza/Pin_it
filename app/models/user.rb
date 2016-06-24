class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  has_many :pins, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_pins, through: :likes, source: :pin
  
  validates_uniqueness_of :username

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
