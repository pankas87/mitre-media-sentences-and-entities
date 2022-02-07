require 'rails_helper'

RSpec.describe Sentence, type: :model do
  # Attributes Validations
  it { should validate_presence_of(:text) }

  # Associations
  it { should have_many(:entities) }

  describe "#formatted_text" do
    it "generates the right formatted text" do
      sentences = Sentence.all

      sentences.each do |sentence|
        expected_text = sentence.text

        sentence.entities.each do |entity|
          regex_for_find_and_replace = Regexp.new Regexp.quote entity.text
          expected_text = expected_text.gsub(regex_for_find_and_replace, entity.formatted_text)
        end

        expect(sentence.formatted_text).to eq(expected_text)
      end
    end
  end

  describe "#available_phrases" do
    describe "phrase: consecutive sections of words not separated by an entity" do
      it "case 1" do
        sentence = Sentence.new text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        sentence.entities = [
          Entity.new(text: "dolor sit", type_of: "GES"),
          Entity.new(text: "consectetur", type_of: "ASD"),
        ]
        sentence.save
        expected_phrases = [
          "Lorem ipsum",
          "amet,",
          "adipiscing elit",
        ]

        expect(sentence.available_phrases).to eq(expected_phrases)
      end

      it "case 2" do
        sentence = Sentence.new text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        sentence.save
        expected_phrases = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit"]

        expect(sentence.available_phrases).to eq(expected_phrases)
      end

      # TODO: Make text multiline with paragraph (If time is available)
      pending "case 3: Tax growth 401k volatile yield management holder. Private IRA junk bonds corporate corporate bonds funds exchange investment grade bonds managed comodity Fitch bull stocks. Fitch upswing notes financial health established taxpayer. Managed quarterly debt term Moody's industry Standard & Poor's corporate. Nikkei Fitch volatile. "
    end
  end
end
