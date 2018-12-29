# Hot Potato

**Drop it like a [Hot Potato][1]!**

[1]: https://hotpotato12.herokuapp.com/
* An online auction house where you first set a selling price for your item.
* Once the auction goes live, the price goes down by a set amount every 3 seconds.
* First potential buyer with the guts to purchase bags the item.


### Technologies used

* Ruby on Rails
* Server Sent Events
* AJAX
* PostgreSQL
* Viewport
* Trello

### The team's approach

As this was our first project together, we spent a lot of time organising tasks using Trello. This ultimately helped a lot. We more or less always knew who was working on what, minimising double ups. We picked up cards based on our individual strengths, bouncing ideas off each other as and when we ran into issues. With regards to GitHub and managing pull requests, we followed a set process as listed by the instructors which almost eliminated the chances of losing work. All in all it was great learning experience.

### User Stories

Our users are anyone looking at selling an item online (that is legally sellable, of course!). The app is based around creating sense of urgency around purchasing auction items. The idea that the continuously dropping price might mean that someone else might bag the item should hopefully create some serious FOMO! 

From the seller's point of view, they need to be prepared to sell the product for a lot lower than they anticipate. Manage your start price effectively!

### Wireframes and DB structure

[UI Wireframe](https://i.imgur.com/CGegRkW.png)

[DB structure](https://i.imgur.com/WS0qz7u.png)

### Upcoming milestones

* ~~Link the seller and buyer.~~ Done using a connect page once buy button is pressed
* ~~Make buy button appear/disappear dynamically~~ Buy button is still visible, but is deactivated for all watchers once a buyer is regustered.
* Tests