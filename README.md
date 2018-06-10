# ChallengeAssignment
This is an iOS app challenge is given by a reputed company of Malaysia during the interview process. 



The purpose of this challenge is to check your design, architectural and development skills. 
The challenge requirements are pretty simple, however you need to design it while keeping in 
mind the scalability, so that this simple app can be scaled up to a very large scale commercial app.


Task: build an application that includes the following screens

1. Login: 

It will contains email and password fields and a login button.

a. On empty fields, login button click should show “All fields are required” message. 
b. On wrong email, login click should show error. “Email is not valid”
c. On wrong password, login click should show error. “Password should contain one
special character and minimum 8 characters required”

2. Sign up: 

It will contains email, password, first name, last name, mobile number fields, gender
drop down and a sign up button.

a. Email, password, gender and mobile number are compulsory. Other fields are
optional.
b. On empty compulsory fields, signup button click should show “Please complete
the form” message.
c. On wrong email, signup button click should show error. “Email is not valid”
d. On wrong password, signup button click should show error. “Password should
contain one special character and minimum 8 character required”
e. On wrong mobile number signup button click should show error. “Mobile number
is not valid ( Only check for Malaysian)
f. On no gender selected, signup button click should show an error.

3. Home:

a. Show first and last name in uilabel
b. Show the registered mobile number in a uilabel with an edit button. (When edit
button is clicked, a dialog will open and the user can change the mobile number and save. On successful editing should show a message “Number was edited successfully”)
c. Show Images button takes to Images Displayer screen.
d. Logout button (“When clicked, show the login screen”).

4. Images Displayer:

a. Use flickr (or any other source) API to load any set of images you like in a grid that has 2 columns.
b. Back button & pan gesture takes back to home screen.



Important points:
● Use Swift only.
● Everything should be saved locally in CoreData or Realm.
● If user does a sign up with an email and he tries again to use that same email for sign
up, show “Email already exists” message.
● Follow MVC/MvVM/MVP architecture.
● Well QA tested. (Minimum or No bugs).
● Try to write a simple and a scalable code. So if I want to add one new user I will do with
minimum changes in code.
● Write one UI test for login screen.
● Write Unit tests for Login and sign up screens (optional).
When the app is completed, please push the project to your public Github account and share the link with us.
