# Authentication | Activity Tracker

Now that we have a good, functioning app ready, we need to secure it. Right now, anyone can access the data that we are entering. This is particularly concerning, since a lot of this might actually be sensitive information (especially in the case of a fitness tracker app), and needs to be secured properly.

One way to do this is to allow only authorised users to be able to view the information stored. This is known as **authentication**. You provide basic information to prove that it is indeed you who are making the request, so that the application can trust you.

In Rails, there is no in-built authentication system. However, there are great gems that are available for this very purpose. We will look at one of the most common ones, which is also in use at IRIS, called **Devise**.

## Devise
`Devise` is an gem that provides authorisation capabilities to your Rails app, with very little difficulty. It is nearly completely customisable, and can be modified to fit all your individual needs. You can read a bit more about the project from the link in the references.

We'll look at their README file, and quickly follow along to get it up and running.

First, we need to get the gem. Add this to your `Gemfile`

```ruby
gem 'devise'
```

Then we need to generate the files that Devise needs. This is done easily by the generater that the kind folks at Devise have made for us.

```shell
$ rails generate devise:install
```

A few instructions would be printed onto your console. Make sure you follow them to properly set it up.

Great job! Now you have Devise installed, you can set it up to protect your application.

## References
- [Devise Repository](https://github.com/heartcombo/devise)