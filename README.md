### Run

Open a terminal and in the app directory enter a following command:

> ruby main.rb <NUMBER_1> <NUMBER_2> <NUMBER_3>

Or run the test file from a spec directory:

> rspec .\array_solver_spec.rb

Considering the size of the task I decided to skip defining a Gemfile, bundle config
or rails setup - didn't mean to take a sledgehammer to crack a nut.

### Algorithm

1. First, we have to guarantee that all numbers are divisible by 3 - so it iterates
over array, checks it and if failed, increments highest possible digit in every number.
2. Now it maximises the sum, ensuring that divisibility is still maintained. While
having >= 3 possible changes left, it finds the number that gives the biggest difference on 
the series of three consecutive changes and adds that difference to the number.