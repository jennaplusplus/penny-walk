# Penny Walk
## Team Members: Lauren, Sarah, Meighan, Jenna, Katie, Brittany, Barbara

![doggy mascot](https://raw.githubusercontent.com/jennaplusplus/penny-walk/master/app/assets/images/Heads.png)

## Overview
_Penny walk_ is ideal for people who want a little bit of spontaneity in their walks. This app will create a unique walking path on the fly for the user as they are walking.

## Goals

**Minimum Viable Product/Phase I**
* A responsive web app that displays heads or tails along with a number of blocks to read
* heads is left
* tails is right
* Penny dog is our mascot
* number of blocks is a random number between 1 and 3

**Phase II**

* Map integration with the walks

**Phase III**
* Trip route outlined on the map
* External link to get directions from where you are to the starting point using the shortest route


## Models
* Walker
  * id
  * name
* Trip
  * _has_many: turns_
  * _belongs_to: walker_
  * start_location
  * walker_id
  * end_location
* Turn
  * _belongs_to: trip_
  * L/R
  * number of blocks
  * trip_id
  * sequence
