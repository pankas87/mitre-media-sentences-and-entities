require 'rails_helper'

RSpec.describe Entity, type: :model do
  # Validations
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:type_of) }
  it { should validate_presence_of(:sentence) }

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

  describe "presence of entity in sentence" do
    pending "it should raise a validation error if the entity's text is not present in the text of the parent sentence"
    pending "it should not raise a validation error if the entity's text is present in the text of the parent sentence"
  end

  describe "prevent duplicated entities for the same parent setting when saving" do
    pending "it should raise a validation error if the entity's text is already being used by a sibling entity"
    pending "it should not raise a validation error if the entity's text is not being used by a sibling entity"
  end
end
