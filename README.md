# share-ideas
####Deployed at: https://csc309-theresama.herokuapp.com/
---
####Local setup
```
git clone https://github.com/theresama/SynergySpace.git
bundle install
rake db:migrate
rails s
navigate to //localhost:3000 on your favourite browser
```
---

Individual assignment for CSC309: Programming on the Web, built using Ruby on Rails.
This is a simple web project that allows users to submit ideas for start up companies. A start-up idea includes information about the title of the idea, a short description (a couple of paragraphs), the industry or market it belongs to from a list of at least 5 pre-defined choices (e.g., health, technology, education, finance, travel, etc.) and a set of relevant keywords/tags that better describe it. In order to submit an idea, a user needs to be registered in the service by providing a name, an email address (that serves as a login) and a password. Moreover, a registered user can navigate the list of already registered start-up ideas and filter ideas by industry/market, by keyword/tag or sort them by name or date of submission. In addition, a registered user can express her preference to an idea by liking or disliking it.
