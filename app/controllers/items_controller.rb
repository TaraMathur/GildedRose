class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def group_update
		# some code here that updates each item in the table
	end
end
