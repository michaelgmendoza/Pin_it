class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :pin
  # prevent a like from being created with the same pin_id and user_id
  validates_uniqueness_of :pin_id, scope: :user_id

end
