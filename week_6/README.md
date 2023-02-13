# Week 6 - Associations and Validations

We have so far learnt a LOT of stuff. Starting right from ruby, to models, controllers, views, we have come so far. Yet there are many concepts that are still to be discussed, two of the most important being *Associations* and *Validations*

Associations in web development refer to the relationship between different objects or entities in a web application. For example, in a blogging platform, an association can be between a user and their posts, or between a post and its comments. These relationships are important because they help to model the real-world scenario and create a more structured and organized data.

I always like to say, programming has taken its complete inspiration from the way a human works. For instance, a human always has a relation with someone else. It could be parents, grandparents, siblings so on. But relations are the fundamental backbone, and its the same in web development as well. Any model you use is useless unless there is a relation with something else.

_Validating_ data is an important part of designing applications.
Missing, incomplete or incorrect user data often leads to bugs that are
difficult to fix. If a user can possibly screw something, they will.

Validations in web development refer to the process of checking the data entered into a web application for correctness, consistency, and completeness. They are an important aspect of web development as they ensure that the data entered into the system meets certain criteria and is of the required format.

For example, if a web application requires a user to enter their email address, a validation can be used to check that the email entered is in the correct format, such as "example@domain.com". If the entered email is not in the correct format, the validation can return an error message asking the user to enter a valid email address.

## Associations

Before we get into associations, lets study about few basic concepts about database and models.

- In a relational database, we store information as a set of tables with rows (_records_) and columns (_attributes_).

- If we can uniquely identify a row using values stored in a group of columns, we call the group _primary key_. 

- For example: In a `users` table, we can uniquely identify each row by the e-mail of the user but not the name as two people might have same name.

By default, Rails generates an integer column `id` which automatically
increments with each new record added and is used as the primary key.

Rails provides a high-level API for interacting with the database called Active Record, which allows developers to perform database operations using a simple and intuitive syntax. For example, to retrieve all the posts from the database, a developer could write the following code:

```
posts = Post.all
```

Active Record also provides built-in support for validations, associations, and migrations, which makes it easy to manage the data in a web application.With the help of Active Record, developers can interact with the database using a simple and intuitive API, which makes it easy to manage the data in a web application.

A _foreign key_ is a column that matches a primary key in a different
table. Thus, the column `user_id` in `articles` table is a foreign key.

> Note: Rails do not automatically generate the foreign key, so make
> sure to add them in a migration.

- [What Is a Primary Key?](https://www.lifewire.com/primary-key-definition-1019179)
- [SQL - Foreign Key - TutorialsPoint](https://www.tutorialspoint.com/sql/sql-foreign-key.htm)

## Types of Associations

Rails supports six types of associations (_linkages_), each appropriate
to different use case:
- Belongs to
- Has one
- Has many
- Has many through
- Has one through
- has and belongs to many

We will talk about Belongs to, Has one and Has many association types as
the other three types are similar modifications. 

In general, some of the most common relation terms in web development are:

- One-to-One Association: This type of association is used when one object is related to exactly one other object. For example, a user may have only one profile.
- One-to-Many Association: This type of association is used when one object is related to multiple other objects. For example, a user may have many posts.
- Many-to-Many Association: This type of association is used when multiple objects are related to multiple other objects. For example, a post may have many tags, and a tag may belong to many posts.
- Polymorphic Association: This type of association is used when one object can belong to multiple other objects, each with a different type. For example, a user may have a profile and a post, both of which are related to the same user object.
- Self-Referential Association: This type of association is used when an object is related to itself. For example, a user may follow other users, and a user may be followed by other users.

### Belongs To

A `belongs_to` association indicates the model cannot exist without the
other model. In our blogging application, an article cannot exist
without an user, so a `belongs_to` association is appropriate. It represents a one-to-one relationship between the two models. 

```ruby
class Article < ApplicationRecord
  belongs_to :user
end
```

### Has One

A `has_one` association indicates the model "has one" instance of the
other model. This relation also models a one-to-one relation.

For example, consider a web application that has a User model and a Profile model. Each User has exactly one Profile, and each Profile belongs to exactly one User. This can be modeled using the has_one association:

```
class User < ApplicationRecord
  has_one :profile
end

class Profile < ApplicationRecord
  belongs_to :user
end
```
With this association defined, a User instance can access its associated Profile using the profile method:
```
user = User.first
user.profile # returns the associated profile
```
Similarly, a Profile instance can access its associated User using the user method:
```
profile = Profile.first
profile.user # returns the associated user
```

### Has Many

A `has_many` association indicates the model "has many" instances of the
other model. It is used to model a one-to-many relationship between two models, where one model has multiple instances of the other model. 

For example, consider a web application that has a User model and a Post model. Each User can have multiple Posts, and each Post belongs to exactly one User. This can be modeled using the has_many association:

```ruby
class User < ApplicationRecord
  has_many :posts
end

class Post < ApplicationRecord
  belongs_to :user
end
```

```
user = User.first
user.posts # returns an ActiveRecord::Associations::CollectionProxy containing the associated posts
```

Similarly, a Post instance can access its associated User using the user method:

```
post = Post.first
post.user # returns the associated user
```

- [Database Relationships](https://condor.depaul.edu/gandrus/240IT/accesspages/relationships.htm)

### Helper Methods

After defining associations, we gain many useful functions as:

```ruby
# Same as ProfilePhoto.find_by(user_id: user.id)
user.profile_photo

# Same as Articles.where(user_id: user.id)
user.articles

# Same as Article.create(user_id: user.id, published_at: Time.now)
user.articles.create(published_at: Time.now)

# Deletes the user *and* their profile photo
user.destroy
```

- [Active Record Associations - Ruby on Rails Guides](https://guides.rubyonrails.org/association_basics.html#belongs-to-association-reference)
- [Relationships - Jumpstart Lab Curriculum](http://tutorials.jumpstartlab.com/topics/models/relationships.html)

## Validations

Validations ensure only "valid" data is saved into the database. For
example: we have to ensure that users provide a valid e-mail address, so
that "reset password" emails are delivered correctly. Now, if we had not validated emails in the first place, our reset password would not work the way we want it to.

That leads to even more troubles. 

There are several ways to provide validations, at different levels of
the application:
- Database constraints (database-level validation)
- Active Record validations (model-level validation)
- Controller-level validations
- Client-side validations using Javascript (view-level validation)

You may ask yourself, which validation is the best? Well, client side validations are very very unreliable, as they are extremely spoofable. Having just a client side validation is useless. Having one has its benifit, because it is quick and lets the user know the error even before any message is sent to server. Ie., first it is validated and then request is sent. That way it is fast, but security wise it is not reliable at all. 

Validations in Ruby on Rails are used to ensure that the data stored in a model conforms to certain rules and constraints. Validations are run before saving a model to the database, and they can prevent the model from being saved if the data is invalid.

- [Why Use Validations](https://guides.rubyonrails.org/active_record_validations.html#why-use-validations-questionmark)

### Popular Validations

We will discuss the more popular and commonly used validations. You can
check out the full API here: [Validation Helpers](https://guides.rubyonrails.org/active_record_validations.html#validation-helpers)

- Presence: check if the attribute is not empty.

```ruby
class Article < ApplicationRecord
  validates :title, presence: true
end
```

- Numericality: validates numeric properties. Has additional options
  `only_integer`, `greater_than`, `less_than` and others.

```ruby
class Student < ApplicationRecord
  # CGPA must be decimal number between 0 and 10 (inclusive).
  validates :cgpa, numericality: {
    greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 10.0
  }
end
```

- Length: validates the length of attribute in different ways with
  options `minimum`, `maximum`, `within` and others.

```ruby
class User < ApplicationRecord
  # Phone number can be between 10 digits and 12 digits
  # (including country code)
  validates :phone_number, length: {
    minimum: 10,
    maximum: 12
  }
end
```

- Format: validates whether the attribute matches a [regular expression](https://www.rubyguides.com/2015/06/ruby-regex/)

```ruby
class User < ApplicationRecord
  validates :name, format: {
    with: /\A[a-zA-Z ]+\z/,
    message: "only allows letters and spaces"
  }
```

- Uniqueness: validates whether the attribute is unique for the model.

```ruby
class User < ApplicationRecord
  validates :email, uniqueness: true
end
```

You can also create custom methods to validate the models.

```ruby
class Invoice < ApplicationRecord
  validate :expiration_date_cannot_be_in_past

  def expiration_date_cannot_be_in_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in past")
    end
  end
end
```

```
class Student < ApplicationRecord
  validates :email, uniqueness: true
  validates :phone_number, length: {
    minimum: 10,
    maximum: 12
  }
  validates :cgpa, numericality: {
    greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 10.0
  }
end
```

The above code validates the Student model with:
- Email: Uniqueness
- Phone Number: Length
- CGPA: Less than 10, but greater than 0.

### Save vs Save!

The validations are executed when we try to save (or update) the
database record.

The functions ending with `!` (`save!`, `update!` and others) are called
_unsafe functions_ and raise an exception if the record is not valid.

On the other hand, functions not ending with `!` are called _safe
functions_ and return true/false depending whether the record is valid.
Thus, you must use the return value for control flow like `create`
action:

```ruby
class UsersController < ApplicationController
  def create
    if @user.save
      flash[:notice] = 'Your account has been created'
    else
     flash[:alert] = 'Unable to create your account'
    end

    redirect_to users_path
  end
end
```

When a model is saved and its validations are run, the valid? method can be used to check if the model is valid. If the model is not valid, the errors method can be used to access the error messages associated with the model:

```
user = User.new
user.valid? # returns false
user.errors.full_messages # returns an array of error messages
```

Validations are an important tool for ensuring the integrity and consistency of the data stored in your Ruby on Rails application. By defining validations, you can ensure that the data stored in your models conforms to the rules and constraints that you specify, and you can prevent invalid data from being stored in the database.

### Displaying Errors

We can check whether a record is valid or not using `valid?` and
`invalid?` methods:

```ruby
admin = User.new
admin.valid?
```

We find all errors for an record using `errors.full_messages` method:

```ruby
admin.errors.full_messages
```

The errors are displaying the view `_form.html.erb` as:

```erb
<% if @article.errors.any? %>
  <div id="error_explanation">
    <h2>
      <%= pluralize(@article.errors.count,  "error") %> prohibited this
      article from being saved:
    </h2>

    <ul>
      <% @article.errors.each do |error| %>
        <li><%= error.full_message %></li>
        <% end %>
    </ul>
  </div>
<% end %>
```

Which generates a list of errors with the `@article` variable.

- [Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html#custom-methods)
- [Validations - Jumpstart Lab Curriculum](http://tutorials.jumpstartlab.com/topics/models/validations.html)