# Mars Rover [![Travis CI Status](https://travis-ci.org/tsetsova/mars-rover.svg?branch=master)](https://travis-ci.org/tsetsova/mars-rover.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/github/tsetsova/mars-rover/badge.svg?branch=master)](https://coveralls.io/github/tsetsova/mars-rover?branch=master)
a traveller on Mars in need of some guidance

# Description

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

# Difficulties

This was a fun but challenging task. The rover needs to be able to move and turn, but in terms of a grid, so one of the main challenges was to model some sort of a plane with coordinates and cardinal directions - or simply put, a map.

Another challenge was separating responsibilities and not coupling things too tightly. I'd like to take that further and follow *Practical Object Oriented Design in Ruby* better. I've tried to create a solution that is clear, uses short methods and obeys SRP as closely as I could. I also tried to make as little assumptions about features and expectations as possible.

# Installation

* Clone the repo to your local machine:

```
git clone git@github.com:tsetsova/mars-rover.git
cd mars-rover
```

* If you want to **run the tests** yourself:

  Install the relevant gems with:

  ```
  bundle
  ```
  If you don't have bundler install it with:

  ```
  gem install bundler
  ```

  And to run the tests:

  ```
  rspec
  ```
* To use in your **terminal**:

  Require the relevant files in irb:

  ```
  require_relative "lib/map.rb"
  require_relative 'lib/rover.rb'
  require_relative "lib/mission_control.rb"
  ```

  Before the rover can move, we need a **map** with a width and height:

  ```
  map = Map.new(width:5, height:5)
  ```

  Now we can give that map to mission control and tell it to land our first rover! Give it the **x and y coordinates** as well as a direction **:N** for north, **:E** for east etc.

  ```
  mission = MissionControl.new(map:map)
  mission.land(1,2,:N)
  ```

  Mission Control can tell the rover to move one step forward, turn left or turn right.

  ```
  mission.navigate(:M)
  mission.navigate(:L)
  mission.navigate(:L)
  mission.navigate(:L)
  mission.navigate(:M)
  mission.navigate(:M)
  mission.latest_rover_coordinates
   => "3 3 E"
  ```

  Commands come in to the rover one at a time this way, but the command_interface gives you the option to give multiple commands.

  To use the command interface instead require it as well

  ```
  require_relative "lib/command_interface.rb"
  ```

  Write down the same commands we had before in one multiline string

  ```
  directions =
  <<-EOS
  5 5
  1 2 N
  MLLLMM
  EOS
  ```

  Save it into a new input

  ```
  input = StringIO.new(directions)
  ```

  Create an output so you can see the final coordinates of your rover

  ```
  output = StringIO.new
  ```

  Create a new interface and pass it in the input and output:

  ```
  interface = CommandInterface.new(input, output)
  interface.run
  ```

  To check the final coordiantes:

  ```
  output.string
  => "1 3 N\n5 1 E\n"
  ```

# Enjoy
  Take a look, clone down and play, feel free contribute or give feedback :blush:



