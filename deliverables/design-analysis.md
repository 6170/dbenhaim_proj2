# Design Analysis

## Overview
### Key Design Challenges
1. The relationship between a User and an Order
2. Ensuring that Items never disapear unless they've been ordered
3. Saving orders and re-activating them

## Details
### Key Design Decisions

There are three main models that make up this project: Users, Items, and Order. A User can have many Ordes and Items, and an Order can have many Items. Items-User relationships reprsent Items that are for sale by that User. Item-Order relationships represent an Item that has been grabbed for that Order. Users-Order relationships represent the number of Orders a User has.  