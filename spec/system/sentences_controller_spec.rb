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

      sentence.available_phrases.each_with_index do |phrase, phrase_index|
        available_phrase_wrapper = find("#sentence-#{sentence.id}-available-phrase-#{phrase_index}")
        full_phrase_paragraph = available_phrase_wrapper.find(".full-phrase")

        expect(available_phrase_wrapper).not_to be_nil
        expect(full_phrase_paragraph.text).to eq(phrase)

        phrase_words_list = available_phrase_wrapper.find("ul.phrase-words-list")

        pending "Split available phrase into words, test individually"
        phrase.split(/\s/).each_with_index do |word, word_index|
          selector = ".word-#{word_index}"
          word_element = phrase_words_list.find(selector)

          expect(word_element).not_to be_nil
          expect(word_element.text).to eq(word)
        end

      end
    end

    it "displays the New Entity form" do
      sentence = Sentence.first
      visit "/sentences/#{sentence.id}"

      #TODO: Implement
      element_selector = "#new-entity-form"
      element = find(element_selector)

      expect(element).not_to be_nil

      # Form Assertions:
      text_text_input_selector = element.find("#text-text-input")
      type_of_text_input_selector = element.find("#type_of-text-input")
      submit_selector = element.find("button[type=\"submit\"]")


      expect(text_text_input_selector).not_to be_nil
      expect(type_of_text_input_selector).not_to be_nil
      expect(submit_selector).not_to be_nil
      pending "The action and method attributes of the form are correct"
    end
  end
end