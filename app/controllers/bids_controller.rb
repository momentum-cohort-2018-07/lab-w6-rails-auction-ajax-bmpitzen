class BidsController < ApplicationController

  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      respond_to :js, @bid.item, notice: 'Your bid has been recorded!'
    else
      @item = @bid.item
      render "items/show"
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :item_id)
  end
end
