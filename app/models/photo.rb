class Photo < ApplicationRecord
  belongs_to :user
  has_attached_file :image, dependent: :destroy
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
