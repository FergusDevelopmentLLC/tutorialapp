```
$ rails new tutorialapp --skip-turbolinks
$ cd tutorialapp
$ bundle install
$ rails g resource tutorial title:string url:string
$ RAILS_ENV=development rake db:migrate
```

add to db/seeds.rb  
```
Tutorial.create(title: 'Encrypted Rails Secrets on Rails 5.1', url: 'https://www.engineyard.com/blog/encrypted-rails-secrets-on-rails-5.1')
Tutorial.create(title: 'Using Docker for Rails', url: 'https://www.engineyard.com/blog/using-docker-for-rails')
Tutorial.create(title: 'Running a Rails App in Kubernetes', url: 'https://www.engineyard.com/blog/kubernetes-tutorial-running-a-rails-app-in-kubernetes')
```

On app/controllers/tutorials_controller.rb, add the index action.  
```
def index
  @tutorials = Tutorial.all
end
```

On the index view app/views/tutorials/index.html.erb, display all the tutorials.
```
<h1>Tutorials</h1>
<ul>
  <% @tutorials.each do |tutorial| %>
    <li><%= tutorial.title %> <%= link_to "Hide", "", class: 'hide', data: {'js-hide-link' => true} %></li>
  <% end %>
</ul>
```

Back at the terminal...

```
$ RAILS_ENV=development rake db:seed
$ rm -rf node_modules
$ rake webpacker:clobber
$ yarn install --check-files
$ rake webpacker:clobber
```

Copy/paste the following in config/webpack/environment.js:

```
const { environment } = require('@rails/webpacker')
var webpack = require('webpack');
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
  })
)
module.exports = environment
```

Back at the terminal

```
$ yarn add jquery
```

Copy/paste the following in config/webpack/environment.js:

```
$(document).ready(function() {
  $('[data-js-hide-link]').click(function(event){
    alert('You clicked the Hide link, powered by jquery');
    event.preventDefault(); 
  });
})
```

Back at terminal:

```
$ RAILS_ENV=development rake webpacker:clobber
$ RAILS_ENV=development rake webpacker:compile
$ RAILS_ENV=development bundle exec rails s
```

Visit http://localhost:3000/tutorials  
Click the Hide link, which is powered by jquery.

Cobbled together from:  
https://devcenter.heroku.com/articles/getting-started-with-rails6  
https://stackoverflow.com/questions/33380106/jquery-not-working-in-rails  
https://github.com/rails/webpacker/issues/2478  
```
rm -rf node_modules
rake webpacker:clobber
yarn add <packages-used>
yarn --check-files
RAILS_ENV=... rake webpacker:compile
```
https://www.botreetechnologies.com/blog/introducing-jquery-in-rails-6-using-webpacker  
Now, How we will use Jquery in Rails 6??

https://blog.capsens.eu/how-to-write-javascript-in-rails-6-webpacker-yarn-and-sprockets-cdf990387463

---
Deploy to Heroku:

```
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku run rake db:seed
$ heroku open