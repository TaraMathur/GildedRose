class Item < ApplicationRecord
	after_initialize :setup

  def setup
  	if !self.quality
  		if !self.name
  			self.name = "Item"
  		end
  		self.quality = rand(1...50)
  		self.sellin = rand(1...45)
  	end
  end

  def update_values
	    if(self.sellin == 0)
	      self.quality = self.quality - 2
	    else
	      self.quality = self.quality - 1
	    end
	    self.sellin = self.sellin - 1
	    enforce_boundaries
  end

def enforce_boundaries
    if (self.quality < 0 )
      self.quality = 0
    end

    if (self.quality > 50)
      self.quality = 50
    end

    if (self.sellin < 0 )
      self.sellin = 0
    end
 end

end

