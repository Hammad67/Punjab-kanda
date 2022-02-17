class SendMessagesController < ApplicationController
  before_action :set_send_message, only: %i[ show edit update destroy ]

  # GET /send_messages or /send_messages.json
  def index
    @send_messages = SendMessage.all
  end

  # GET /send_messages/1 or /send_messages/1.json
  def show
  end

  # GET /send_messages/new
  def new
    @send_message = SendMessage.new

  end

  # GET /send_messages/1/edit
  def edit
  end

  # POST /send_messages or /send_messages.json
  def create
    partyid = params[:party_id]
    driverid = params[:driver_id]
    if partyid.present?
      partyid.each do |n|
        @send_message = SendMessage.new(send_message_params)
        @send_message.party_id = n
        @send_message.driver_id = driverid
        @send_message.save
        @find_party = Party.find(n)
        name = @find_party.name
        phone_number = @find_party.phone_number
        response= Faraday.post("https://sendpk.com/api/sms.php?username=username&password=password&sender=Masking &mobile=phone_number&message=Hello")
      end
      respond_to do |format|
        if @send_message.save
          format.html { redirect_to send_message_url(@send_message), notice: "Send message was successfully created." }
          format.json { render :show, status: :created, location: @send_message }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @send_message.errors, status: :unprocessable_entity }
        end

      end

    elsif driverid.present?
      @send_message = SendMessage.new(send_message_params)
      @send_message.driver_id = driverid
      @send_message.save
      @find_driver = Driver.find(driverid)
      name = @find_driver.name
      phone_number = @find_driver.phone_number
      respond_to do |format|
        if @send_message.save
          format.html { redirect_to send_message_url(@send_message), notice: "Send message was successfully created." }
          format.json { render :show, status: :created, location: @send_message }
        else
          format.html { redirect_to root_path, notice: "Select Party or driver before sending message." }
          format.json { render json: @send_message.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Select Party or driver before sending message." }
        format.json { render json: @send_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /send_messages/1 or /send_messages/1.json

  # DELETE /send_messages/1 or /send_messages/1.json
  def destroy
    @send_message.destroy

    respond_to do |format|
      format.html { redirect_to send_messages_url, notice: "Send message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_send_message
    @send_message = SendMessage.find(params[:id])
    if @send_message.party_id.present?
      partyid = @send_message.party_id
      @find_party = Party.find(partyid)
      name = @find_party.name
      phone_number = @find_party.phone_number

    else
      driverid = @send_message.driver_id
      @find_driver = Driver.find(driverid)
      name = @find_driver.name
      phone_number = @find_driver.phone_number
      binding.pry
    end
  end

  # Only allow a list of trusted parameters through.
  def send_message_params
    params.require(:send_message).permit(:serial_number, :vehicle_number, :product, :weight_type, :before_load_weight, :after_load_weight, :net_weight, :cash, :party_id, :driver_id)
  end
end
