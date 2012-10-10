class HomeController < ApplicationController
  before_filter :get_user, :authenticate_user!
  def get_user
	@current_user = current_user
  end
  def index
    @items = Item.all()
    if @current_user.orders == nil
    	@current_order = Order.create! :state => "active", :user => @current_user
    	@current_order.save()
    end
  end
end
