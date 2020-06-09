class Opinion < ApplicationRecord
  # validations
  validates :text, length: { maximum: 140 }, presence: true
  # associations
  belongs_to :user, foreign_key: 'author_id'
end
