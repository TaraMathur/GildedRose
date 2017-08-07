# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Item.delete_all

# quality, sellin
Brie.new(rand(0...50),rand(0...45)).save!