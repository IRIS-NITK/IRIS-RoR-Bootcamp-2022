# Assignment

So far you have added styles to your activity tracker, there is functionality, but it can definitely be improved. This week, you have to work on the following:

- Whenever a user logs in, they should be able to see ONLY thier activities in the dashboard. Imagine how you would do this - There has to be some assosication between the user and the activities, and you have to fetch only the activites created by this user. Will the relation be one-to-one, will it be one-to-many, what changes in the user table have to be done? 

- The Activity type right now is anything you type. Make it such that it is a drop down from a list of activities, and you fetch this activity list from the database. This will lead to making new models and assosciations, so think about it. But the advantage being you can add new activities centrally. 

- Validations: Add validations to the existing fields, like how calories could be only an integer, start has to be a date, and so on. Add some custom validations and render the errors in the views as well. 

- There could be an image assosciated with every activity. Read on how to process file uploads in rails. For example, a running activity can have a fixed associated picture to it. How will you implement? Will you make a seperate model or ask the user every time for an image upload? 

- Generate a PDF of all the statistics: There are gems that let you generate your own pdf, use one such gem and make a pdf out of the statistics page that lets you see all the activities a specific user has done. [Bonus task]

PS: This is an open ended assignment, you are free to implement more than the features listed above. Whatever is listed above is just a reference for you to implement, we want to see more! :)