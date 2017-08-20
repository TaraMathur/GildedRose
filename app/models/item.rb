class Item < ApplicationRecord
  def initialize(name)
    super
  	self.quality = rand(10...49)
  	self.sellin = rand(10...30)
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

    if (!self.quality.nil?)
      if (self.quality < 0 )
        self.quality = 0
      end

      if (self.quality > 50)
        self.quality = 50
      end
    end

    if (!self.sellin.nil? && self.sellin < 0 )
      self.sellin = 0
    end
 end

end

