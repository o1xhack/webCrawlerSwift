# webCrawlerSwift

interview code challenge

## There is no way you using my code for your own project anywhere.


## Run it

The tableview is to visually interat, so if you want, just click to see the result.

After you download, just run like an iOS APP and the Output area will also print the result of each test case.



# File Explanation

### TableViewController.swift

Here is all stuff inside.

All stuff about parse and crawler is under the section (I using MARK: to noted) JSON and Crawler. This two part is where all stuff happened.

I write comment before each function to let you quickly know what the function is, and the name is easy to understand

#### TableView

Since I dont all job and seems not building a stuff with an APP is wired.

So I add very simple Table View to auto generate the test case and let you click to see result in an Alert View.

Notice that I don't do anything on the error handling on the TableView part since it's only for your to visualize if you want. All main stuff is stuff in the other part


### TableViewCell.swift

As you know, good habit to create when using TableView


### Page.swift

This is the model file to store the parsing object.
Fot this code challenge it is not very important to have this one. But whenever we want the future using the data, it's better to have the model to use.


## test1.json etc.

Here is three files about the test, all file are auto read inside the code and treated as a JSON data.

I personally add an empty file to test the empty case.