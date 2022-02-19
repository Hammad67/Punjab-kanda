class SendMessagesController < ApplicationController
  before_action :set_send_message, only: %i[ show destroy ]
  def index
    @send_messages = SendMessage.all
  end

  def show
  end

  def new
    @send_message = SendMessage.new

  end

  def create
    @messages_errors=[]
    binding.pry
    if params[:party_id].present?
      params[:party_id].each do |party_id|
        save_messages_party(party_id.to_i)
      end
    elsif params[:driver_id].present?
      save_messages_driver(params[:driver_id].to_i)
    end
    if @messages_errors.present?
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @send_message.errors, status: :unprocessable_entity }
    else
      redirect_to root_path, notice: "Message Send Succesfully"
    end
  end
  def destroy
    @send_message.destroy
    respond_to do |format|
      format.html { redirect_to send_messages_url, notice: "Send message was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def save_messages_party(party_id)
    @send_message = SendMessage.new(send_message_params)
    @send_message.party_id = party_id
    if !@send_message.save
      party_name = Party.find_by(id: party_id).name
      @messages_errors << party_name
    end
  end
  def save_messages_driver(driver_id)
    @send_message = SendMessage.new(send_message_params)
    @send_message.driver_id = driver_id
    if !@send_message.save
      driver_name = Driver.find_by(id: driver_id).name
      @messages_errors << driver_name
    end
  end

  private
  def send_message_params
    params.require(:send_message).permit(:srial_number, :vehicle_number, :product, :weight_type, :before_load_weight, :after_load_weight, :net_weight, :cash)
  end
end
