# Assignment 1

## Name ideas
 - This
 - We couldn't decide on a name
 - Team name
 - Team team
 - Work
 - Mascot
 - Duneatin'
 - Scarf City

## Members
### Campbell Nicholas - Art Designer
### Thomas Pedersen - Programmer, Music
### Sven Russel - Programmer
### 1831984 Matthew Yi - Team Lead, Writer, Data Scientist
I was team lead for the COSC 202 ANDIE project and under my management our team produced an excellent product well ahead of the deadline with numerous additional features. My experience as a dungeon master for D&D has honed my creative storytelling abilities. I have taken papers in data science and statistics, which will aid my ability to process, manipulate, and make use of big data that has over 100,000 rows. With my blend of leadership, story-telling, and data-driven approach, I believe I am well suited to fill multiple roles in this project.

## The Project
We will be building a 2D game with puzzles and RPG mechanics using the C programming language and SDL2 libraries. We intend for the game to have educational mechanics while being a fun experience.

The player will explore Dunedin.
Goal - return albatross egg to peninsula
Weather - from data set. Affects rate of energy depletion and what enemies show up
Random encounters - each region has different distributions of spawning enemy types
Enemies - sentient food. The player can eat the food to heal and gain status effects if they win, if not nothing happens
Trivia questions - unlock chests of food for pacifists, obtain items
Bosses - us four, each associated with a different macro + caffeine
Final boss - Dr Trotman
Score - defeating food, answering trivia, time bonus

## Data Sets
### Food Data
[Food data download link]
### Weather Data
[Weather data download link](https://www.physics.otago.ac.nz/eman/weather_station/archive.php)

We are using weather data sourced from the Energy Studies Weather Station of the University of Otago. In game weather will be determined by the weather patterns of the last twelve months. 

Variables will be used in game as follows:
 - Temperature - temperatures outside of a comfortable range

There will be two gamemodes:
 - Arcade - in order for players to experience meaningful changes in weather/time of day without playing for hours at a time, each 24 hour period of data is condensed down into 10 minutes of gameplay. Likewise seasons will be 8 days long each.
 - Live - in game weather will match current weather data for Dunedin. This will require an internet connection. 

### Conservation Data
Conservation data will be used inside quizzes with the player earning score for each question answered successfully. The player may need to pass a test in order to progress to the next section.
### Geospatial Data
Our map is going to be based on the map of Dunedin.
### Synergy
The datasets go together because each of them influence different aspects of gameplay:
 - The weather data determines the state of the environment the player is in.
 - The food data determines what kind of enemies the player will encounter.
 - The conversation data forms the backbone of the educational trivia aspect of the game.

## Organization
Communcation is being maintained daily through a Facebook Messenger group chat.
We are using a Trello board to organise the tasks that need to be done and to keep track of deadlines.

There are lists for:
 - To Do
 - Doing
 - Done
 - Concepts - this list includes ideas of different software projects we could build, as well as ideas for the project and team names and game terms.
 - Datasets - this list organises the potential datasets we could use for the project.
 - Uses for food data
 - Second dataset ideas
 - Files
 - Features
 - Core Mechanics
 - Desirable Mechanics

 We also have a PERT chart that tracks dependencies and timelines.

 INSERT CHART HERE

## Risk Analysis
Risks include:
Team member dropping out due to unforseen circumstances.
Technical challenges such as learning SDL2 and advanced C languages while completing the project.
Creating a polished and fun experience within the 12 week time frame.
Scope creep.


We will mitigate these risks by working inside a realistic scope, communicating clearly with each other and sticking to our core vision with extras being added afterwards.
Feedback will be acquired during the testing phases with as many bugs as possible removed before final release.
## Attribution
### ChatGPT
 - We asked ChatGPT what data set would complement a video game using nutritional data and it suggested weather data. Weather data was used in the project but in a different way than what was suggested.
## Specs
Between 2 and 10 pages