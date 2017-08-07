class ConjuredShield < ConjuredItem
    def initialize
      super(name: "Conjured Shield")
    end

    def update_values
      if(self.sellin == 0)
        self.quality = self.quality - 4
      else
        self.quality = self.quality - 2
      end
      self.sellin = self.sellin - 1
      enforce_boundaries
    end
end