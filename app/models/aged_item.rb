class AgedItem < Item
  def initialize(name)
    super(name)
    self.sellin = 999
  end
 
  def update_values
      self.quality = self.quality + 1
      enforce_boundaries
  end
end