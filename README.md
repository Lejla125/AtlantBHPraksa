# AtlantBHPraksa
This repository contains a Test Suite for the application Navigator including manually written test cases and automated test scripts.

### Manually written test cases

The file navigator_test_suite.ods is written in Calculator from LibreOffice but compatible with Microsoft Excel. It contains three sheets : smoke_test, regression_suite and bugs_improvements whose main functions correspond with their names.
Smoke_test sheet contains two test cases testing the main purpose of Navigator namely the search bar where you can either search for a place or a street name. The regression_suite sheet contains test cases for basic user flows, including negative and positive test cases, whereas bugs_improvements sheet contains some improvement suggestions.

### Automated test scripts

Automated test scripts in this repository are created using Ruby, RSpec, Capybara, Selenium and Google Chrome web driver. In the following short text every one of the mentioned elements above will be briefly explained.


**Operating system :** Ubuntu 18.04.1

**Programming language :** Ruby 2.5.1, installed was Ruby Version Manager

In order to separate each project with its own Ruby version and all required gems to run the script, Ruby Version Manager (short rvm) is used. It enables the user to write his own plain text document file with all required gems and automatically downloads specified gems.

A helpful gem managing tool is Bundler. Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed.

`bundle install`- command will create a Gemfile.lock (if it didn't exist already) and will fetch all remote sources, resolve dependencies and install all needed gems. If the Gemfile.lock does exist Bundler will fetch all remote sources, but use the dependencies specified in the Gemfile.lock instead of resolving dependencies.
Other useful commands when working with Bundler are `bundle update` and `bundle exec rspec spec/<file_path>`.

RSpec is a behavior driven development tool focusing on the application's behavior when some actions are applied.
Capybara enables testing web applications by simulating how a real user would interact with an app. It is a web-based automation framework.
Selenium is a layer under Capybara, a helpful tool for web browsing automation.

Folder navigator_test_suite contains all necessary configuration files as well as Ruby scripts. Test scripts are to be found within the spec folder, organized in smoke_test and regression_suite folders. Currently only automated test scripts for smoke tests are written and stored in smoke_test folder. To run the scripts you have to locate scripts on your computer and enter bundle exec rspec spec/smoke_test/search_place.rb or .../search_street.rb into terminal.
