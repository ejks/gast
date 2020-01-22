class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :owned_deals]

  def show
    render json: @customer
  end

  def owned_deals
    @deals = @customer.deals
    render templates: 'api/v1/customers/owned_deals.json.jbuilder'
  end

  private

  def set_customer
    @customer = Customer.includes(:user, deals: [:promotion]).find(params[:id])
  end
end

