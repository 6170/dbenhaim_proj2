## Summary assessment from user’s perspective
#### Positve
- I'm proud of the UI (again) 
- I believe the way I set up the site leads to an intuitive user experience.
- Users can both sell and buy items.
- I believe the site is easy to use
- The site functiones well
- I used a nice mix of rails, coffeescript, backbone.js and mongodb. It was cool to branch out and learn new technologies.

#### Negative

- There are still a few bugs left
- Took me a while to get the hang of backbone.js
- Had some operational overhead associated with getting mongodb set up with rails
- The nice UI doesn't always play nice with all browsers
 

## Summary assessment from developer’s perspective
- The code is clean
- Most of the work is done clientside
- I need to add some more update events in backbone so the data that is displayed is always fresh.  

- There is a bug where more than one order can be 'active' at a time :(

- There could be tighter security

## Most and least successful decisions
### Most
I like that I built something usable with a clean interface. It was cool to explore new technology and build something with it that works.  

### Least
Security issues and bugs are still in final product. 


## Analysis of design faults in terms of design principles
- Moving a lot of the work to the clientside makes the rails stuff easier to do. Mongodb meant I didn't have to use migrations and such. Didn't utilize the non-relational aspect all the way. 

## Priorities for improvement
1. Fix security issues
2. Clean up code base
3. Make clientside refresh data more often. 