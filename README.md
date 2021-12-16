# README

To install
1) Open terminal 

2) CD to top level folder ../notable_health_justin_cheasty

3) install with:
  "bundle install"

4) database uses postgresql, initialize with 
  "bundle exec rails db:setup"

5) migrate tables to database with
  "bundle exec rails db:migrate"

6) run server http://localhost:3000 
  "rails s"

7) run debugger with
  "rails c"

8) see routes (such as http://localhost:3000/doctors )
  "rails routes"

Project assumes there are other controllers controlling user login etc. 
Additionally, the back-end checks for 15 minute intervals, but also assumes the front end does as well, and has its own time-to-string parser as well as passing an epoch-time param.

If you want me to add to include office hours and federal holidays, let me know! Thanks for grading!