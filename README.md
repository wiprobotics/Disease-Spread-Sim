<h1>Proposal</h1>

Propose time frame
> 8 weeks
> Gant chart - split up tasks (Can be BS)

<h2>Outline of artefact</h2>

Recent human events (The spread of Covid-19) have proven the effect the spread of a disease can have on:
<ul>
<li>The healthcare system [1]</li>
<li>Mental health [2]</li>
<li>The economy [3]</li>
<li>Globalisation [4]</li>
</ul>

This means it's important to come up with new ideas for keeping populations safe from disease. One way of doing this is to use mathematical models to simulate the spread of disease. This was done in the UK with the "Track and Trace" [5] system, which used mathematical models to predict the spread of the disease. This information was then used by the government to make an informed decision on actions to slow the spread of COVID-19.

The proposed system will use a "Deep Reinforcement Learning"(DRL) model to provide novel solutions and strategies for preventing the spread of infectious diseases. In the past DRL has proven its ability to develop emergent behaviour, one example of this is OpenAI's hide-and-seek project [7].

<img src="Resources/OpenAIHideSeek.png" alt="Open AI Hide-and-Seek" width="300" height="200">

<i> Fig 1 - OpenAI's hide-and-seek project </i>

In this project, Bowen et al. developed two agents tasked with playing the game hide-and-seek. These agents came up with many unique ideas (such as box surfing and using ramps) which Bowen did not programmatically incentivise. This system will aim to analyse emergent behaviour given the disease spread context. This would be done by simulating many different DRL agents who all want to avoid the disease for as long as possible while also keeping their other needs, for example; food and water met.

---

<h2>UML Diagram / System architecture</h2>

<img src="Resources/UML Diagram Updated.png" alt="UML diagram"> 

<i> Fig 2 - UML diagram for the proposed system </i>

This proposed system would use reinforcement learning which will be built using PyGame Learning Environment (PLE) [6], where the agents will be rewarded for surviving but punished for dying by any means e.g food, water or infection. This would allow the agents to build a neural net allowing them to learn how to avoid the disease. The use of PLE will also allow us to visualize the system to see how the agents are behaving.

The system will be trained in rounds lasting an amount of time set by the user. Each round will start with an infection starter pawn being put into the system. This pawn will not be advanced and will just pick a random direction and move in it and change direction every few seconds.

To accurately simulate real-life scenarios the disease will have an incubation time (r-value) which will be default set to 1.1 (between 1.0 and 1.2) as that is the r-value of Covid-19 [8] however this value can be changed by the user for other simulations. While the incubation time is active the infected will be able to infect others but will not be visibly infected. To also simulate real-life scenarios the agents will only be able to tell if someone is infected past the incubation time as it is common to be asymptomatic during the incubation period. Once an agent is infected it will continue its daily routine but will be able to infect others. The other parallel to real life is that the agents will have to consume food and water which they will have to collect from central points, this is designed to simulate the supermarkets and gathering points we have in real life.

There will be several variables in the system which will determine both agent actions and the spread of the disease. These inputs will be:
<ul>
<li> Variables to control disease spread (most can be enabled/disabled by the user):
<ul>
<li> Rest period (how long after getting the disease before you can spread it)</li>
<li> Incubation time (how long before you show symptoms)</li>
<li> Transmission distance (distance at which you're susceptible to infection)</li>
<li> Transmission rate (how long it takes to get the disease) </li>
</ul>
</li>
<li> Variables to control agent actions (most can be enabled/disabled by the user):
<ul>
<li> Speed (how fast the agent moves) </li>
<li> Is there another agent in the vision range </li>
<li> The direction of the agent in vision range </li>
<li> The distance to the agent in vision range </li>
<li> Is the agent in vision visibly infected </li>
<li> Location of food supply </li>
<li> Location of water supply </li>
<li> How many infected people there are </li>
<li> Current agent position </li>
<li> Current agent hunger </li>
<li> Current agent thirst </li>
</ul>
</li>
</ul>

There is currently only one action the agents can take which will be:
<ul>
<li> Move in a direction (x, y) </li>
</ul>

<h2>Gantt Chart</h2>

<img src="Resources/Gantt Chart.png" alt="Gantt chart diagram"> 

<i> Fig 3 - Gantt chart diagram for developing proposed system </i>

<h2>Citations</h2>

<ol>
<li> Mehlmann-Wicks, J. (2022) Covid-19: Impact of the pandemic on healthcare delivery, The British Medical Association is the trade union and professional body for doctors in the UK. British Medical Association. Available at: https://www.bma.org.uk/advice-and-support/covid-19/what-the-bma-is-doing/covid-19-impact-of-the-pandemic-on-healthcare-delivery (Accessed: February 2, 2023). </li>
<li> Daly, M., Sutin, A. and Robinson, E. (2020) “Longitudinal changes in mental health and the COVID-19 pandemic: Evidence from the UK household longitudinal study.” Available at: https://doi.org/10.31234/osf.io/qd5z7. </li>
<li> Lombardelli, C. (2022) Covid and the UK economy - speech by Clare Lombardelli, chief economic advisor, HM Treasury, GOV.UK. Available at: https://www.gov.uk/government/speeches/covid-and-the-uk-economy-speech-by-clare-lombardelli-chief-economic-advisor-hm-treasury (Accessed: February 2, 2023). </li>
<li> Shrestha, N. et al. (2020) “The impact of covid-19 on Globalization,” One Health, 11, p. 100180. Available at: https://doi.org/10.1016/j.onehlt.2020.100180. </li>
<li> He, B. et al. (2021) “Effectiveness and resource requirements of test, Trace and isolate strategies for Covid in the UK,” Royal Society Open Science, 8(3). Available at: https://doi.org/10.1098/rsos.201491. </li>
<li> PLE: A reinforcement learning environment¶ (2016) PLE: A Reinforcement Learning Environment - PyGame Learning Environment 0.1.dev1 documentation. Available at: https://pygame-learning-environment.readthedocs.io/en/latest/ (Accessed: February 2, 2023). </li>
<li>Baker, B., Kanitscheider, I., Markov, T., Wu, Y., Powell, G., McGrew, B. and Mordatch, I., 2019. Emergent tool use from multi-agent autocurricula. arXiv preprint arXiv:1909.07528.</li>
<li> UK Health Security Agency (2020) The R value and growth rate, GOV.UK. Available at: https://www.gov.uk/guidance/the-r-value-and-growth-rate (Accessed: February 3, 2023).</li>
</ol>