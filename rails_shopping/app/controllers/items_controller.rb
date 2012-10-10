class ItemsController < ApplicationController
  before_filter :get_user
  def get_user
    @current_user = current_user
  end
  respond_to :html, :json
  def index
    respond_with Item.all
  end
  def show
    respond_with(Item.find(params[:id]))
  end
  def create
    item = Item.create! :title => params[:title], :price => params[:price], :state => 'Stocked', :posted_on => DateTime.now, :user => @current_user
    item.save()
    render json: item
  end
  def update
    item = Item.find(params[:id])
    item.state = params[:state]
    @current_user.orders.last.items << item
    item.order = @current_user.orders.last
    item.save()
    render :json => item
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy()
    render :text => "item destroyed", :content_type => "text/plain"
  end
end