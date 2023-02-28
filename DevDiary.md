<h1><strong>Dev diary for the production of my COMP250 artefact</strong></h1>

<h2><strong>Introduction</strong></h2>

This is a diary of my development process for my COMP250 artefact. I will be using this diary to keep track of my progress and to reflect on my development process. This diary will be split into eras, each of which will be a separate section. The eras will be split by major changes in the creation of the project, such as the addition of a new feature or the completion of a major milestone.

For each era, I will include a description of the changes made, a reflection on the development process, and a list of the changes made. I will also include a list of the changes made in each era in the table of contents. To also keep the citations section short all citations will be done in the era they are mentioned; this does mean that some citations may be repeated.

My artefact will be a multi agent system which will be used to simulate and prevent the spread of disease through a population. The system will be comprised of two components a neural network and a genetic algorithm. To make my life easier and to prevent over scoping I intend to not build my own neural network and instead intend to use a prebuilt library. My main contribution will be the devlopment of the genetic algorithm.

The link to this project is here: <a href="https://github.falmouth.ac.uk/JA244121/Comp250-JA244121">Project github</a>
(Though its very possible you are already on this page)

<h2><strong>Table of contents</strong></h2>
<ol>
<li><a href="#Era1">Era1: Deciding which AI to use (Research)</a></li>
    <ol>
    <li><a href="#Era1Changes">Changes</a></li>
    <li><a href="#Era1Intro">Introduction</a></li>
    <li><a href="#Era1Stage1">PyGame Learning Environment</a></li>
    <li><a href="#Era1Stage2">Lupoglaz Godot AI Gym</a></li>
    <li><a href="#Era1Stage3">NAD LABS youtube video</a></li>
    <li><a href="#Era1Stage4">Mohsen Zare GDNative neural net library</a></li>
    <li><a href="#Era1Stage5">Andrea Catania's custom Godot Distribution</a></li>
    </ol>
<li><a href="#Era2">Era2: Developing the agents (practical)</a></li>
    <ol>
    <li><a href="#Era2Changes">Changes</a></li>
    <li><a href="#Era2Intro">Introduction</a></li>
    <li><a href="#Era2Stage1">Creating the godot object</a></li>
    <li><a href="#Era2Stage2">Instantiating the objects in the main scene</a></li>
    <li><a href="#Era2Stage3">Instantiating the objects in the main scene</a></li>
    </ol>
</ol>

<h2 id="Era1"><strong>Era 1: Deciding which AI to use (Research)</strong></h2>

<h3 id="Era1Changes"><strong>Changes made</strong></h3>
<ul>
<li>Decided which AI to use for the project</li>
</ul>

<h3 id="Era1Intro"><strong>Introduction to era</strong></h3>
The main goal of this era was to decide which AI to use for the project. There are a few requirements I had for the AI, these were:
<ul>
<li>It must be able to be used in a 2D top down environment, as I dont want to make a whole 3d environment</li>
<li>It must be python based, as I am most familiar with python</li>
<li>Preferably it should be able to be used in godot or pygame as I want a visualisation of the agents</li>
</ul>

<h3 id="Era1Stage1"><strong>1: PyGame Learning Environment (PLE)</strong></h3>

My first choice was PLE [1] as it fufilled all of my requirements; PLE is a python library which add reinforcement learning to pygame. It has a number of game examples, for instance flappy bird which really helped in my research as I could see how it worked. However once I looked into developing my own AI's in PLE it became obvious that this was not the AI for me; the primary reason for this is that PLE didn't seem to have alot of documentation that wasn't about their prebuilt games. This meant that I would have to spend alot of time trying to figure out how to use the library, which would take away from the time I could spend on the project. I also found that the library was not very well maintained, with the last commit being in 2016 [2]. This meant that if I had any issues with the library I would have to fix them myself, which would take away from the time I could spend on the project.

<h3 id="Era1Stage2"><strong>2: Lupoglaz Godot AI Gym</strong></h3>

Next I looked into Lupoglaz's Godot AI Gym [3]. This was a library which used Godot and Python to create a reinforcement learning AI.

This AI environment showed alot of promise as it worked really well in the examples and I managed to get it up and running in a day or two. However I found out that there was basically no documentation for the library. There some examples which I watched working and I tried to read through them and understand them however they were not commented and thus I found it impossible to understand what everything did.

The other intersting thing about this library was that it was using very old versions of Godot and Python aswell as outdated libraries. This meant that looking for any information around using the library was difficult as most of the information I needed was outdated. This also meant that the setup process for the library was very difficult as I had to find the correct versions of everything and then get them to work correctly. I refined this into a nice setup instruction file which is something I intend to keep for the final project.

However looking into this library did help me learn a very important fact; the previous two AI's I had looked at were both reinfocement learning AI's. This meant they worked well if one agent was on the screen however what I want is a multi agent system. So after some research I found out what I really needed was a genetic algorithm. This meant if I still wanted to use Godot I would either have to find a gentetic algorithm library for Godot or make my own.

<h3 id="Era1Stage3"><strong>3: NAD LABS youtube video</strong></h3>

Next I looked into whether anyone else had made a genetic algorithm for Godot. I found a really interest YouTube video by "NAD LABS" in which he built his own genetic algorithm [4] with the goal of making agents go towards a box and scoring them based on this. This was really helpful as it showed some of the key concepts to look into and gave me a better understanding of GDScript. However the main thing that was missing from this video was any kind of neural nework, meaning the Agents would only be able to move along a predefined path and not change based on the environment. Despite this I still found the video incredibly helpful as it was a good start point.

<h3 id="Era1Stage4"><strong>4: Mohsen Zare GDNative neural net library</strong></h3>

On my search whether anyone else had made a genetic algorith I came across a youtube channel called Mohsen Zare [5]. This channel had a number of videos on genetic algorithms and neural networks in Godot. This is because the channel is run by the creator of a GDNative library for Godot [6]. This library runs on Godot-cpp [7] which is a release of Godot with C++ implementaion. This library looked really interesting and from the comments on the video it seemed to be working for quite a few people. 

I tried to install this neural net library and just could not get it past the compiling stage. Sadly on the video the creator said this should be easy and just skipped over the setup section so I had no idea where to go to or what to do. So sadly I had to give up on this library.

<h3 id="Era1Stage5"><strong>5: Andrea Catania's custom Godot Distribution</strong></h3>

While looking at Mohsen Zare's video a different video by Andrea Catania [8] popped up. This video was about making a neural network to play tic tac toe however Andrea talked about how he had made a custom Godot distribution [9] which made it way easier to use than installing my own custom modules. This was really interesting as I had been trying to install my own custom modules for the past few days and had not been able to get it to work. I managed to get the install done almost instantly and was able start looking into how to use it very quickly.

The custom distribution included a module named "brain" which was a neural network library containing a node called "brain area" allowing for the easy implementation of neural networks.

After initial research into this library I made the decision to use it for the full project. This was because it was very easy to use and had a few well thought out youtube tutorials to help me.

<h3 id="Era1Citations">Citations</h3>

<ol>
<li>“Home¶,” Home - PyGame Learning Environment 0.1.dev1 documentation. [Online]. Available: https://pygame-learning-environment.readthedocs.io/en/latest/user/home.html. [Accessed: 13-Feb-2023].</li>
<li>Ntasfi, “History for docs/user/home.rst - NTASFI/pygame-learning-environment,” GitHub. [Online]. Available: https://github.com/ntasfi/PyGame-Learning-Environment/commits/master/docs/user/home.rst. [Accessed: 13-Feb-2023].</li>
<li>Lupoglaz, “Godot AI Gym,” Godot Ai Gym. [Online]. Available: https://lupoglaz.github.io/GodotAIGym/index.html. [Accessed: 13-Feb-2023].</li>
<li>“Making AI in godot,” YouTube, 02-Feb-2021. [Online]. Available: https://www.youtube.com/watch?v=TMztBMRGrOQ&amp;t=434s. [Accessed: 13-Feb-2023].</li>
<li>“Mohsen Zare,” YouTube. [Online]. Available: https://www.youtube.com/@mohsenzare2511. [Accessed: 13-Feb-2023].</li>
<li>mohsenph69, “Mohsenph69/Godot-neural-networks: Provide a fast way to create neural networks for game AI in godotengine,” GitHub. [Online]. Available: https://github.com/mohsenph69/Godot-Neural-Networks. [Accessed: 13-Feb-2023].</li>
<li>Godotengine, “Godotengine/Godot-CPP: C++ Bindings for the godot script api,” GitHub. [Online]. Available: https://github.com/godotengine/godot-cpp#getting-started. [Accessed: 13-Feb-2023].</li>
<li>“Neural Network Creation in Godot - Tic Tac Toe #1,” YouTube, 17-Feb-2019. [Online]. Available: https://www.youtube.com/watch?v=hWP2_0u_BFM. [Accessed: 20-Feb-2023].</li>
<li>AndreaCatania, “Andreacatania/Godot at brain,” GitHub. [Online]. Available: https://github.com/AndreaCatania/godot/tree/brain. [Accessed: 20-Feb-2023].</li>
</ol>

<h2 id="Era2"><strong>Era 2: Developing the agents (practical)</strong></h2>

<h3 id="Era2Changes"><strong>Changes made</strong></h3>
<ul>
<li>Developed the individual agent classes for the project</li>
<li>Developed the agent neural network class</li>
<li>Developed the functionality to spawn in agents</li>
<li>Developed the functionality to kill agents</li>
</ul>

<h3 id="Era2Intro"><strong>Introduction to era</strong></h3>
The main goal of this era was to get the individual agents into the project and get them moving in the space. This meant I had to develop an agent class which I could instantiate multiple times to make the spawning and controlling of the agents easier. This class was a very important part of the project as the genetic algorithm had nothing to work off if there was no neural net. 

The agent class was also responsible for the movement of the agents. This would have to be controlled by a kinematic body however I wanted all the code to be in one GDscript file to make talking to the individual agents easier.

<h3 id="Era2Stage1"><strong>1: Creating the godot object</strong></h3>

All previous experience I had with game engines and dynamic creation of objects had come from unity and c#. I initially thought this meant I had to learn a whole new way of creating and instantiating objects. However after looking into it the methodology was very similar to unity. To create a instantiatable object in godot all I had to do was make a scene file and then use ```preload("Scene Name")``` to load the scene into a variable and then use ```instance()``` to create a new instance of that scene. This meant the learning curve of creating the agents was very small.

The other main area I had to focus on in the early development of this era was the actual game objects (Nodes in Godot) I was using to create these objects. Each agent would have to have a few key components to it. These components were a kinematic body, a collision shape, a sprite and a "brain area". All these nodes would be essential for running the object however as I stated earlier I wanted to keep all the code to one game object, the "brain area". This meant everytime I wanted to move the agent I would have to use ```get_parent()``` to get the kinematic body and then use that to move the agent. This was a bit of a pain but I was able to get it working.

Here is the layout for the agent scene file and also the sprite I used to represent the agents:

<img src="Resources/Agent Scene.png" alt="Agent Scene File">

And here is the initial code for the agent class, currently only set to move in random directions:

```
extends UniformBrainArea

var currentpos = Vector2(0,0)
var targetpos = Vector2(0,0)
var SPEED = 100
var vector
var rng = RandomNumberGenerator.new()
var startposition

# Called when the node enters the scene tree for the first time, currently does nothing.
func _ready():
	pass
	# print("Agent Instantiated")
	
# Moves agent to set start position to make it look nicer and train more effectively
func movetostartpos(x, y):
	print("Spawn pos: " + str(x) + "," + str(y))
	get_parent().set_position(Vector2(x, y))
	
# Gets the current position of the kinematic body and returns it
func getposition():
	currentpos = get_parent().get_position()

# Sets a target position for the agent to move towards
func updatetargetposition(x,y):
	targetpos = currentpos + Vector2(x, y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get random directions to move in
	rng.randomize()
	var movementx = rng.randf_range(-1000, 1000)
	var movementy = rng.randf_range(-1000, 1000)
	getposition()
	updatetargetposition(movementx, movementy)
	vector = (targetpos - currentpos).normalized()
	# Move the kinematic body towards the target
	get_parent().move_and_collide(vector * SPEED * delta)
```
One interesting element is the ```move_and_collide``` function. This function is used to move the kinematic body and also check for collisions. This is very useful as it means I can check for collisions automatically and not have to worry whether the agents are going to go off the screen or not.

<h3 id="Era2Stage2"><strong>2: Instantiating the objects in the main scene</strong></h3>
To dynamically create the agents I had to create an object which would instantiate them, to simplify code and keep it easy to access I created a "EnvController" object. This object would control all parts of the enviroment:
<ul>
<li>Spawning in the agents</li>
<li>Killing the agents</li>
<li>Spawning in the food</li>
<li>Spawning in the water</li>
<li>Spawning in walls to stop the agents from going off the screen</li>
</ul>

To spawn in the agents I used the following code:
```
var agentholder = preload("res://Prefabs/Agent.tscn")
var temp = agentholder.instance()
var agentbrain = temp.get_node("Brain")
agents.append(temp)
agentbrains.append(agentbrain)
self.add_child(temp)
```
This code is very simple and just loads the agent scene file, creates an instance of it and then adds it to the scene. The preload function is very helpful as it allows us to load the scene file once and instance it multiple times. This is very useful as it means we don't have to load the scene file every time we want to create an agent.

To make sure the agents are properly distributed over the environment I spawned them on a grid with reference to the size of the environment. This meant I could easily change the size of the environment and the agents would still be spawned in a nice grid. The code to declare the grid is as follows:
```	
# Map out a grid to spawn the agents into
var gridsize = sqrt(noAgents)
gridsize = round(gridsize) + 2
var step = Vector2(round((get_viewport_rect().size.x) / gridsize), round((get_viewport_rect().size.y) / gridsize))
```
Where noAgents is the number of agents to spawn in and the step variable declares the space between each agent. The code then moves each of the agents to their position on the grid:
```
# Set the start grid position
var spawnpos = Vector2(step.x, step.y) 
agentbrain.movetostartpos(spawnpos.x, spawnpos.y, i)
# Step to the next grid position in x
spawnpos.x = spawnpos.x + step.x 
# If the next grid position is off the screen move to the next row
if spawnpos.x > get_viewport_rect().size.x - step.x: 
	spawnpos.x = step.x
	spawnpos.y = spawnpos.y + step.y
```

Once this system was incorporated the spawned in agents looked like this on the grid:
<img src="Resources/AgentsOnGrid.png" alt="Agents Lined Up in a Grid">

And here is another photo proving that the grid system dynamically changes with the amount of agents spawned (60 vs 200):
<img src="Resources/200Agents.png" alt="Agents Lined Up in a Grid">

The full code for the spawning of the agents is here:
```
func spawnagents():
    # Map out a grid to spawn the agents into
	var gridsize = sqrt(noAgents)
	gridsize = round(gridsize) + 2
	var step = Vector2(round((get_viewport_rect().size.x) / gridsize), round((get_viewport_rect().size.y) / gridsize))
	
	# Spawn the agents
	var spawnpos = Vector2(step.x, step.y)
	# instances
	for i in range(noAgents):
		var temp = agentholder.instance()
		var agentbrain = temp.get_node("Brain")
		globals.agents.append(temp)
		globals.agentbrains.append(agentbrain)
		self.add_child(temp)
		agentbrain.movetostartpos(spawnpos.x, spawnpos.y, i)
		spawnpos.x = spawnpos.x + step.x
		if spawnpos.x > get_viewport_rect().size.x - step.x:
			spawnpos.x = step.x
			spawnpos.y = spawnpos.y + step.y
```

Finally for a bit of fun I got the agents to spawn in and move via Brownian motion. This means that the agents will move in a completely random direction which can change every time the system runs through the loop. Here's a gif of the agents moving in Brownian motion:
<img src="Resources/BrownianMotion.gif" alt="Agents Moving in Brownian Motion">

<h3 id="Era2Stage3"><strong>3: Spawning in food and water systems</strong></h3>

<h3 id="Era2Stage4"><strong>4: Implementing Infection systems and spawning infector</strong></h3>

<h3 id="Era2Stage5"><strong>5: Moving variable storage to globals</strong></h3>