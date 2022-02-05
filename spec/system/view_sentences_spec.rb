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

  describe "Individual Sentence" do
    it "shows the formatted sentence" do
      pending "Implement"
    end

    # Available words: Words that are part of the sentence that are not part of an entity yet
    it "shows a list of available words that can be combined to create a new entity" do
      pending "implement"
    end

    it "displays the New Entity form" do
      # Probable inputs:
      #   - A sentence_id hidden field
      #   - A type_of text input
      #   - Via JS, when a word is added (Try and test this):
      #     - For every word, one text input with the name words[] to group them in one array
      pending "implement"
    end

    pending "for the creation of the New Entity, use a request spec that receives the parameters via HTML form"
  end
end