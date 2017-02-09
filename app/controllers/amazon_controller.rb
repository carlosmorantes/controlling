class AmazonController < ApplicationController
  before_action :authenticate_user!
  def index
    @amazons = Amazon.find(1)
  end
end
