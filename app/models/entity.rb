class Entity < ApplicationRecord
  # Validations
  validates :text, presence: true
  validates :type_of, presence: true
  validates :sentence, presence: true

  # Associations
  belongs_to :sentence
end
