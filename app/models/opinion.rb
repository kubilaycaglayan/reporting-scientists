class Opinion < ApplicationRecord
  # validations

  # associations
  belongs_to :user, foreign_key: 'author_id'
end
