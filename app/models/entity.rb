class Entity < ApplicationRecord
  # Validations
  validates :text, presence: true
  validates :type_of, presence: true
  validates :sentence, presence: true

  # Associations
  belongs_to :sentence

  def formatted_text
    formatted = "<span id=\"entity-#{self.id}\" class=\"entity\" data-type-of=\"#{self.type_of}\">#{self.text} "
    formatted += "<span class=\"type_of\">#{self.type_of}</span>"
    formatted += "</span>"

    formatted
  end
end
