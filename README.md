# README - Gilded Rose Inventory System v1

ITEM UPDATE RULES

All inventory items have "sell-in" values which denote the number of days we have left to sell them and a quality value that denotes their worth.

For most items:
- The quality degrades by one per day.
- The quality drops twice as fast once the sell in value reaches 0.
- Neither the sell in value nor the quality value can be less than 0.
- The quality value can never be greater than 50.

Some items have special update rules:
- "Aged Brie" increases in quality the older it gets and it never degrades.
- "Sulfarus" never has to be sold and it never decreases in quality.
- "Backstage Pass" increases in quality as its sell in value approaches.  Quality increases by 2 per day when there are 10 days or less left and by 3 per day when there are 5 days or less left, but quality drops to 0 after the concert.
- "Conjured" items degrade in quality twice as fast as normal items.

--------------

RUNNING THE APP

You'll need to have Ruby on Rails installed and the Gilded Rose repo on your computer.

To run the app:
1. From the terminal window navigate to the folder that contains the Gilded Rose repo, then type $rails s

2. Go to localhost:3000 in your browser.  You should see a table populated with a list of different items and Sell-In and Quality values for each item which have been randomly generated.

3. Click the Update button to see how the Quality and Sell-in values change over time

4. To refresh the table with new (random) Quality and Sell-in values, click the Reload the Table with Fresh Values button.

--------------

HOW IT WORKS

The Inventory Table is pre-populated, or seeded, with a list of items and each item is given random sell-in and quality values.
(The database is seeded in db/seeds.rb and the random sell-in and quality values are generated in the setup method in models/items.rb.)

Each click of the Update button triggers a call to the group_update method defined in app/controllers/items_controller.rb.  The group_update method in turn makes calls to the update_values methods of each of the different items in the table, and saves the updated values to the database.

Each click of the Reload button runs db/seeds.rb, which deletes all records in the db and recreates new ones with fresh values.

There's a superclass called Item which has four attributes: name, type, quality, and sell-in.
Item has 4 subclasses - EventItem, ConjuredItem, AgedItem, and LegendaryItem - each with its own set of update rules.  All classes are defined in files in the model folder.

To extend this with new inventory items:
- To add inventory items that don't have special update rules, in db/seeds.rb simply create and save a new Item and assign the name attribute value.  e.g. Item.new(:name = "NewItemName").save!
- To add an inventory item that *does* have unique update rules, define a new subclasses of Item that has an update_values method that reflects its update rules.  Then in db/seeds.rb create and save that new Item, e.g. NewKindOfItem.new.save!

--------------

DOCUMENTATION USED

I chose to build this in Rails because it's the framework I'm most familiar with.  I mainly referred to online Ruby on Rails reference guides and StackOverflow for help debugging some issues I ran into hooking everything into Rails.
For example, the following pages helped me understand ActiveRecord inheritance and figure out how to initialize class values, respectively:
- http://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html
- http://guides.rubyonrails.org/active_record_callbacks.html

--------------

TIME

I spent about 9 hours on this in total.  If I had tracked the inventory info in variables instead of saving them to the db, it may have been simpler to implement and I wouldn't have needed the Reload button on the page.  It took me time to figure out how to seed the database and to debug a few things related to that, and to debug my way around some Rails quirks.

I think my code is modular and scalable - and I'm looking forward to talking about it and hearing your feedback on how it could be improved.

With more time, I would:
1. Write unit tests.  I've created Fixtures (in the test/fixtures folder) for each type of item, with different sets of quality/sell-in values to test the various parts of the update logic.  I just need to write the actual tests to run through each of them and check the output.
2. It might be possible to make the code even more scalable by abstracting out the defining quality of each subclass as a separate subclass layer.
For example, could there be other items besides Legendary Items which don't need to be sold and whose value never degrades?  If yes then it might make sense to have an Item subclass called FixedValuesItem and have LegendaryItem be a subclass of that.