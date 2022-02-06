require 'rails_helper'

RSpec.describe Entity, type: :model do
  # Validations
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:type_of) }
  it { should validate_presence_of(:sentence) }

  # Example Text:
  # "Securities volatile dividends Standard & Poor's tax substantially fluctuate debt. Income term securities mutual funds junk bonds. Capitalization investment grade bonds."
  describe "validate presence of the text in the original sentence's available phrases" do
    it "is not present" do
      original_sentence_text = "Securities volatile dividends Standard & Poor's tax substantially fluctuate debt."
      sentence = Sentence.new(text: original_sentence_text)
      sentence.entities = [
        Entity.new(text: "Securities", type_of: "Financial Instrument"),
        Entity.new(text: "Standard & Poor's", type_of: "Rating Agency")
      ]
      sentence.save

      new_entity = Entity.new(text: "tax exemption", type_of: "Fiscal benefit", sentence: sentence)

      expect(new_entity.valid?).to be false
      expect(new_entity.errors[:text]). to eq(["Entity's text must be present in the original sentence"])
    end

    it "is present" do
      original_sentence_text = "Securities volatile dividends Standard & Poor's tax substantially fluctuate debt."
      sentence = Sentence.new(text: original_sentence_text)
      sentence.entities = [
        Entity.new(text: "Securities", type_of: "Financial Instrument"),
        Entity.new(text: "Standard & Poor's", type_of: "Rating Agency")
      ]
      sentence.save

      new_entity = Entity.new(text: "debt", type_of: "Financial Concept", sentence: sentence)

      expect(new_entity.valid?).to be true
    end
  end

  describe "prevent duplicated entities for the same parent sentence when saving" do
    describe "new sentence" do
      it "is a duplicate" do
      end

      it "is not a duplicate" do
      end
    end

    describe "existing sentence" do
      it "is a duplicate" do
      end

      it "is not a duplicate" do

      end
    end
  end

  # Associations
  it { should belong_to(:sentence) }

  describe "#formatted_text" do
    it "generates the right formatted text" do
      entities = Entity.all

      entities.each do |entity|
        expected_text = "<span id=\"entity-#{entity.id}\" class=\"entity\" data-type-of=\"#{entity.type_of}\">#{entity.text} "
        expected_text += "<span class=\"type_of\">#{entity.type_of}</span>"
        expected_text += "</span>"

        expect(entity.formatted_text).to eq(expected_text)
      end
    end
  end
end
