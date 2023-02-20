<h1><strong>Dev diary for the production of my COMP250 artefact</strong></h1>

<h2><strong>Introduction</strong></h2>

This is a diary of my development process for my COMP250 artefact. I will be using this diary to keep track of my progress and to reflect on my development process. This diary will be split into eras, each of which will be a separate section. The eras will be split by major changes in the creation of the project, such as the addition of a new feature or the completion of a major milestone.

For each era, I will include a description of the changes made, a reflection on the development process, and a list of the changes made. I will also include a list of the changes made in each era in the table of contents. To also keep the citations section short all citations will be done in the era they are mentioned; this does mean that some citations may be repeated.

My artefact will be a multi agent system which will be used to simulate and prevent the spread of disease through a population. The system will be comprised of two components a neural network and a genetic algorithm. To make my life easier and to prevent over scoping I intend to not build my own neural network and instead intend to use a prebuilt library. My main contribution will be the devlopment of the genetic algorithm.

<h2><strong>Table of contents</strong></h2>
<ol>
<li><a href="#Era1">Era1</a></li>
    <ol>
    <li><a href="#Era1Changes">Changes</a></li>
    <li><a href="#Era1Intro">Introduction</a></li>
    <li><a href="#Era1Stage1">PyGame Learning Environment</a></li>
    <li><a href="#Era1Stage2">Lupoglaz Godot AI Gym</a></li>
    <li><a href="#Era1Stage3">NAD LABS youtube video</a></li>
    <li><a href="#Era1Stage4">Mohsen Zare GDNative neural net library</a></li>
    <li><a href="#Era1Stage5">Andrea Catania's custom Godot Distribution</a></li>
    </ol>
</ol>

<h2 id="Era1"><strong>Era 1: Deciding which AI to use (Research)</strong></h2>

<h3 id="Era1Changes"><strong>Changes made</strong></h3>
<ul>
<li>Decided which AI to use for the project</li>
</ul>

<h3 id="Era1Intro"><strong>Introduction to era</strong></h3>
<div>
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

While looking at Mohsen Zare's video a different video by Andrea Catania [8] popped up. This video was about making a neural network to play tic tac toe however Andrea talked about how he had made a custom Godot distribution which made it way easier to use than installing my own custom modules. This was really interesting as I had been trying to install my own custom modules for the past few days and had not been able to get it to work. I managed to get the install done almost instantly and was able start looking into how to use it very quickly.

The custom distribution included a module named "brain" which was a neural network library containing a node called "brain area" allowing for the easy implementation of neural networks.

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
