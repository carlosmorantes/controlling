class AmazonController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :update
  before_action :authenticate_user!

  def index
    @amazon = Amazon.find(3)
  end

  def update
    data = amazons_params(params)
    data.each do |k,v|
      Amazon.update(3, k => v.to_s) if new_value(k, v)
    end
    redirect_to :back
  end

  def calculate_price
    amazon_price = params[:amazon_price].to_f
    shipping = params[:shipping_price].to_f
    weight = params[:weight].to_f
    @total_product_price = total_price(amazon_price, shipping)
    @total_insurance = shipping_insurance(@total_product_price)
    @total_freight = freight(weight)
    @total_taxes = taxes(@total_product_price)
    price_in_pesos
    # until here is ok
    redirect_to :back

  end

  private

  def amazons_params(params)
    data ||= {}
    params.each do |k,v|
      next if k == 'controller' || k == 'action' || k == 'id'
      data[k.to_sym] = v
    end
    data
  end

  def new_value(key, value)
    o = Amazon.select(key).first
    true unless value.to_f == o[key].to_f
  end

  def total_price(amazon_price, shipping)
    amazon_price + shipping
  end

  def shipping_insurance(total_price)
    (total_price * Amazon.find(3).insurance.to_f) / 100
  end

  def freight(weight)
    weight * Amazon.find(3).price_lb.to_f
  end

  def taxes(total_price)
    if total_price < 200
      total_price * (Amazon.find(3).customs_duty.to_f / 100)
    else
      total_price * ((Amazon.find(3).iva.to_f + Amazon.find(3).customs_duty.to_f) / 100)
    end
  end

  def nationalization
    @total_insurance + @total_freight + @total_taxes + @total_product_price
  end

  def price_in_pesos
    nationalization * Amazon.find(3).bank_dollar_price.to_f
  end



end
