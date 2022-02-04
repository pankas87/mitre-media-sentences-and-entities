require "rails_helper"

RSpec.describe "ViewSentences", :type => :system do
  describe "List of Sentences" do
    it "shows a formatted list of sentences" do
      visit "/sentences"

      pending "Assert: The list of sentences is correct"
      pending "Assert: The format is correct"
    end
  end

  describe "Show one Sentence" do
    it "shows the requested sentence" do
      pending "Assert: The displayed sentences is correct"
      pending "Assert: The format is correct"
    end
  end
end