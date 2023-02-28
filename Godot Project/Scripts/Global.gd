extends Node2D

var agents = []
var agentbrains = []
var randommovement = false
var numberofagents = 200

var foodlocation
var waterlocation

var foodenabled = false
var waterenabled = false

var infectionenabled = true
var infectorenabled = false
var agentscanspread = false
var aggresiveinfection = false