class EntitiesController < ApplicationController
  def create
    @sentence = Sentence.find(params[:sentence_id])

    @entity = Entity.new(sentence_params)
    @entity.sentence = @sentence
    # TODO: Set flash error message for the frontend (If time is available)
    unless @entity.save
      flash[:error] = @entity.errors
    end

    redirect_to "/sentences/#{@sentence.id}"
  end

  private

  def sentence_params
    params.permit(:text, :type_of)
  end
end