# Sample DockTest Application

This a simple api application that provides an example on how to use [DockTest] for outside-in testing for rack-based ruby services.


## Setup

Execute this in the command line

    $ git clone https://github.com/jackxxu/sample_dock_tested_app.git

And then execute:

    $ bundle

And then run the test locally:

    $ bundle exec rake test
    $ bundle exec ruby -Itest test/test_application.rb

And then run the test against a production deployment (currently in heroku):

    $ DOCK_ENV=production bundle exec rake test
    $ DOCK_ENV=production bundle exec ruby -Itest test/test_application.rb

Please note that one of the tests with POST is skipped because the DockTest production environment `skippy` setting is `true`.

[DockTest]: https://github.com/jackxxu/dock_test
