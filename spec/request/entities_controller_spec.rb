require 'rails_helper'

# Look at the other request specs, the ones in the ETH NFT Ethereum
describe 'EntitiesController', type: :request do
  describe "#create_entity" do
    context "valid parameters" do
      it "creates a new entity with valid parameters and redirects back to the sentence page" do
        sentence = Sentence.first
        text = sentence.available_phrases[0]
        params = {text: text, type_of: "Financial Market"}
        post "/sentences/#{sentence.id}/entity", params: params

        # HTTP Response assertions
        expect(response).to redirect_to("/sentences/#{sentence.id}")

        # Side effects assertions
        entity = Entity.last

        expect(entity.text).to eq(params[:text])
        expect(entity.type_of).to eq(params[:type_of])
      end
    end

    context "invalid parameters" do
      it "does not create a new entity and redirects back to the sentence page" do
        prev_total_entities = Entity.count
        sentence = Sentence.first
        text = sentence.entities[0].text
        params = {text: text, type_of: "Financial Market"}
        post "/sentences/#{sentence.id}/entity", params: params

        # HTTP Response assertions
        expect(response).to redirect_to("/sentences/#{sentence.id}")

        # Side effects assertions
        expect(Entity.count).to eq(prev_total_entities)
      end
    end

  end
end