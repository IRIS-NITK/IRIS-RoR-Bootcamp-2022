## CSS

Is writing just HTML enough for a web page though? All the popoular websites around you look so attractive, and they do so using *css*. 

CSS stands for Cascading Style Sheets. CSS describes how HTML elements are to be displayed on different screens, like a laptop, mobile etc. The style definitions are normally saved in external .css files. With an external stylesheet file, you can change the look of an entire website by changing just one file!


### How to start writing CSS and include it in your HTML file?

There are 3 ways to write styles for your HTML:

    1. Inline - by using the style attribute inside HTML elements.
    2. Internal - by using a <style> element in the <head> section.
    3. External - by using a <link> element to link to an external CSS file

#### Inline
```
<h1 style="color:pink;">
    A Pink Heading
</h1>
```

#### Internal
```
<head>
    <style>
        body {
            background-color: powderblue;
        }
    </style>
</head>
```

#### External
The preferred way to write this is to use this method.

```
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
```

The file "styles.css" must be in the same folder as your HTML file, else the relative path to your css file must be provided.
Now, your HTML file and CSS files are interlinked. You can reference the different tags, classes etc from the CSS file.

### Writing CSS
Once your stylesheet is linked to your HTML page, you can use CSS rules to apply styles to the elements on your page. A CSS rule consists of a selector, which specifies the elements that the rule applies to, and a declaration block, which contains one or more declarations. Each declaration consists of a property and a value, separated by a colon. For example:

```
body {
  font-family: Arial, sans-serif;
  background-color: #fff;
}
```

Here, we are giving the font family Arial, a background-color of #fff to the body tag. 

Now, what if you want to select a specific part of your HTML? Like suppose a div. You want only that div to be affected, and the rest of the divs must remain the same.

Now, if you do 

```
div{
    background-color: #fff
}
```
This will apply this specific style to *all* the divs. To prevent this, we use *classes* and *ids* that we learnt above.
Any div can be given a id or class, and we can use selectors in CSS to give styling to that specific class alone.

Now, if your HTML file has a div whose class is "city", this is how you will give style to it:

```
.city {
    background-color: #fff;
}
```

The dot is called a selector. In CSS, selectors are used to select the elements on an HTML page that you want to style. There are a variety of selectors available, each with its own specific use cases. Here is a basic guide to some common selectors in CSS:

- The element selector selects elements based on the element name. For example, p would select all <p> elements on the page.
- The #id selector selects elements based on their id attribute. For example, #header would select the element with id="header".
- The .class selector selects elements based on their class attribute. For example, .warning would select all elements with class="warning".

### Popular properties

- `font-family`: This attribute specifies the font family to be used for the text in an element. It is often used to specify the typeface, such as Times New Roman or Arial.
- `font-size`: This attribute specifies the size of the font to be used for the text in an element. It is often specified in pixels or em units.
- `color`: This attribute specifies the color of the text in an element. It can be specified using a named color, such as "red", or using a hexadecimal code, such as "#FF0000".
- `background-color`: This attribute specifies the background color of an element. It works in the same way as the color attribute, but it applies to the element's background instead of its text.
- `border`: This attribute is used to specify the width, style, and color of an element's border. It is often used to add visual boundaries around elements.

These are just a few examples of the many attributes available in CSS. There are many other features and techniques in CSS, including the ability to apply styles based on the state of an element, the use of media queries to apply different styles for different screen sizes and devices, and the use of CSS preprocessors to write more concise and powerful stylesheets. For more information on these and other topics, you can refer to the resources.

## A final preview
Now that we have finished learning CSS, let us try adding some style to the HTML that we had prepared earlier

HTML file with class names added:
```
<!DOCTYPE html>
<html lang="en">
<head>
    <title>First Webpage</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1 class="HeadingOne">Welcome to my first webpage!</h1>
    <p class = "ParaOne">This is a paragraph</p>
    <p class = "paraTwo">This is the <a href="https://www.iris.nitk.ac.in">link</a> to IRIS NITK.</p>
    <div class="city">
        The college is situated in Mangalore.
    </div>
</body>
</html>
```
*This css file must be named styles.css in the same directory as the HTML file*

CSS file:

```
.HeadingOne{
    color: aqua;
    font-size: 40px;
}

.ParaOne{
    background-color: yellow;
}

.paraTwo{
    font-size: 20px;
}

.city{
    border: black;
    border-style: solid;
}
```

Preview:
![CSS](https://user-images.githubusercontent.com/75667393/208151193-9f29a2df-0de4-4bc4-b0d1-6e76ac48592a.png)

Looks decent? Try out different styling to make it even better!
### Resources

- [Introduction to CSS by w3schools](https://www.w3schools.com/css/css_intro.asp)
- [CSS by GeeksForGeeks](https://www.geeksforgeeks.org/css/)
- [Getting started with HTML and CSS](https://www.learn-html.org/)
