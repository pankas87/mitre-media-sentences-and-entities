require "rails_helper"

RSpec.describe "ViewSentences", :type => :system do
  describe "List of Sentences" do
    it "shows a formatted list of sentences" do
      visit "/sentences"

      expect(page).to have_content 'Sentences'

      sentences = Sentence.all
      expect(sentences.length > 0).to be true

      sentences.each_with_index do |sentence, i|
        element_selector = "#sentence-#{sentence.id}"
        element = find(element_selector)

        expect(element).not_to be_nil

        sentence.entities.each do |entity|
          entity_element = element.find("#entity-#{entity.id}")
          type_of_element = entity_element.find(".type_of")

          expect(entity_element.text).to include(entity.text)
          expect(type_of_element.text).to eq (entity.type_of)
        end
      end
    end
  end
end