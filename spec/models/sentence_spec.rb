require 'rails_helper'

RSpec.describe Sentence, type: :model do
  # Attributes Validations
  it { should validate_presence_of(:text) }

  # Associations
  it { should have_many(:entities) }

  # Behavior
  describe "identifying entities inside a sentence" do
    pending "Implement when it corresponds"
  end
end
