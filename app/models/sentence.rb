class Sentence < ApplicationRecord

  # Validations
  validates :text, presence: true

  # Associations
  has_many :entities
end
