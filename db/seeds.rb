# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Item.delete_all

AgedItem.new(name: "Aged Brie").save!
LegendaryItem.new(name:"Sulfurus Sword").save
EventItem.new(name: "Backstage Pass").save!
ConjuredItem.new(name: "Conjured Shield").save!
Item.new(name: "Regular Shield").save!
