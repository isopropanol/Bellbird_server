require 'unirest'

class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :update, :destroy]

  # GET /alarms
  def index
    @alarms = Alarm.all.order(created_at: :desc)

    render json: @alarms
  end

  # GET /alarms/1
  def show
    render json: @alarm
  end

  # POST /alarms
  def create
    @alarm = Alarm.new(alarm_params)
    puts("do i get here?")

    if @alarm.save
      post_to_handshake @alarm.id
      render json: @alarm, status: :created, location: @alarm
    else
      render json: @alarm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alarms/1
  def update
    if @alarm.update(alarm_params)
      render json: @alarm
    else
      render json: @alarm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alarms/1
  def destroy
    @alarm.destroy
  end

  def post_to_handshake a_id
    response = Unirest.post "http://handshake-bellbird.herokuapp.com/push",
                            headers: { "Accept" => "application/json" },
                            parameters: {:alarm_id => a_id} {|response|
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alarm
      @alarm = Alarm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alarm_params
      puts params
      params.require(:alarm).permit(:description)
    end

end
