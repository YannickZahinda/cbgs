class Admin::LettersController < ApplicationController

  def index
    @letters = Letter.all
  end

  def new
    @letter = Letter.new
  end

  def show
    @letter = Letter.find(params[:id])
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      flash[:success] = "Message envoye"
      redirect_to admin_home_index_path
    else
      render :new
    end
  end

  private

  def letter_params
    params.require(:letter).permit(:sender_id, :recipient_id, :nom_du_parent_destinataire, :document, :subject, :body)
  end

end