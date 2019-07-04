This repository contains a cucumber boilerplate project for submitting the second form on the website https://www.ultimateqa.com/filling-out-forms/

Installation Instructions

1.Install ruby 

2.Check that ruby is installed ruby by running "ruby --version"

3.Update gem by running the command "gem update --system"

3.Install cucumber and other required gems by running "gem install --no-ri --no-rdoc rspec cucumber selenium-cucumber"

4.Clone the repository and navigate to where the feature file is located

5.Run the test by issuing the command "cucumber" 

Additional notes

There are four scenarios in the feature file.For the suite to be deemed successful all test cases must pass.

Cucumber matches the scenarios in the feature file to indivitual steps defined in the step files.

The support group is used to get an instance of driver incase of web projects and an instance of aappium in the case for mobile projects.

You can create the directory structure yourself or use "selenium-cucumber gen" command to generate a boiler plate structure as shown below

features
    |
    |__support
    |     |__env.rb
    |     |__hooks.rb
    |
    |__step_definitions
    |     |__custom_steps.rb
    |
    |__actual_images
    |
    |__expected_images
    |
    |__image_difference
    |
    |__screenshots
    |
    |__my_first.feature

