# README - Gilded Rose Inventory System v1

ITEM UPDATE RULES

All inventory items have sell-in values which denote the number of days we have left to sell them and a quality value that denotes their worth.

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

4. To refresh the table with new (random) Quality and Sell-in values, click the Start Over button.

--------------

HOW IT WORKS

The schema has four fields: name, sellin, quality, and type.

There's a main model called Item which has 3 methods: 
- initialize, which initializes each Item with a name and random sellin and quality value
- update_values, updates the sellin and quality values
- enforce boundaries, which ensures that the sellin and quality values are never negative or over 50

Item has four sub-classes: EventItem, ConjuredItem, AgedItem, and LegendaryItem - each with its own update_values method that reflects each's unique set of update rules.  The AgedItem and LegendaryItem subclasses also each have their own initialize method.

Aged Brie is an AgedItem object, Sulfarus Sword is a LegendaryItem, BackstagePass is an EventItem, and Conjured Shield is a ConjuredItem, and Regular Shield is just a regular Item.

The controller has 3 methods: 
- index, lists the items in the table
- group_update (tied to the Update button), calls the update_values method of each object in the table
- group_reload (tied to the Start Over button), loads fresh random data into the table

The Inventory Table is seeded with a list of items in db/seeds.rb.

To extend this with new inventory items:
- For regular inventory items, nothing is needed.  You'd simply create a new Item object with its name, e.g. Item.new(:name = "NewItemName").save!
- For new items that have special update rules, create a new model - a subclasses of Item with its own update_values method that reflects its update rules.

--------------

DOCUMENTATION USED

I chose to build this in Rails because it's the framework I'm most familiar with.  I mainly referred to online Ruby on Rails reference guides and StackOverflow for help debugging some issues I ran into hooking everything into Rails.
For example, the following pages helped me understand ActiveRecord inheritance and figure out how to initialize class values, respectively:
- http://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html
- http://guides.rubyonrails.org/active_record_callbacks.html

--------------

TIME

I spent about 9 hours on this in total.  If I had tracked the inventory info in variables instead of saving them to the db, it may have been simpler to implement (and I wouldn't have needed the Reload button on the page).  It took me time to figure out how to seed the database and to debug a few things related to that, and to debug my way around some Rails quirks.

I think my code is modular and scalable - and I'm looking forward to talking about it and hearing your feedback on how it could be improved.

With more time, I would:
1. Write unit tests.  I've created Fixtures (in the test/fixtures folder) for each model, with different sets of quality/sell-in values to test the various parts of the update logic.  I just need to write the actual tests to run through each of them and check the output according to the update logic.  I'd also write a test for the buttons to make sure they change the values in the table.
2. It might be possible to make the code even more scalable by abstracting out the defining quality of each subclass as a separate subclass layer.
For example, could there be other items besides Legendary Items which don't need to be sold and whose value never degrades?  If yes then it might make sense to have an Item subclass called FixedValuesItem and have LegendaryItem be a subclass of that.