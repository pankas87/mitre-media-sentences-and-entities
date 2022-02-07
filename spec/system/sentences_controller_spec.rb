require "rails_helper"

RSpec.describe "ViewSentences", :type => :system do
  describe "List of Sentences" do
    it "shows a formatted list of sentences" do
      visit "/sentences"

      expect(page).to have_content 'Sentences'

      sentences = Sentence.all

      pending "For every sentence, add a link button to the show page, test that the button is present"

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
      sentence = Sentence.first
      visit "/sentences/#{sentence.id}"

      expect(find("h1").text).to eq("Sentence: #{sentence.id}")

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

    # Available words: Words that are part of the sentence that are not part of an entity yet
    it "shows a list of available phrases/words that can be combined to create a new entity" do
      sentence = Sentence.first
      visit "/sentences/#{sentence.id}"

      expect(find("h1").text).to eq("Sentence: #{sentence.id}")

      element_selector = "#sentence-#{sentence.id}"
      element = find(element_selector)

      expect(element).not_to be_nil

      sentence.available_phrases.each do |phrase|
        # Expect every word of the available phrase to be present in a corresponding wrapper element
      end
    end

    it "displays the New Entity form" do
      # Probable inputs:
      #   - A type_of text input
      #   - A text text input
      pending "implement"
    end
  end
end