class Api::V1::VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :saved_promotions]

  def show
    render json: @vendor
  end

  def saved_promotions
    render templates: 'api/v1/vendors/saved_promotions.json.jbuilder'
  end

  private

  def set_vendor
    @vendor = Vendor.find_by_id(params[:id])
  end
end

