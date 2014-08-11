class LettersController < ApplicationController
  def new
    @previous_letter = Letter.most_recent

    @letter = Letter.new
  end

  def create
    Letter.create(letter_params)

    redirect_to root_path
  end

  private

  def letter_params
    params.require(:letter).permit(:body)
  end
end
