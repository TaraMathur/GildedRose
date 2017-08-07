# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Item.delete_all

Brie.new.save!
SulfarusSword.new.save!
BackstagePass.new.save!
ConjuredShield.new.save!
Item.new(name: "Regular Shield").save!
