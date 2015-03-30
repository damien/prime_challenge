# Prime Challenge

A couple of simple prime number generators and an interface to play with them.

### Requirements

  * Git
  * Ruby 2.2.1
  * [Bundler](http://gembundler.com/)

### Setting Up

Check out a copy of this repository and run `bundle install` from within your local Git repository.

### Usage

    bundle exec bin/prime_challenge
    bundle exec bin/prime_challenge -h
    bundle exec bin/prime_challenge 42

### Tests

Some basic tests to exercise basic functionality and class interfaces are included with this repository. To run tests, simply run `rake` after setting up the project:

    rake

You can also play with the classes directly by dropping into the provided, pre-configured Pry console:

    rake console
