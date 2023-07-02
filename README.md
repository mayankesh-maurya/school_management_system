# README

An application that allows for the creation and management of schools, courses, batches, and students by
various user types including Admin, School Admin, and Student. With different user types and their respective
capabilities, the application offers a flexible and secure platform for educational organisations.

## Setup

Follow these steps to set up the application:

1.Clone the repository to your local machine.

2.Open a terminal and navigate to the project directory.

3.Install the necessary dependencies by running the following command:

```
bundle install
```
4.Set up the database by running the following commands:

```
rails db:create
rails db:migrate
rails db:seed
```
This will create the database, run the necessary migrations, and seed the database with initial data.

## Running the Application

1.Open a terminal and navigate to the project directory.

2.Start the Rails server by running the following command:


```
rails s
```
3.Open a web browser and enter the following URL:

```
http://localhost:3000/
```
This will open the application in your browser.

## User Roles
The application has the following user roles and corresponding functionalities:

### Admin

* Admins have full control over the system and can create schools and SchoolAdmins.

To sign in as an Admin:

On the home page, click on "Admin Sign In" to access the Admin login page.

Enter your Admin credentials to sign in.

### School Admin

* SchoolAdmins can update information about the school
* SchoolAdmins are responsible for creating courses
* SchoolAdmins are responsible for creating batches
* SchoolAdmins are responsible for adding students to batches
* They can also approve or deny enrolment requests made by students

To sign in as a School Admin:

1.On the home page, click on "School Admin Sign In" to access the School Admin login page.

2.Enter your School Admin credentials to sign in.


### Student

* Students can raise a request to enrol in a batch.
* Students from the same batch can see their classmates and their progress

To sign in as a Student:

1.On the home page, click on "Student Sign In" to access the Student login page.

2.Enter your Student credentials to sign in.

To sign up as a new Student:

1.On the home page, click on "Student Sign Up" to access the Student signup page.

2.Fill in the required information and submit the form to create a new Student account and enroll in a batch.