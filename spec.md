# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database--setup SQL tables for users, lists, and items
- [x] Include more than one model class (e.g. User, Post, Category)--setup 4 models: item, user, list, and baselist (for list items)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)--user has many lists, list has many items, user has many items through lists
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)--items belong to list, list belongs to user, items belong to user through lists
- [x] Include user accounts with unique login attribute (username or email)--setup username as unique login attribute
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying--setup /list/new for creation, /list/index & /list/:id for reading, /list/:id/edit for updating, and /list/:id/delete for deletion
- [x] Ensure that users can't modify content created by other users--setup if/else statements to verify that the list's user_id attribute matches the user's id attribute
- [x] Include user input validations--utilizing bcrypt to encrypt & validate passwords, used checkmarks to validate that the user wants to delete the list or their account (won't process if checkbox isn't marked)
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code--description details what the app is used for, and what information is req'd for a user account...install directions provide step-by-step process for loading all dependencies, starting local server, and opening via browser...contributor's guide provides the URL and points to the code of conduct...added a short description on the license at the end, I also added a short license notification at the beginning of each file & the full text of the GPL V3

Confirm
- [x] You have a large number of small Git commits--127 commits, most are 6 lines of code or less
- [x] Your commit messages are meaningful--each message is specific to the file I was working on
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message--other than adding license notices, every commit & message relates to a specific file
