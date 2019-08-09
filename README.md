# Support Software Engineer offline exercise

Hello #{insert awesome candidate name here}!

This exercise includes three sections that will help us gain a better understanding of your knowledge and ability to research the following topics:

- Data models
- SQL queries
- Web applications

> Please read this entire README before starting (don't worry, it will only take 5 minutes).

## Table of Contents

This is how the exercise is structured with an indication of how much of the total time you should spend on each part.

- [Part 1 - database design (10%)](#1-design-a-database)
- [Part 2 - sql hunt (30%)](#2-the-sql-hunt)
- [Part 3 - simple web app (60%)](#3-build-a-simple-web-app)

### 1. Design a database

SalesLoft is a sales engagement application, allowing its users to reach prospective customers faster and more effectively.

- Each SalesLoft user belongs to a team.
- A team has users based on the number of licenses purchased.
- A user can add people to SalesLoft.
- A user can add companies to SalesLoft.
- A person can belong to a Salesloft user.
- People can belong to a company.
- A team or user can create a cadence. What's a cadence? A cadence is a sequence of "steps" such as a phone call step and an email step that a team can use to structure customer contact.
- In other words, a cadence can include people, phone call steps, and email steps.
- A user can pick the day a step will run.
- An email step can be run manually or automatically at a certain time.  Automatic emails steps mean that if a person is on that step they will receive the email without the user having to hit send.

TODO: Based on this information, draw an Entity Relationship Diagram [ERD](https://www.lucidchart.com/pages/er-diagrams) representing the relationships between our data in the SalesLoft app. Please note down your design choices. Your ERD can be designed using any tool you prefer. https://www.draw.io/ is a free and useful tool. Paper and pencil and a picture of your ERD sketch works as well!  Please document any assumptions or outstanding questions you have.

### 2. The SQL Hunt!

As a support software engineer, you'll need to effectively navigate a SQL database, specifically PostgreSQL. In this exercise, you will have to fetch data according to the instructions.

We are providing the application in a Docker container to prevent any configuring issue and, we are able to gurantee a smooth experience for both Unix and Windows systems.


1. Download and install Docker from https://docs.docker.com/install/ for your OS
2. Start Docker in your system (you should see the whale icon somewhere on your screen)
3. Clone this repo `git clone git@github.com:SalesLoft/SupportEngineer-offline-excercise.git`
4. `cd` into `SupportEngineer-offline-excercise`
5. Type `./docker_exec.sh`, this command will setup the rails app, and prepare the database.psql -h db -p 5432 -U postgres

You can choose to run your queries from Rails Console using `rails c` or from the Postgres console with the following command `bundle exec rails dbconsole`

Alternatively, you can import our database in another application of your choice. Running the command `rake db:dump format=sql` will create a .sql file to import.

We would like to see the queries along with the answers for the following questions:

1. Find the country with the highest number of engineers.
2. Find the three teams with the highest number of engineers and order them by the number of bugs, largest first.
3. Find the oldest engineer with a repository written using functional programming. If needed, the winner is the one with the most functional programming repositories.
4. Find the second least represented region across all the teams.
5. Find who published the book with the highest average rating.
6. Find the capital of the country where the oldest person in the team that shipped the most features comes from.
7. Find the inventor of the third most used programming language by the teams on the most populated floor.
8. Find the book least read by the the engineers who develop in Ruby.

Here you can find helpful documentations: [ActiveRecords queries](https://guides.rubyonrails.org/active_record_querying.html) [Postgresql](http://www.postgresqltutorial.com/postgresql-cheat-sheet/) 

### 3. Build a simple web app

In this last part you will submit a web application with two features:

1. Show a list of People records that are available via the [SalesLoft API](https://developers.salesloft.com/api.html#!/People/get_v2_people_json) using the API key in the email you received. Display each person’s name, email address, and job title.
2. Create a button that, when clicked, displays a frequency count of all the **unique** characters in all the email addresses of all the People you have access to, sorted by frequency count.

| Character | Count |
| --------- | ----- |
| M         | 7     |
| R         | 5     |
| S         | 2     |

At SalesLoft we love building quality software and we like to write code other people enjoy working with. Here are the elements we consider important:

- Usability. Having a working application is the first step, right?
- Deployment. It would be cool to use the application in the cloud!
- Documentation. Instructions are important and we want to see the reasons behind your development choices.
- Tests. A test written today is 10 bugs that will not pop up tomorrow!
- Git. Commit soon and commit often. Branches make cooperative work way easier.
- Readability. Code should be written for other people to work on: names, indentation, spaces. Everything matters.
- Frontend frameworks. Do you know any of the numerous frameworks out there? Are you using your choice to your advantage?
- Development principles. There are different ways to write code. The important thing is doing it deliberately.

Remember, what you learn during these exercises is more important than what you knew before starting!

If you have any questions, email us at engineeringjobs@salesloft.com.

Good Luck!

The SalesLoft Team
