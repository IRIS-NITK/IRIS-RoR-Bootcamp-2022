# Week 3 - Getting Started with Rails

In this week we will get started with Rails.

We will create a simple rails app with two pages, a Home Page and an About Me page.

## Steps
- [Set Up Local Workplace](../setup/)

- Create a new [gemset](../setup/README.md#RVM) and install rails
```bash
cd week_3
rvm gemset create week_3
rvm use 3.0.5@week_3
gem install rails --version 7.0.4
```

- Create a new Rails project `hello_world` in the directory `week_1`
```bash
rails new hello_world --css=bootstrap --skip-git
cd hello_world
rvm use 3.0.5@week_3
```

> The command `rails new` initialises a Rails project. We have passed
> the flag `--skip-git` to avoid initializing Git again as we are
> already within a Git repository.

- Run the rails server using below command and go to http://localhost:3000/.
```bash
rails server
```

You should see the rails logo.

### Add a controller

- Generate a new controller `PageController` with actions `root` and
  `about_me`:

```bash
rails generate controller Page root about_me
```

> A _controller_ is responsible for making sense of request and producing
> the appropriate output. It acts as a middleman between the Data
> (Model) and Presentation (View). Controllers are stored in
> `app/controllers` directory.


> The generator creates the files and fills it with some default code.
> the above command creates a controller
> `PagesController`, creates new view files `root.html.erb` and
> `about_me.html.erb` and modifies the routes file

- Edit the routes file (`config/routes.rb`) as follow to add new routes:

```ruby
Rails.application.routes.draw do
  get '/', to: 'page#root'
  get 'about_me', to: 'page#about_me'
end
```

The routes file specifies the URLs that are recognized by the application.

- Edit the view files `app/views/page/root.html.erb` and `app/views/page/about_me.html.erb`.

- You should be able to see see your changes at `http://localhost:3000` and
  `http://localhost:3000/about_me`.

