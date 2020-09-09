# todoonrails

steps:
rails new todorails -d mysql

//setup database creds
rails generate controller todos index
// create a user in mysql then follow
rake db:schema:dump
rails generate model todos
rake db:migrate 