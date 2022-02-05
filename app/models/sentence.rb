class Sentence < ApplicationRecord

  # Validations
  validates :text, presence: true

  # Associations
  has_many :entities

  def formatted_text
    formatted_text = self.text

    self.entities.each do |entity|
      formatted_text = formatted_text.gsub(/#{entity.text}/, entity.formatted_text)
    end

    formatted_text
  end
end
