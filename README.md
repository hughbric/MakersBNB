# MakersBNB challenge :house_with_garden:

This is a web application that allows users to list spaces they have available, and to hire spaces for the night.

## How to use

Clone the project

Run 

```
$ bundle
```
```
$ rackup
```

## Screenshots

[Home Page](public/img/home_page.png)
[Login Page](public/img/login_page)

## User Stories :point_down:

```
As a new user
So I can have an account
I need to be able to sign up.
```
```
As an existing user
So that I can access my account
I want to be able to login
```
```
As an existing user
So that i can exit my account
I want to be able to log out
```
```
As a space-owner
so that I can advertise a space
I want to be able to list a new space.
```
```
As a space-owner
Because I have multiple rooms
I want to be able to list more than one space.
```
```
As a space-owner
So that I can give more information about the space
I want to be able to describe it and set a price per night.
```
```
As a space-owner
So that my space is not double booked
I want to be able to specify what dates my space is available on.
```
```
As a space-seeker
So that I can use a space
I want to be able to request to hire a space on a specific date that is available.
```
```
As a space-owner
So I can prepare my space for use
I want to be able to see the requests that have come in
```
```
As a space-seeker
So that I know where I want to stay
I want to be able to see the requests that I've made
```
```
As a space-owner
So that I can approve who stays
I want to be able to approve or deny requests from guests.
```
```
As a space-seeker
So that I know my booking is confirmed
I want to be able to see if my request has been approved or denied
```
```
As a space-owner
So I don't have to manually update availability after a booking
I want booked dates to automatically become unavailable.
```
```
As a space-owner
So that I can choose bookings that suit me
I want to see the space available until I approve the request for hire.
```

## Specifications completed:

* Any signed-up user can list a new space.

* Users can list multiple spaces.

* Users should be able to name their space, provide a short description of the space, and a price per night.

* Users should be able to offer a range of dates where their space is available.

* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

## Specifications needed working on:

* Ovarall CSS styling

* Nights for which a space has already been booked should not be available for users to book that space

* Until a user has confirmed a booking request, that space can still be booked for that night.

* Users should receive an email whenever one of the following happens:
	- They sign up
	- They create a space
	- They update a space

* A user requests to book their space
	- They confirm a request
	- They request to book a space
	- Their request to book a space is confirmed
	- Their request to book a space is denied

* Users should receive a text message to a provided number whenever one of the following happens:
	- A user requests to book their space
	- Their request to book a space is confirmed
	- Their request to book a space is denied

* A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space.

* Basic payment implementation though Stripe.
