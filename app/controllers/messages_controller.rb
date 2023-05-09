class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
    @the_user = User.find_by!(id: current_user.id)
  end

  def agent_messages
    @messages = Message.all
    @the_agent = Agent.find_by!(id: current_agent.id)
  end

  def agent_show
    @the_agent = Agent.find_by!(id: current_agent.id)
  end

  # GET /messages/1 or /messages/1.json
  def show
    @the_user = User.find_by!(id: current_user.id)
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        if user_signed_in?
          format.html { redirect_to message_url(@message.agent_id), notice: "Message was successfully created." }
          format.json { render :show, status: :created, location: @message }
        elsif agent_signed_in?
          format.html { redirect_to agent_messages_url(@message.user_id), notice: "Message was successfully created." }
          format.json { render :show, status: :created, location: @message }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:user_id, :agent_id, :content, :subject, :read_receipt_user, :read_receipt_manager, :reaction_user, :reaction_manager, :sender_id)
    end
end
