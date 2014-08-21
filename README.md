Cinema Seats Booking App
========================

This code was written for a technical test with the following specifications.

A cinema has a theatre of 100 rows, each with 50 seats. 
Customers request particular seats when making a booking.
Bookings are processed on a first-come, first-served basis. 
A booking is accepted as long as it is for five or fewer seats, all seats are 
adjacent and on the same row, all requested seats are available, and accepting 
the booking would not leave a single-seat gap (since the cinema believes nobody 
would book such a seat, and so loses the cinema money).

Objective
---------
Write a system to process a text file of bookings (booking_requests) and 
determine the number of bookings which are rejected.

The text file of bookings contains one booking per line, where a booking is 
of the following form:
  - (&lt;id&gt;,&lt;index of first seat row&gt;:&lt;index of first seat within 
  row&gt;,&lt;index of last seat row&gt;:&lt;index of last seat within row&gt;),

Rows and seats are both 0-indexed. Note the trailing comma is absent on the 
final line.

Technologies used
-----------------

* Ruby
* RSpec

How to use
----------

```shell
git clone git@github.com:juliatan/big-screen.git
cd big-screen
ruby app.rb
```

How to run tests
----------------

```shell
cd big-screen
rspec
```