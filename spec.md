# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Controllers inherit from Sinatra::Base.
- [x] Use ActiveRecord for storing information in a database. - Model inherit from ActiveRecord::Base. Database tables are created through migrations.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - There are two models, User and BoardGame. Each has multiple separate attributes and a relationship to the other model.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - This application demonstrates a many-to-many relationship, where each user may own many board games, and each board game may be associated with many users.
- [x] Include user accounts - Users are able to sign up, log in, and log out. User profiles are protected from individuals that are not logged in. Users that are logged in can see other users that own the same game.
- [x] Ensure that users can't modify content created by other users - Users can only add games to their own account if they are logged in.
- [x] Include user input validations - Users can only create an account if they have a unique username and secure password.
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new) - Relevant messages are displayed to the user using the gem rack-flash3.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code. - The README does include all of these components. The short description includes the purpose of the application. The install instructions include information about how to run the application in a browser. A contributors guide and license are taken from bundle's standard literature.

Confirm
- [x] You have a large number of small Git commits. - At this point, there are 25 commits.
- [x] Your commit messages are meaningful - Each commit message attempts to thoroughly but succinctly describe the purpose the commit and the changes that are included in the commit.
- [x] You made the changes in a commit that relate to the commit message. - Changes are sometimes made to multiple files, but should all correspond to the same goal.
- [x] You don't include changes in a commit that aren't related to the commit message. - Many files may be changed per commit, but they should tell the story of the commit.
