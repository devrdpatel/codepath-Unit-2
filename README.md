# Project 2 - *Flixster*

Submitted by: **Dev Patel**

**Flixster** is a movie browsing app that allows you to see some of the latest movie titles and basic information about them.

Time spent: **4** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] Users are able to see a customized app icon and launch screen
- [x] Your app should work for any screen size and orientation using AutoLayout constraints
- [x] Mark here if you will demostrate auto layout implemention as horizontal rotation or different phone size or both, then erase this text
- [x] Displays at least 5 different movies in a table view
- [x] Can tap into detail view of movie with a full description, backdrop image, and title
 
The following **optional** features are implemented:

- [x] Unique UI changes, such as background, font/color changes, etc.
- [ ] User implements a collection view
- [ ] User implemenets tab bar controller with at least two screens

The following **additional** features are implemented:

- [x] Added a UIScrollView for the DetailViewController so that users can scroll to see all content when flipping the phone orientation to horizontal

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/devrdpatel/codepath-Unit-2/blob/main/Flixster-Pt1.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with Kap for MacOS  

## Notes

Implementing a table view was pretty straightforward for me. I found it challenging trying to implement a collection view and then connecting it using a tabview so in the end, I ended up not adding that to this project.

## License

    Copyright 2023 Dev Patel

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

# Project 3 - *Flixster*

Submitted by: **Dev Patel**

**Flixster** is an app that introduces networking by requesting movie information from the Movie DataBase API and then displaying it on the app, giving users the option to view movies in a table view or as a collection view. Tapping on a movie will take them to a detail view that will display additional information about the movie.

Time spent: **3.5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] Implement network call and table view to display a list of movies currently playing (title, description, image)
- [x] App has a collection view with the same list of movies
- [x] Uses a tab bar controller to switch between collection view and table view screens
 
The following **optional** features are implemented:

- [ ] Make an additional network call to another end-point.	
- [x] Allow users to scroll when context items are off-screen (table view implemention)

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/devrdpatel/codepath-Unit-2/blob/main/Flixster-Pt2.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

<!-- Replace this with whatever GIF tool you used! -->
GIF created with Kap for MacOS

## Notes

It was challenging trying to adjust the layout of the collection view so that the poster images fit nicely. There are so many different customizations available with a collection view and it was initially difficult to figure out what I needed to change but I was eventually able to figure it out. I also tried to make an additional network call to another end-point but couldn't figure out how to do resuse the existing tableview for this yet so the **See Similar Movies** button that is visible currently doesn't work as expected.

## License

    Copyright 2023 Dev Patel

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
