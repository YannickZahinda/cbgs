class Admin::LettersController < ApplicationController

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      flash[:success] = "Message envoye"
      redirect_to letters_path
    else
      render :new
    end
  end

  private

  def letter_params
    params.require(:letter).permit(:sender_id, :recipient_id, :subject, :body)
  end

end