class Brie < Item
  def initialize
    super(name: "Aged Brie")
    self.sellin = 999
  end
 
  def update_values
      self.quality = self.quality + 1
      enforce_boundaries
  end
end