# Duneatin' - Assignment 1

## Members
### 3340483 Campbell Nicholas - Art Designer
I have just completed my honours degree in genetics before moving over to computer science this year for a DipGrad.<br>Through this I have demonstrated the capability to excel in a long project, with skills such as researching, commitment, writing and team work.<br>I have just been part of a COSC202 ANDIE team last semester where we worked well as a team and produced a good product.<br>I have also been part of numerous teams, especially in the music scene, lending me the skills to help the team excel despite a lot of my experience being from outside the field.
### 3391288 Thomas Pedersen - Programmer, Music
I have a master's degree from Falmouth University in Game Development (Audio + Design) and have programmed games and composed music since 2010.<br>My online presence is under the nickname 737BassTP.
### 2257106 Sean Russell - Programmer
I worked with a team for COSC202 as a developer for the ANDIE project, developing image filters and graphic effects to edit an image.
During summer school I took COSC360 (Video game design) and worked as Head of Development.<br>Our team created a tower defence game named "Alien Interplanetary Defence" using unity and c#.
### 1831984 Matthew Yi - Team Lead, Writer, Data Scientist
I was team lead for the COSC 202 ANDIE project and under my management our team produced an excellent product well ahead of the deadline with numerous additional features.<br>My experience as a dungeon master for D&D has honed my creative storytelling abilities.<br>I have taken papers in data science and statistics, which will aid my ability to process, manipulate, and make use of big data that has over 100,000 rows.<br>With my blend of leadership, story-telling, and data-driven approach, I believe I am well suited to fill multiple roles in this project.

## The Project
We will be building a 2D game with puzzles and RPG mechanics using the C programming language and SDL2 libraries.
We intend for the game to have educational mechanics while being a fun experience.

### Story
Dr Trotman has brought all the food in Duneatin' to life, which now roams around the city attacking civilians.<br>The player has rescued an albatross egg and must endure adverse weather and evil food to return it to the peninsula.

### Gameplay components
- Goal - return albatross egg to peninsula.
- Weather - from data measured in Dunedin.<br>Affects rate of health depletion and rate/type of spawning enemies.
- Random encounters - each region has different distributions of spawning enemy types.
- Enemies - sentient food.<br>If the player wins the fight, they can eat the food to heal and gain status effects.<br>Otherwise, nothing happens.
- Trivia questions - based on conservation/native wildlife data.<br>Answering questions correctly unlocks chests of food for pacifist playthroughs, obtain items, and access to areas.
- Bosses - each of the four developers will feature as bosses, each associated with a different macro (carbohydrate, fat, protein) + caffeine.
- Final boss - Dr Trotman, who attacks the player by throwing chocolate.
- Score - earned by defeating food, answering trivia, and awarded for fast game completion.

### Gamemodes
There will be two gamemodes:
- Arcade - in order for players to experience meaningful changes in weather/time of day without playing for hours at a time, each 24 hour period of data is condensed down into 10 minutes of gameplay.<br>Likewise seasons will be 8 days long each.
- Live - in game weather will match current weather data for Dunedin.<br>This will require an internet connection.<br>

## Data Sets
### Food Data
[Food data download link](https://www.matvaretabellen.no/)

The food data was published by the Norwegian Food Safety Authority and the Department of Nutrition at the University of Oslo.<br>The carbohydrate, protein, and fat content of foods will determine the enemy's stats.

### Weather Data
[Weather data download link](https://www.physics.otago.ac.nz/eman/weather_station/archive.php)

We are using weather data sourced from the Energy Studies Weather Station of the University of Otago.<br>In game weather will be determined by the weather patterns of the last twelve months.

### Transport Data (Bus Timetable)
[Bus Timetable](https://www.orc.govt.nz/public-transport/dunedin-buses/check-your-timetables)

Our game has a time mechanic, and in-game fast-travel can happen by travelling with buses according to the timetable.
This requires the player to be at the bus stop by the time the bus leaves, and the fast-travel destination is wherever the bus drives according to its timetable.

### Conservation Data
Conservation data will be used inside quizzes with the player earning score for each question answered successfully.<br>The player may need to pass a test in order to progress to the next section.

### Geospatial Data
Our map is going to be based on the map of Dunedin.

### Synergy
The datasets go together because each of them influence different aspects of gameplay:
- The geospatial data determines the layout of the map.
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

More lists will be added as needed, and defunct lists will be archived to limit clutter.

We are using a PERT chart to track dependencies and timelines.

INSERT CHART HERE

## Similar

### Games using Nutrition
There is a great wealth of educational games about nutrition made by government organisations or museums such as the Smithsonian.<br>These games are targeted at students, particularly younger children.<br>The experience is primarily educational (sorting food into food groups or balancing a healthy diet) and gameplay is secondary.<br>Our game will have fun and interesting gameplay as a primary focus, while still teaching nutrition in a passive manner.

<!-- A quick search for nutrition games comes up with lots of educational games from government organisations or museums such as the Smithsonian with a focus on teaching nutrition.<br>These, although suggesting aimed at students, appeared to be for younger children.<br>The main component of these games were to organise food into food groups or to balance a diet with the correct food groups.<br>Although very educational, these games felt more like a classroom exercise than a game.<br>We feel that our game should still be educational in the sense of passive learning - ie knowing this food is good to eat as it boosts this stat - but contain the charm of RPGs that feel fun to play.<br>-->

Survival games often have nutrition as a mechanic.<br>Most survival games (e.g.<br>Minecraft, Rust) have hunger as a single numeric variable that fills up when eating and does not consider the nutritional needs of the player beyond caloric intake.<br>SCUM however has a very detailed food system, where each food has values for protein, carbohydrate, fat, sodium, and vitamin composition.<br>Players must maintain all of these to surive.<br>We found that this system is a touch too gritty and prioritises realism over educating.<br>A Minecraft mod called Nutritional Balance appears to strike a balanced stance between simplicity and depth.<br>Food has vegetable, fruit, carbohydrate, protein, and sugar values and players are penalised if any of these levels are in excess or deficit.

<!-- In looking for other games with nutrition elements, survival games came to mind.<br>Whilst most survival games such as Minecraft or Rust require you to eat to maintain your hunger, with foods having a calorie or healing statistic, it seems hard to find many which utilise nutritional needs.<br>One game that does utilise this is SCUM, where each food has target nutrition statistics such as protein, carbs, fats, sodium etc, as well as a vitamin composition.<br>In this game players must maintain all their levels to survive.<br>Although this game uses nutritional data that we may use in our game, this seems quite overboard and detailed.<br>It also appears to be utilising this for realism's sake (along with many other meters) in order to make it hard to survive rather than for a more educational viewpoint.<br>A closer alternative to what might be good to utilise into our game is the Minecraft mod Nutritional Balance.<br>This mod gives vegetable, fruit, carb, protein, and sugar values to the food, where players are benefited for being in target range of the nutrients and penalised for having too much/too little of others.<br>This seems more in line with our game, but is still intended for a survival setting.<br>-->

Although a lot of games on the market utilise nutritional data, we have not been able to find any that do so with the same goals as us.<br>Nutrition appears to be used as the sole focus of active education, or as a means of making it harder to survive in a game.<br>We believe that by using nutritional data as stats for enemies (based on what food they are), players when eating, and the “theme” of the game is an innovative way to bring passive nutritional education whilst still being fun.

### Games using Weather
A weather system is very common in video games, however there seems to be a lot of variety in the way it is implemented and the effect it has on gameplay.

Games in the Animal Crossing series have a system featuring time, seasons and weather, all of which change spawn rates of different species that you can find around the island.<br>This is similar to what we intend to use our weather data for, where different weather events or seasons change what enemies appear.<br>Animal Crossing uses real-time drawn from the console clock/calendar with randomly generated weather, whilst Duneatin' will have both time and weather based on real world data.
<!-- What is interesting about Animal Crossing’s use however is that the time aspect is in real time drawing from the console's clock and calendar, whilst the weather is random.<br>For our main mode we intend to have structured weather, seasons and time, and for our arcade we intend to have realtime for all aspects.<br>-->

The weather system in The Legend of Zelda: Breath of the Wild is rather complex.<br>Weather occurs in four minute cycles with a probability associated with them based primarily on location, altitude, temperature and time.<br>We intend to implement our system differently.<br>Weather will be day-length (10 minutes in game), and will be consistent throughout the whole map.<br>Since our map is small and the weather data was obtained from a singular point location, all areas of DUneatin' will have the same weather.
<!-- It is not justifiable to have different weather in different locations as our map is relatively small (Dunedin) and we are using data obtained from just the Physics department at the University of Otago.<br>-->

In the Pokemon series, weather changes everyday and affects weather dependent Pokemon stats and abilities.<br>We intend to draw from this and have weather conditions affect stats of enemies or the player.<br>However, unlike Pokemon we will be using set weather data from an official data set rather than random.

### Chibi Knight
Chibi Knight is a free online game that has a lot of similar elements.<br>It is also a 2D RPG with random encounter combat and special boss fights, but lacks our educational trivia element and a connection to the real world as it is set in a purely fictional fantasy setting.

### Pokemon
Pokemon has a wide map but exploration is limited to an almost linear graph with few branches.<br>Accessible areas are limited by progression, terrain and Pokemon blocking the path, and NPCs who will let the player pass after completing a side quest for them.<br>There are also puzzles, such as rooms with boulders that can be pushed around in order to activate pressure plates or access areas.

### Legend of Zelda
The games in the Zelda series more often than not puts the player on a quest to traverse an overworld as a means of gathering items found in dungeons in order to be able to fight bosses responsible for the chaos in the game world.<br>The gameplay involves real-time combat, solving mysterious puzzles, and often sees the characters develop in the story.

## Evidence of customer interest
This game has been described to peers and other students not taking this paper, including students in the Master of Teaching and Learning course who will be teaching in secondary schools from next year.<br>Each time, the game has been met with interest and excitement.

Websites like [CoolMathGames](https://www.coolmathgames.com/) have been around for a long time and have maintained popularity throughout.<br>This shows that there is interest in fun games with educational value targeted at children and teenagers.

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
- We asked ChatGPT what data set would complement a video game using nutritional data and it suggested weather data.<br>Weather data was used in the project but in a different way than what was suggested.
