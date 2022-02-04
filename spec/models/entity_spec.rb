require 'rails_helper'

RSpec.describe Entity, type: :model do
  # Validations
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:type_of) }
  it { should validate_presence_of(:sentence) }

  # Associations
  it { should belong_to(:sentence) }
end
