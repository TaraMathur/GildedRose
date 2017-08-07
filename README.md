# README - Gilded Rose Inventory System v1

RUNNING THE APP

You'll need to have Ruby on Rails installed and the Gilded Rose repo on your computer.

To run the app:
1. From the terminal window navigate to the folder that contains the Gilded Rose repo
2. Run the following at the command line:
   $rake db:seed
   $rails s
3. Go to localhost:3000 in your browser.

You should see a page with an Inventory Table populated with items, and an Update button.  Each time you click the Update button, the values in the table will refresh according to the update rules of each item type.

To refresh the page and get a fresh set of values, rerun $rake db:seed and then reload localhost:3000.
(Each time $rake db:seed is run, the database gets wiped clean and new instances of the items are created with new quality and sell-in values.)

STRUCTURE

The class Item has four attributes: name, type, quality, and sell-in.
Each Item's quality and sell-in attribute values are assigned random values after the Item is created.
There's a subclass for each type of item that has special update rules.

To extend this with new inventory items:
- To add inventory items that don't have special update rules, simply instantiate a new Item and assign the name attribute value.  e.g. Item.new(:name = "NewItemName")
- To add an inventory item that *does* have special update rules, define a new subclasses of Item that has an update_values method that reflects the special update rules.

Each click of the Update button triggers a call to the group_update method which is defined in app/controllers/items_controller.rb.  The group_update method in turn makes calls to the update_values methods of each of the different items (defined in various files in the model folder), and saves the updated values to the database.


DOCUMENTATION USED
I chose to build this in Rails because it's the framework I'm most familiar with.  I mainly referred to online Ruby on Rails reference guides and StackOverflow for help debugging some issues I ran into hooking everything into Rails.
For example, the following pages helped me understand ActiveRecord inheritance and figure out how to initialize class values, respectively:
- http://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html
- http://guides.rubyonrails.org/active_record_callbacks.html

TIME
I spent about 9 hours on this in total.  If I had tracked item info in variables instead of saving them to the db it may have been simpler to implement - but not as cool.  It took me time to figure out how to seed the database and to debug a few things related to that, and some other Rails quirks.

WHAT'S LEFT
* Add automated testing.  To set up testing, I'd follow this: http://willschenk.com/setting-up-testing/.  I'd test things like:
- whether the Quality and Sell-In values are within bounds
- whether the Update button works
- I'd write a test for each kind of Item with different Quality and Sell-in values to make sure the corresponding update logic is correct.
* Load the database seeds programmatically, so the user can skip the $rails db:seed step
