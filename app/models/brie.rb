class Brie < Item
  def initialize(quality, sellin)
    super(name: "Aged Brie")
    self.quality = quality
    self.sellin = 999
  end
 
  def update_values
      self.quality = self.quality + 1
      check_boundaries
  end
end