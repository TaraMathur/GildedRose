class Item < ApplicationRecord

  def update_values
	    if(self.sellin == 0)
	      self.quality = self.quality - 2
	    else
	      self.quality = self.quality - 1
	    end
	    self.sellin = self.sellin - 1
	    check_boundaries
  end

end
