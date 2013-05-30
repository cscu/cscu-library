[![Build Status](https://travis-ci.org/cscu/cscu-library.png?branch=master)](https://travis-ci.org/cscu/cscu-library)

See the live site at: [exams.ryehigh.ca](http://exams.ryehigh.ca/)

Quick links: [Hosting](#hosting), [Development](#development)

# Configuration
## Admin users
There is an admin bit on the User model that enables full control of adding/editing/removing content to the site.
To make a new admin account first make a normal user account, and then manually flip the admin bit on that user.
## Environment Variables
Hopefully self-explanatory:

- `PAPERCLIP_STORAGE = {:filesystem, :s3}`
- `AWS_S3_BUCKET`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `GOOGLE_ANALYTICS_ID`

# Hosting
## Heroku
The CSCU Library is currently hosted on [Heroku](http://heroku.com).
Deploying the site is as easy as `git push heroku master`.

## Amazon S3
The files are all hosted on [Amazon S3](http://aws.amazon.com/s3/).

# Development
## Setting up a dev environment
These are roughly the steps for setting up a dev environment.

### 1. Clone the repository
```sh
gleaver:cscu $ git clone git@github.com:cscu/cscu-library.git && cd cscu-library
Cloning into 'cscu-library'...
remote: Counting objects: 871, done.
remote: Compressing objects: 100% (473/473), done.
remote: Total 871 (delta 417), reused 805 (delta 352)
Receiving objects: 100% (871/871), 152.93 KiB, done.
Resolving deltas: 100% (417/417), done.
```

### 2. Install ruby gems
```sh
gleaver:cscu-library(master) $ bundle install
...
Your bundle is complete!
```

### 3. Install node modules
```sh
gleaver:cscu-library(master) $ npm install
```

### 4. Install grunt-cli:
```sh
gleaver:cscu-library(master) $ npm install -g grunt-cli
```

### 5. Setup databases
```sh
gleaver:cscu-library(master) $ rake db:create
gleaver:cscu-library(master) $ rake db:migrate
```

### 6. Code!

Running `rails server` will launch a local rails server running the app.
See below for the different linting/testing tools to run to check any changes you make.

When you have something neat, make a [pull request](https://help.github.com/articles/using-pull-requests) to [cscu/cscu-library](https://github.com/cscu/cscu-library) on github!

## Code Quality
Running `grunt lint` will run both [jshint](http://www.jshint.com/) and [coffeelint](http://www.coffeelint.org/) on all of the Javascript and Coffeescript code respectively.
```sh
gleaver:library(readme) $ grunt lint
Running "jshint:gruntfile" (jshint) task
>> 1 file lint free.

Running "jshint:app" (jshint) task
>> 1 file lint free.

Running "coffeelint:app" (coffeelint) task
>> 4 files lint free.

Done, without errors.
```

Running `rake rails_best_practices_html` will run [rails_best_practices](https://github.com/railsbp/rails_best_practices) on all of the Ruby code to check it against [Rails Best Practices](http://rails-bestpractices.com/) rules. It will generate an HTML report in the root directory of the project.
```sh
gleaver:library(readme) $ rake rails_best_practices_html
Source Codes: |==============================================================================================================|
Source Codes: |==============================================================================================================|
Results written to [...]/rails_best_practices_output.html
```

## Tests
Running `bundle exec rake spec` will run all of the [RSpec](http://rspec.info/) tests located in the `spec/` folder.
```sh
gleaver:library(readme) $ bundle exec rake spec
/Users/gleaver/.rvm/rubies/ruby-1.9.2-p320/bin/ruby -S rspec ./spec/controllers/courses_controller_spec.rb ./spec/controllers/documents_controller_spec.rb ./spec/controllers/home_controller_spec.rb ./spec/models/course_spec.rb ./spec/models/document_spec.rb ./spec/models/prerequisite_spec.rb ./spec/models/user_spec.rb ./spec/requests/courses_spec.rb ./spec/requests/documents_spec.rb ./spec/routing/courses_routing_spec.rb ./spec/routing/documents_routing_spec.rb
........................................................................................................

Finished in 1.23 seconds
104 examples, 0 failures
```

Running `bundle exec rake cucumber` will run all of the [Cucumber](http://cukes.info/) tests located in the `features/` folder.
```sh
gleaver:library(readme) $ bundle exec rake cucumber
/Users/gleaver/.rvm/rubies/ruby-1.9.2-p320/bin/ruby -S bundle exec cucumber  --profile default
Using the default profile...

[...]

Feature: Finding a course
  As a student
  So that I can find documents for my course
  I should be able to find my course

  Background: Existing courses        # features/find_course.feature:6
    Given the following courses exist # features/step_definitions/course_steps.rb:1
      | code   | name                      |
      | CPS109 | Intro to Computer Science |
      | CPS305 | Data Structures           |

  Scenario: Select course from list                  # features/find_course.feature:12
    Given I am on the courses page                   # features/step_definitions/web_steps.rb:44
    When I follow "CPS109"                           # features/step_definitions/web_steps.rb:56
    Then I should be on the course page for "CPS109" # features/step_definitions/web_steps.rb:230

  Scenario: Search for course from homepage          # features/find_course.feature:17
    Given I am on the home page                      # features/step_definitions/web_steps.rb:44
    When I search for "CPS109"                       # features/step_definitions/course_steps.rb:11
    Then I should be on the course page for "CPS109" # features/step_definitions/web_steps.rb:230

[...]

8 scenarios (8 passed)
34 steps (34 passed)
0m1.964s
```
