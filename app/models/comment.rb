class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }

  belongs_to :user
  belongs_to :opinion
end
