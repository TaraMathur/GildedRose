class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def group_regenerate
		Rails.application.load_seed
	
		@items = Item.all
		render 'index'
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