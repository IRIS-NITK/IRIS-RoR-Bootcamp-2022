## HTML

Have you ever wondered how websites are rendered in your browser? How does the website know what exactly to show you, and how to show you? Well, HTML is the answer to that.


HTML stands for *Hyper Text Markup Language*. A Markup Language is a way that computers speak to each other to control how text is processed and presented. We use two main things to implement this in HTML: *tags and attributes*.

This is how a standard HTML document looks like:

```
<!DOCTYPE html>
<html>
<head>
<title>My Introduction</title>
</head>
<body>

<h1> I study at NITK. </h1>
<p> I live in Mangalore. </p>

</body>
</html>
```

`html`, `head`, `title` etc are called tags, and whatever is enclosed within them to provide additional details are called attributes.

```
<a href="https://www.iris.nitk.ac.in">
    Hey, welcome to IRIS!
</a>
```

The `<a>` tag defines a hyperlink. The `href` attribute specifies the URL of the page the link goes to.

### How to start writing HTML files?

    1. Make a new file with .html as the extension.
    2. Open any text editor you like.

- All HTML files have to start with the `<html>` tag. 

- The `head` tag contains all the metadata (data about data)

- The content inside the `<title>` element will be shown in the browser's title bar or in the page's tab.

- All the things you want to be rendered should be enclosed within the body tag

```
<body>
    !Everything you want!
</body>
```

### Some common HTML tags

#### `Paragraph tag`
The `<p>` tag is used whenever you want to render paragraphs onto the screen. Whatever text is enclosed within the tag will be treated as a paragraph.
```
<p> Your parapraph goes here </p>
```

#### `Heading tag`

There are 6 heading tags in HTML, starting from `<h1>` to `<h6>`. Each of the tags renders the text within as a heading, with `<h1>` being the largest font-size and `<h6>` being the smallest.
```
<h1> Heading1 </h1>
<h2> Heading2 </h2>
```

#### `Link tag`

The link tag `<a>` is used whenever you want to link a certain piece of text to a webpage. 
```
<a href="URL"> Text </a>
```

#### `Image tag`

The HTML `<img>` tag is used to embed an image in a web page.  The src contains the *relative* location of the image that you want to embed, and alt contains the text to be displayed in case the image couldn't be rendered.

```
<img src="iris_logo.png" alt="IRIS logo">
```

#### `Div tag`

The `<div>` tag defines a division or a section in an HTML document. The tag is very commonly used as a container for HTML elements - which is then styled with CSS or manipulated with JavaScript.
```
<div>
    Hey!
</div>
```

#### `Span tag`

The `<span>` tag is an inline container used to mark up a part of a text, or a part of a document. The `<span>` tag is much like the `<div>` element, but `<div>` is a block-level element and `<span>` is an inline element.
```
<span>
    Hey!
</span>
```
*Try out both div and span to see the difference between the two!*

#### `Form tag`

The `<form>` tag is used to create an HTML form. Forms are used to collect user input, such as text field values, radio button selections, and checkbox selections.

The `<form>` tag can contain a variety of form elements, such as text fields, radio buttons, checkboxes, and more. The name attribute is used to give each form element a unique name, which is used to identify the element when the form is submitted.

Here are some of the form elements:

- `<input>`: This element is used to create a variety of input fields, including text fields, checkboxes, radio buttons, and more. The type attribute is used to specify the type of input field, such as text for a text field or checkbox for a checkbox.
- `<textarea>`: This element is used to create a multi-line text input field.
- `<select>`: This element is used to create a drop-down list of options. The `<option>` element is used to specify the options that are available in the drop-down list.
- `<button>`: This element is used to create a button that can be clicked to submit a form or perform some other action.
- `<label>`: This element is used to associate a label with a form element. This is useful for providing a user-friendly name for an input field or button.

```
<form>
  <label for="name">Name:</label><br>
  <input type="text" id="name" name="name"><br>
  <label for="email">Email:</label><br>
  <input type="text" id="email" name="email"><br>
  <label for="message">Message:</label><br>
  <textarea id="message" name="message" rows="5" cols="30"></textarea><br>
  <button type="submit">Submit</button>
</form> 

```

#### `Header tag`

The `<header>` tag is used to define a header section of a web page. It typically contains site branding, navigation links, and other information that is useful at the top of the page.
```
<header>
    <h1>My Website</h1>
</header>
```
#### `Footer tag`

The `<footer>` tag is used to define a footer section of a web page. It typically contains information such as copyright notices, contact information, and links to additional resources.

```
<footer>
    <p>Copyright 2021 My Website</p>
</footer>
```

#### `List`


In HTML, there are two types of lists: 
- Ordered lists
- Unordered lists.

An ordered list is created using the `<ol>` element, and each list item is represented by an `<li>` element. The list items are automatically numbered in the order they appear in the list.

Here is an example of an ordered list:

```
<ol>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ol>
```

An unordered list is created using the `<ul>` element, and each list item is again represented by an `<li>` element. The list items are not automatically numbered and are typically displayed with bullet points.

Here is an example  of an unordered list:
```
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
```
#### `Nav tag`

The `<nav>` tag is used to define a navigation section of a web page. It typically contains a list of links that allow the user to navigate to different sections of the site.
```
<nav>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>
</nav>
```

### Classes and IDs

Suppose you have a number of different tags in your document, and you want to reference a set of them together, maybe for the purpose of styling, or for the purpose of adding JavaScript. This is where classes and ids come into picture.

The class attribute is often used to point to a class name in a style sheet. It can also be used by a JavaScript to access and manipulate elements with the specific class name.

```
<div class="car">
    Maruthi 800
</div>

<div class="car">
    Maruthi Alto
</div>

<div class="bike">
    Pulsar
</div>
```

Here, 2 divs belong to the "car" class, and the other div belongs to the "bike" class. This is extremly helpful when you write styles and add JavaScript to your webpage, which will be discussed later on.

The HTML `id` attribute is used to specify a unique id for an HTML element. The important difference between class and an id is that an id has to be unique. The functionality of class and id remains the same.

```
<div id="city">
    Mangalore
</div>
```



### A final HTML document

So far, we have covered a few HTML tags, lets just write a simple web page with it!

```
<!DOCTYPE html>
<html lang="en">
<head>
    <title>First Webpage</title>
</head>
<body>
    <h1>Welcome to my first webpage!</h1>
    <p>This is a paragraph</p>
    <p>This is the <a href="https://www.iris.nitk.ac.in">link</a> to IRIS NITK.</p>
    <div class="city">
        The college is situated in Mangalore.
    </div>
</body>
</html>
```
#### Preview

![HTML](https://user-images.githubusercontent.com/75667393/208149478-ed47ecf0-c671-41bd-8bed-a334dac4b070.png)

### Resources

- [Introduction to HTML by w3schools](https://www.w3schools.com/htmL/default.asp)
- [HTML by GeeksForGeeks](https://www.geeksforgeeks.org/html/)
