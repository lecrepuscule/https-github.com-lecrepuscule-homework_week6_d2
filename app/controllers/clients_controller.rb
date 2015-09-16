class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new_trade
    @client = Client.find(params[:id])
    @trade = @client.trades.new
  end

  def create_trade
    @client = Client.find(params[:id])
    deal_id = @client.trades.max.deal_id + 1
    if @client.trade_portfolio(params[:trade][:portfolio_id], params[:trade][:quantity], deal_id)    
      redirect_to @client
    end
  end

  private
  def trade_params
    params.require(:trade).permit!
  end

end
