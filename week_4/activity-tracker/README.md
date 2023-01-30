# Controllers | Activity Tracker

Alright! We have our model (which we will use to represent our data) ready to go. Now what we need to do is somehow be able to use this data to display content on our web app.

Before we go into what controllers are, lets briefly look into what happens when a request is made to a Rails application.

## Request Response Cycle
_(This is an oversimplification of the processes that happen under the hood. To know more details about what happens, you can refer to any resource about request-response cycle online.)_

The first thing that you would do is open up your browser, and enter a URL. Then some magic happens, and you can see the output webpage. Right?

What happens internally is, every URL is mapped to a particular controller action. It is the controller's function to take over control, and fetch any necessary data it needs from database (via models that you made during the last week. Nice!).
This data is then packaged in appropriate formats - for example, if you are making an API server, your response would probably be in the JSON format.

For a regular Rails app, the data from the controller is passed on the the special HTML pages, called _views_. In the views, you define how your data should be presented to the user.

## Steps

So lets recap. For making the web application work, we need:
- URLs. Each one of these are mapped to particular controller actions.
- Controllers. They aggregate all information needed for display, and pass it to the views.
- Views. They are what you see as the response.

Quite a lot of steps right? Well, you're lucky you're learning Rails.

## Scaffolding
There is a lot of "magic" that Rails does to make the developer's life much easier. One of the greatest ways, and very powerful tool that you'll be using often, is **scaffolds**.

A scaffold basically does what it says - creates a lot of boilerplate code, so that you don't have to manually type it out. What is this boilerplate you ask?

The scaffold operation creates the model, controller, views, routes and associated test files for the object that you specify. The URLs and controller actions that are made are the ones commonly used for CRUD operations - creating, removing, updating and deleting records.

If it seems a little overwhelming to you right now, fear not! All shall be revealed soon.

## Requirement
As a small recap, this is the data that we need in our application.

- Title: `string`
- ActivityType: `string`
- Start: `datetime`
- Duration: `decimal`
- Calories: `integer`

In the previous week, you might have generated the model for this using `rails generate model`. This time, we'll create a scaffold for this.

```shell
rails generate scaffold Activity title:string activity_type:string start:datetime duration:decimal calories:integer
```

Make sure you keep in mind the Rails naming conventions! They apply here also.

When you run this command, a ton of files would have been generated on your system. Lets take an overview of the files generated.

- `create db/migrate/20230127173852_create_activities.rb`: Creating the migration file, to be applied to the database.
- `create app/models/activity.rb0`: The model file for our model.
- `create test/models/activity_test.rb`: Test file, for writing tests.
- `route resources :activities`: Routes (URLs). Add the basic CRUD URLs automatically.
- `create app/controllers/activities_controller.rb`: Controller. This is where you write controller actions.
- `create app/views/activities/*`: A bunch of files in this directory. These correspond to the views that will be rendered.
- `create test/controllers/activities_controller_test.rb`: Test suite for the controller.
- `create app/helpers/activities_helper.rb`: Helper for our resource.

Ensure that you have created the database using `rails db:create`. You can now apply migrations created by using `rails db:migrate`.

Run the server using `rails server`. If you now go to `localhost:3000/activities` on your browser, you can see a basic app in function!

<img width="667" alt="image" src="https://user-images.githubusercontent.com/76661350/215397576-38c2b362-95cf-4e6a-a681-053014845568.png">

Feel free to play around with the app now. Here are some screenshots of what you should be able to see:

<img width="566" alt="image" src="https://user-images.githubusercontent.com/76661350/215397680-c36d9db5-18fa-4774-805c-e4788112a8a6.png">

_New Activity_

<img width="567" alt="image" src="https://user-images.githubusercontent.com/76661350/215397797-360ff438-878b-4748-9407-c57af1a65e6c.png">

_Show activity_

<img width="530" alt="image" src="https://user-images.githubusercontent.com/76661350/215397846-4b703434-c98c-4f84-ac0c-7dc79b2a686e.png">

_Editing an activity_


## The Controller
Now, lets open the controller and see what is happening. We'll take an example of a simple function, and try to understand what is happening.

```ruby
  def index
    @activities = Activity.all
  end
```

This is the `index` function. As the name suggests, this is the controller action that is called when you go to the home page. It displays a list of all the available entries for you to view (i.e. it provides an "index" of all data.)

`Activity` refers to our model. The all function allows us to pick up all the entries that are stored as part of the `Activity` model, that is, all rows in the activities table. We save that in a variable called `@activities`.

If you notice, the variable starts with `@`. This is a special type of variable in Rails, known as **instance variables**. These are variables that are accessible in both the controller and the views.

At the end, we do not tell Rails to render any particular template (in opposition to some other frameworks, for instance Django). This is because of how Rails works - convention over configuration. Rails will automatically look for a file with the name `index.html` or `index.html.erb` (you'll learn about the `.erb` format when you learn about views), and directly render that file.
Pretty convenient, right?

### Other important actions 

- `before_action`: A callback that sets the @activity instance variable with the Activity model instance, based on the id passed in the URL, before executing show, edit, update, and destroy actions.

- `show` action: Displays the information of a single Activity instance, stored in the @activity instance variable. (GET Request)

- `new` action: Creates a new instance of the Activity model, stored in the @activity instance variable. (GET Request)

- `edit` action: Edits an existing Activity instance, stored in the @activity instance variable. (GET Request)

- `create` action: Creates a new Activity instance with the parameters passed from the form, stored in the @activity instance variable. If the save is successful, it redirects to the show view with a success message, otherwise it renders the new view with an error message. (POST Request)

```ruby

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

```

- `update` action: Updates an existing Activity instance with the parameters passed from the form, stored in the @activity instance variable. If the update is successful, it redirects to the show view with a success message, otherwise it renders the edit view with an error message. (PUT/PATCH Request)

```ruby

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

```

- `destroy` action: Destroys an existing Activity instance, stored in the @activity instance variable. It then redirects to the index view with a success message. (DELETE Request)

```ruby

  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

```

- `set_activity` private method: Sets the @activity instance variable based on the id passed in the URL.

- `activity_params` private method: Strong parameters method, allows only the title, activity_type, start, duration, and calories attributes to be passed as parameters to the Activity model.

<img width="721" alt="image" src="https://user-images.githubusercontent.com/76661350/215396083-b3815770-5658-4ed7-b1dc-fde3d409e833.png">


## Looking at the logs

Logs are useful to debug the application and display information about what is happening (as they 'log' everything). They can be viewed in the terminal where you ran `rails server`.

Lets understand one such log. Others follow a similar pattern and can be explored on your own.

<img width="721" alt="image" src="https://user-images.githubusercontent.com/76661350/215396369-d42600fa-e60b-438a-ac3c-8701ad3a3b4e.png">

This is generated when you try to edit an activity.

- The first line indicates that it has started the "PATCH" method for the _route_ `/activites/1`.

- Processing by `ActivitiesController#update` indicates that the request is being processed by the `ActivitiesController`'s `update` action.

- The next line indicates all the paramters being passed. This is the body of an HTTP Request. It contains all the information of our activity.

- `set_activity` is run as a before action to find the mathing activity.

- `UPDATE "activities" SET "calories" = ?....` indicates that an SQL `UPDATE` query is run to update our activity in the database.

- `Redirected to https://mittal-parth-zany-space-engine-6pvjx5rjx743pwp-3000.preview.app.github.dev/activities/1` indicates that after successful updation of the record, the user has been redirected to `/activities/1` (showing the activity)

- `Completed 302` indicates the status code of the response. 302 as you'd recall stands for redirect.

## `rails generate controller`
Scaffolding is an extremely easy and powerful way to bring up your resources. However, this is not the only way you can create controllers.
They can also be generated normally by

```shell
rails generate controller NAME [action action] [options]
```

Using this, you can create your own controllers as well. They do not have to be always bound to a particular model
and can exist independently as well.

## Routing
Now, we have all the CRUD URLs by default for us, thanks to scaffold. Let's dig a bit deeper into how routes works.
Open up `config/routes.rb`. Your file will look something like this:

```ruby
Rails.application.routes.draw do
  resources :activities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

```

This is the file where all routes for the application are defined. Whenever the server receives a request, it searches among this list of routes and controller action mappings to find what to do with the request.
Note the second line:

```ruby
resources :activities
```

This is what generates all the CRUD operations on that model. In general, if you have a model, you can add all the CRUD operations by using `resources :NAME` without having to individually define routes.

However, sometimes we need other routes too, and not just these basic ones. An example is the following:

```ruby
 get 'about', to: "pages#about"
```

This tells Rails to dispatch a GET request to `/about` to the `about` action of the `Pages` controller. The generic format is `GET/POST/etc 'route', to: 'controller#action'`

But what if you wanted an additional route on your resource? Lets say you wanted the following routes:
- `/activity/load`: to load some activity data from another file.
- `/activity/:id/share`: to share your activity with friends.

You could write these routes similar to the previous way; where you explicitly define the entire route. However, for URLs that add to resources, there is a better way.

```ruby
resources :activities do
  member do
    get 'share' # GET /activity/:id/share
  end
  collection do
    get 'load' # GET /activities/load
  end
end
```

`member` adds the route to every individual record of that item, making routes that contain the ID of the item. `collection` adds the route to the entire collection, and so there are no IDs to the URL.
Not providing `to:` will tell Rails to look for a action with the same name as the URL, in the controller for that model.

## References
- [Rails Routing from the Outside In](https://guides.rubyonrails.org/routing.html)
- [Action Controllers](https://guides.rubyonrails.org/action_controller_overview.html)
- [Layouts and Rendering in Rails (Views)](https://guides.rubyonrails.org/layouts_and_rendering.html)
