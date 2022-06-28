# Flight Booker
![A screenshot displaying the website with flight results](https://i.postimg.cc/cZBgq5C2/Screenshot-from-2022-06-28-01-07-29.png)

> **NOTE:** Due to Heroku's aggressive sleep configuration for web dynos, initial load time may be longer than expected.

A mobile-friendly web application where visitors may book a one-way flight for multiple passengers.

[Click here to view a live version in Heroku.](https://flight-book3r.herokuapp.com/)

## General Information
Flight Booker is the easiest place to book your next flight! Visitors may search for then select a flight, and then they may add details for each passenger.

Bookings and passengers are created and saved simultaneously.

This project was created using Rails 7 and Ruby 3.1.2. Minitest, Capybara, and Selenium were used to create system, integration, and functional tests along with fixtures. Search results are updated using Turbo Frames, which allows the app to target and update only the relevant part of the page. To avoid an excess amount of forms, passengers are created with bookings simultaneously through the use of nested forms.

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

### Running System / Integration / Functional Tests
> Prerequisites:
>
> FireFox >= 101 (may work on older versions)

Within the cloned `flight-booker` folder, run:
```bash
bin/rails test:all
```

To exclude resource-heavy system tests, run:
```bash
bin/rails test
```

## Features
* Nested forms to create multiple objects with a single submission
* Database seeds to populate application with sample, starter data
* System, integration & functional tests to ensure proper application functionality
* Fast searching using Turbo Frames
* Responsive design

## Reporting Issues / Feedback / Contact
Bug reports are greatly appreciated. You may create a new issue with a simple description of the problem, and any steps leading up to it.
PRs are kindly appreciated.

You may also email me at: eduardopelaez@pm.me

## Acknowledgements

* [The Odin Project](https://www.theodinproject.com/home), the best resource I have come across for learning full-stack web development
  - For providing the idea for this project ([see the instructions for this project here!](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker))
  - For their absolutely wonderful Discord community

* The Noun Project [artist Phạm Thanh Lộc](https://thenounproject.com/thanhloc1009/) for [the "Plane" art](https://thenounproject.com/icon/plane-2322367/) (used as a favicon)

* The Noun Project [artist Whales Factory](https://thenounproject.com/whales.factory/) for [the "Flight On" art](https://thenounproject.com/icon/flight-on-4179048/) (used as a logo)
