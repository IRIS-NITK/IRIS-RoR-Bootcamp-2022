# Week 5 - Views 

So after 4 weeks, we have our basic app ready! 🥳
However, there is one problem. It looks 🥴. Lets fix that! We'll now style our application using [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/) and look at the _View_ layer which is responsible for presenting data appropriately. 

In a Rails application, the views are stored in app/views folder.
Each controller has their own views and the name of view file must match the action name _exactly_. Depending on the action executed, the views are used.

## Views as HTML Files

At a basic level, views are HTML files in which we insert information
from our controllers. As views are HTML files, anything that works in
HTML, CSS and Javascript works here. If you need a refresher 👇🏻

- [HTML Tutorial](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/blob/main/week_1/HTML.md)
- [CSS Tutorial](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/blob/main/week_1/CSS.md)

## Bootstrap

Bootstrap is a free and open-source CSS framework directed at responsive, mobile-first front-end web development. It contains HTML, CSS and JavaScript-based design templates for typography, forms, buttons, navigation, and other interface components. 

> Why you ask? 
> We could write all of our styling on our own but thats hard and time consuming.

### Installing Bootstrap

> **We have already done this for you but this is so that you know how to do it later**

Under the `activity-tracker` go to the `Gemfile` and add the Bootstrap Ruby gem by pasting the following code at the end of the file.

`gem 'bootstrap', '~> 5.0.2'`



On the terminal run `bundle install`









