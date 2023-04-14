class Admin::MessagesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :check_if_admin
  # before_action :set_message, only: %i[index show update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
    @message = Message.find(params[:id])
  end

  # GET /messages/new
  # def new
  #   @message = Message.new
  # end

  # GET /messages/1/edit
  # def edit
  # end

  # POST /messages or /messages.json
  # def create
  #   @message = Message.new(message_params)

  #   respond_to do |format|
  #     if @message.save
  #       format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
  #       format.json { render :show, status: :created, location: @message }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /messages/1 or /messages/1.json
  # def update
  #   respond_to do |format|
  #     if @message.update(message_params)
  #       format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
  #       format.json { render :show, status: :ok, location: @message }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to admin_home_index_path, notice: "Message efface avec succes." }
      format.json { head :no_content }
    end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_message
    #   @message = Message.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    # def message_params
    #   params.require(:message).permit(:name, :titre, :description)
    # end
end
