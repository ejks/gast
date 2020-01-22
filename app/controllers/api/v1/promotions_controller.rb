class Api::V1::PromotionsController < ApplicationController
  def index
    @promotions = Promotion.includes(:vendor).all
    render templates: 'api/v1/promotions/index.json.jbuilder'
  end
end

