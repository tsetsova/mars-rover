# Mars Rover [![Travis CI Status](https://travis-ci.org/tsetsova/mars-rover.svg?branch=master)](https://travis-ci.org/tsetsova/mars-rover.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/tsetsova/mars-rover/badge.svg?branch=master)](https://coveralls.io/github/tsetsova/mars-rover?branch=master)
a traveller on Mars in need of some guidance

# Description

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

# Installation

* Clone the repo to your local machine:

```
git clone git@github.com:tsetsova/mars-rover.git
cd mars-rover
```

* Install gems (Or if you don't have bundler install it with ```gem install bundler```)

```
bundle install
```




