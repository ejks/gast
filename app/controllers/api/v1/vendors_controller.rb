class Api::V1::VendorsController < ApplicationController
  # @FIXME: check if other way instead of skip auth
  # this is for InvalidAuthenticityToken in create_promotion method
  skip_before_action :verify_authenticity_token
  before_action :set_vendor, only: [:show, :create_promotion, :saved_promotions]

  def show
    render json: @vendor
  end

  def create_promotion
    @vendor.promotions.create!(promotion_params)

    render json: { status: :ok, message: 'Success to create a promotion' }

    rescue => e
      render json: { status: :bad_request, message: e.message}
  end

  def saved_promotions
    render templates: 'api/v1/vendors/saved_promotions.json.jbuilder'
  end

  private

  def set_vendor
    @vendor = Vendor.find_by_id(params[:id])
  end

  def promotion_params
    params.require(:promotion).permit(:name, :description, :start_time, :end_time, :status, :photo_img)
  end
end

