class Entity < ApplicationRecord
  # Validations
  validates :text, presence: true
  validates :type_of, presence: true
  validates :sentence, presence: true
  validate :presence_of_text_in_original_sentence_available_phrases

  # Associations
  belongs_to :sentence

  def formatted_text
    formatted = "<span id=\"entity-#{self.id}\" class=\"entity\" data-type-of=\"#{self.type_of}\">#{self.text} "
    formatted += "<span class=\"type_of\">#{self.type_of}</span>"
    formatted += "</span>"

    formatted
  end

  private

  # TODO: Refactor with a more functional approach (If time is available)
  def presence_of_text_in_original_sentence_available_phrases
    present = false
    available_phrases = self.sentence.available_phrases

    available_phrases.each do |phrase|
      if phrase.include?(self.text)
        present = true
        break
      end
    end

    unless present
      self.errors.add(:text, "Entity's text must be present in the original sentence")
    end
  end
end
