# README

Simple Ruby on Rails web service that tries its best to assign orders to drivers...

## Tech Stack

- ruby 2.2.4p230 (2015-12-16 revision 53155) [i386-mingw32]
- Rails 5.0.0

## Tools Used

 - https://atom.io/
 - https://www.getpostman.com/

## Setup & Testing

Assuming ruby and rails installed...

1. `cd zds`
2. `ruby bin/rails server` or just `bin/rails server` for Mac or Linux
3. Visit [localhost:3000](http://localhost:3000/) to confirm server running.
4. Use Postman or an equivalent tool to test service, see __TestingData folder for Http Post params and a few sample test objects.

## Key Pieces

- `__TestingData` Folder containing expected data format and test objects
- `app\controllers\assignment_controller.rb` Controller for the service
- `lib\` Folder for assignment releated classes
- `config\routes.rb` Routing config


## Assumptions Made
1. Incoming data format, see __TestingData examples
2. Used simple 2D locations & distance algorithm to keep problem simple. E.g. (0,0) and (0,5) are 5 miles apart.
3. Assumed a driver can be assigned a large order if they have < 3 orders and no large order. Wasn't sure if having a large order meant they couldn't have any other orders, or just not be assigned any more. E.g. a driver could potentially have [2,1, or 0] small orders and 1 large order if the smalls were assigned first.
4. Assumed delivery of less-optimal working solution was favored over taking longer time to try out different assignment algorithms

## Retro

Things that when well:
- Delivered working service
- Learned some Ruby and RoR
- Took only a few hours for solution

Things I'd like to improve:
- Made time tradeoff, I chose greedy assignment algorithm over more efficient solutions. Would have liked to at least try a spin on bin-packing.
- Would like to look for automated testing tool and build a lot more test cases.
- Would like to take a second pass at code as I become more familiar with Ruby, skipped on revisiting code smells such as using `== "large"` order size comparisons in many places. Also I have a feeling I could have taken more advantage of rubys syntax to simplify some of the code.
- Spent more time on troubleshooting installing tech on Windows than expected
