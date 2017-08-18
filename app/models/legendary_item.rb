class LegendaryItem < Item
  def initialize(name)
        super(name)
    	self.sellin = nil
  end
  
  def update_values
  	enforce_boundaries
  end
end