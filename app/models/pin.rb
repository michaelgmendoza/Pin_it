class Pin < ActiveRecord::Base
  validates_presence_of :description
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_attached_file :pin_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "C/Users/brad/Desktop/projects/pin_it/IMG_0149.JPG"
  validates_attachment_content_type :pin_image, content_type: /\Aimage\/.*\Z/

  def repost(user_object)
    repost_pin = self.dup
    repost_pin.user_id = user_object.id
    repost_pin.image = self.image
    repost_pin.original_pin_id = self.id
    repost_pin.save
  end

  def is_repost?
    original_pin_id.present?
  end

  def original_post
    Pin.find(original_pin_id) if is_repost?
  end




end
