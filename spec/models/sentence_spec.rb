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
          expected_text = expected_text.gsub(/#{entity.text}/, entity.formatted_text)
        end

        expect(sentence.formatted_text).to eq(expected_text)
      end
    end
  end
end
