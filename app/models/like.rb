class Like < ApplicationRecord
  validates :api_key, presence: true

  belongs_to :user
end
