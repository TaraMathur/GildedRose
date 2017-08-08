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

	# Runs db/seeds.rb - which refreshes the db with a new set of Items
	def group_reload
		Rails.application.load_seed 
		@items = Item.all
		render 'index'
	end

end