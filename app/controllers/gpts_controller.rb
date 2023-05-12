class GptsController < ApplicationController
  # before_action :set_gpt, only: %i[ show edit update destroy ]

  # GET /gpts or /gpts.json
  def index
    @gpts = Gpt.all
  end

  # GET /gpts/1 or /gpts/1.json
  def show

    render "ai_agent/index.html.erb"
  end

  # GET /gpts/new
  def new
    @gpt = Gpt.new
  end

  # GET /gpts/1/edit
  def edit
  end

  # POST /gpts or /gpts.json
  def create
    @gpt = Gpt.new(gpt_params)


    respond_to do |format|
      if @gpt.save

        client = OpenAI::Client.new(access_token: "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")

        api_messages_array = Array.new

        api_messages_array.push(
          { role: "system", content: "You are a personal agent. Use positive psychology to answer your client's questions, giving sound advice." }
        )
  
        user_messages = Gpt.where({ :user_id => current_user.id }).order(:created_at)
  
        user_messages.each do |the_message|
          message_hash = { :role => the_message.role, :content => the_message.content }
  
          api_messages_array.push(message_hash)
        end
  
        response = client.chat(
          parameters: {
            model: "gpt-3.5-turbo",
            messages: api_messages_array,
            temperature: 1.0,
          },
        )
  
        assistant_message = Gpt.new
        assistant_message.user_id = 999
        assistant_message.role = "assistant"
        assistant_message.recipient_id = current_user.id
        assistant_message.content = response.fetch("choices").at(0).fetch("message").fetch("content")
        assistant_message.save

        p assistant_message.errors.full_messages


        format.html { redirect_to ai_show_path(current_user.id)}
        format.json { render :show, status: :created, location: @gpt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gpts/1 or /gpts/1.json
  def update
    respond_to do |format|
      if @gpt.update(gpt_params)
        format.html { redirect_to gpt_url(@gpt), notice: "Gpt was successfully updated." }
        format.json { render :show, status: :ok, location: @gpt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gpts/1 or /gpts/1.json
  def destroy
    @gpt.destroy

    respond_to do |format|
      format.html { redirect_to gpts_url, notice: "Gpt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_gpt
    #   @gpt = Gpt.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def gpt_params
      params.require(:gpt).permit(:content, :role, :user_id)
    end
end
