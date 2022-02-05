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

        # TODO: CSS Stuff
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
        #             - TODO: Assert existence of CSS rules (Optional) (EXTREMELY OPTIONAL)
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