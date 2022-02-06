class Sentence < ApplicationRecord

  # Validations
  validates :text, presence: true

  # Associations
  has_many :entities

  def formatted_text
    formatted_text = self.text

    self.entities.each do |entity|
      regex_for_find_and_replace = Regexp.new(Regexp.quote(entity.text))
      formatted_text = formatted_text.gsub(regex_for_find_and_replace, entity.formatted_text)
    end

    formatted_text
  end

  def available_phrases
    phrases = [self.text]

    self.entities.each do |entity|
      split_pattern = Regexp.new(Regexp.quote(entity.text))
      phrases = phrases.reduce([]) do |acc, phrase|
        splat_phrase = phrase.split(split_pattern)
        acc.push(*splat_phrase)
      end
    end
    phrases
  end
end
