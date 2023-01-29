# Week 4

Hello! Hope you are having a wonderful time at the bootcamp. For this week, we will look into controllers, routing and authentication. You can find the links to the documents below.

- [Controllers](./activity-tracker/README.md)
- [Authentication](./activity-tracker/authentication.md)

## Assignement 1
After going through the resource on controllers, it is time to make your own! Create a contoller action called `stats` that is invoked from the URL `/activities/stats/`. This controller action should define at least two *instance variables*:

- `total_duration`: The total duration of all activity logged.
- `total_calories`: The total amount of calories burnt.

Please ensure that you are able to access the URL from a browser. Also make sure that the variables are named **exactly** that.

## Assignment 2
Now that you have a functioning app ready, you need to protect it. You can't have anyone in the world access your activity logs, right? The task is simple - setup authentication!
