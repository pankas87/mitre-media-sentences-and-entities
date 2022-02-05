class Sentence < ApplicationRecord

  # Validations
  validates :text, presence: true

  # Associations
  has_many :entities

  def formatted_text
    formatted_text = self.text

    self.entities.each do |entity|
      regex_for_find_and_replace = Regexp.new Regexp.quote entity.text
      formatted_text = formatted_text.gsub(regex_for_find_and_replace, entity.formatted_text)
    end

    formatted_text
  end
end
