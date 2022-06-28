# Flight Booker
> **NOTE:** Due to Heroku's aggressive sleep configuration for web dynos, initial load time may be longer than expected.

A mobile-friendly web application where visitors may book a one-way flight for multiple passengers.

[Click here to view a live version in Heroku.](https://flight-book3r.herokuapp.com/)

## General Information
Flight Booker is the easiest place to book your next flight! Visitors may search for then select a flight, and then they may add details for each passenger.

Bookings and passengers are created and saved simultaneously.

This project was created using Rails 7 and Ruby 3.1.2. Minitest, Capybara, and Selenium were used to create system, integration, and functional tests. Search results are updated using Turbo Frames, which allows the app to target and update only the relevant part of the page. To avoid an excess amount of forms, passengers are created with bookings simultaneously through the use of nested forms.

## Installing / Getting Started
[Click here to view a live version in Heroku.](https://flight-book3r.herokuapp.com/)

> Prerequisites:
> * Ruby >= 3.1.2
> * Rails >= 7.0.3
> * Bundler >= 2.3.6
> * PostgreSQL >= 14.3

```bash
git clone https://github.com/Eduardo06sp/flight-booker.git
cd flight-booker/
bundle install
bin/rails server
```

Then visit http://localhost:3000/ to view the application.

You may see [the instructions for this project directly on The Odin Project's website](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker).
