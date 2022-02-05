require "rails_helper"

RSpec.describe "ViewSentences", :type => :system do
  describe "List of Sentences" do
    it "shows a formatted list of sentences" do
      visit "/sentences"

      expect(page).to have_content 'Sentences'

      # TODO: Expect that there is an HTML <ol> with three <li>
      # TODO: Expect that for every sentence in the DB, there is one corresponding <li> with the correct format
      #         - Create the formatted_text in both the Entity and Sentence models
      #           - Format by adding <span> element for entities
      #           - Add the CSS classes with the corresponding color for each type:
      #             - Get all distinct types registered in the DB
      #             - Deterministically generate a color for each type
      #             - each_with_index sorted by alphabetical order
      #             - Add to the CSS rules
      #               <span class="type_of" data-type-of="Sovereign Country">
      #               span.type_of {
      #                 // width, height, padding and whatever stuff is necessary to display the rectangle correctly
      #               }
      #               span.type[data-type="Sovereign Country"] {
      #                 background-color: #367544;
      #               }
      #             - TODO: Assert existence of CSS rules (Optional)

      sentences = Sentence.all
      expect(sentences.length > 0).to be true

      sentences.each_with_index do |sentence, i|
        # TODO: With this one just validate that the sentences are printed, without using the custom text formatting method
        element_selector = "#sentence-1"
        element = find(element_selector)

        expect(element).not_to be_nil
        expect(element.text).to eq(sentence.text)
        # TODO: Implement the text formatting nested methos and test (Probably change the expected text from the previous text)
        pending "The format of the sentence entities text must be correct"
      end
    end
  end

  describe "Show one Sentence" do
    it "shows the requested sentence" do
      pending "Assert: The displayed sentences is correct"
      pending "Assert: The format is correct"
    end
  end
end