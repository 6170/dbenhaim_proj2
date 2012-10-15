# Problem Analysis

## Overview
### Purpose and goals
The purpose of this project is to create a shopping cart application that allows users to sell and buy items as well as track the orders they've made. 


### Key Features
1. Ability for any user to sell items
2. Ability to save orders in progress
3. Ability to buy items from other users and self

## Domain
### Object Model
![object model](https://raw.github.com/davidbenhaim/)


```
User:
  fields:
    name: string  
    password: string
    email: string
  associations:
    has_many: Items
    has_many: Orders
  
Item:
  fields:
    title: string  
    state: string
    price: integer
    img_src: string
  associations:
    has_one: User (seller)
    belongs_to: Order (buyer)

Order:
  fields:
    total: integer
    state: string
  associations:
    has_many: items
    belongs_to: User
```

### Event Model
There are several events in this application. 

User Account ::= (create (login |logout )* close)
Shopping Cart ::= (create|restore) (add item | delete item |modify item)*(destroy|save|checkout))
Item ::= (create modify* destroy)
Order::=(create (add item | remove item)(save | restore) (cancel | complete))

## Behavior
### Feature descriptions
1. The ability to login/logout.
2. The ability to sell items (add, delete and modify items that haven't been orderdered yet)
3. The ability to create, place and edit orders
4. The ability to save and reactivate orders
5. The ability to buy items by adding them to an order

### Security Concerns
1. I'm not doing any credit card stuff. But I'm doing almost everything in backbone.js so someone could feasibly screw with the js but I don't think there are any holes. 
