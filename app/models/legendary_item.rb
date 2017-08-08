class LegendaryItem < Item
  def initialize(name)
        super(name)
    	self.sellin = 999
  end
  def update_values
  	enforce_boundaries
  end
end