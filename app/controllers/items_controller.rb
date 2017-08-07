class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def group_update
		@items = Item.all
		if(@items)
			@items.each do |item|
				item.update_values
				item.save!
			end
		end
		redirect_to items_url
	end

end