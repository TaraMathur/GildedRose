class SulfarusSword < Item
  def initialize
    super(name: "Sulfarus the Legendary Sword")
    self.quality = 50
    self.sellin = 999
  end
  def update_values
  	enforce_boundaries
  end
end