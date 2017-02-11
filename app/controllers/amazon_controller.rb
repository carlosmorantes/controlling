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
end
