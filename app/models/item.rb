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

def check_boundaries
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
