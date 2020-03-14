class Api::V1::CustomersController < ApplicationController
  # @FIXME: check if other way instead of skip auth
  # this is for InvalidAuthenticityToken in get coupon method
  skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:show, :owned_deals, :get_coupon, :show_coupons, :cancel_coupon]

  def show
    render json: @customer
  end

  def owned_deals
    @deals = @customer.deals
    render templates: 'api/v1/customers/owned_deals.json.jbuilder'
  end

  def get_coupon
    @customer.deals.create!(promotion_id: params[:promotion_id])

    render json: { status: :ok, message: 'Success' }
  rescue => e
    render json: { json: e.message, status: :unprocessable_entity }
  end

  def show_coupons
    render json: @customer.active_deals
  end

  def cancel_coupon
    @customer.deals.find_by_id(params[:deal_id]).update!(cancel: true)

    render json: { status: :ok, message: 'Success' }
  rescue => e
    render json: { json: e.message, status: :unprocessable_entity }
  end

  private

  def set_customer
    @customer = Customer.includes(:user, deals: [:promotion]).find(params[:id])
  end
end

