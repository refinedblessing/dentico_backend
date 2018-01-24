class Api::V1::ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :update, :destroy]

  # GET /receipts?payment_type=cash&start_time=datetime&end_time=datetime&total=true
  def index
    if params[:payment_type]
      @receipts = Receipt.where({payment_type: params[:payment_type]})
    elsif params[:start_time] && params[:end_time]
      @receipts = Receipt.between(params[:start_time], params[:end_time])
    elsif params[:start_time] && params[:end_time] && params[:payment_type]
      @receipts = Receipt.where({payment_type: params[:payment_type]})
        .between(params[:start_time], params[:end_time])
    else
      @receipts = Receipt.all
    end

    if params[:total]
      total = @receipts.sum(:cost)
      render json: { total: total }
    else
      render json: @receipts
    end
  end

  # GET /receipts/1
  def show
    render json: @receipt
  end

  # POST /receipts
  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      render json: @receipt, status: :created, location: api_v1_receipt_url(@receipt)
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /receipts/1
  def update
    if @receipt.update(receipt_params)
      render json: @receipt
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /receipts/1
  # def destroy
  #   @receipt.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def receipt_params
      params.require(:receipt).permit(:payment_type, :cost, :appointment_id)
    end
end
