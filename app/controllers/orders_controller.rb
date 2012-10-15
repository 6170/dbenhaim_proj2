class OrdersController < ApplicationController
  before_filter :get_user
  def get_user
    @current_user = current_user
  end
  respond_to :html, :json
  def index
    @orders = @current_user.orders
    render :json => @orders.to_json(:include => :items)
  end
  def show
    respond_with(Order.find(params[:id]))
  end
  def create
    order = Order.create! :state => 'Active', :user => @current_user
    order.save()
    render json: order
  end
  def update
    order = Order.find(params[:id])
    order.state = params[:state]
    order.save()
    render :json => order
  end
  def destroy
    order = Order.find(params[:id])
    order.destroy()
    render :text => "item destroyed", :content_type => "text/plain"
  end
end