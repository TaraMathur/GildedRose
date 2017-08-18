class EventItem < Item

    def update_values
      self.sellin = self.sellin - 1

      if (self.sellin < 0)
          self.quality = 0
      elsif (self.sellin <= 5)
          self.quality = self.quality + 3
      elsif (self.sellin <= 10)
          self.quality = self.quality + 2
      else
          self.quality = self.quality + 1
      end
      enforce_boundaries
    end

end