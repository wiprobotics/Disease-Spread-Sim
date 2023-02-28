extends Node2D

var agents = []
var agentbrains = []

var foodlocation
var waterlocation

var foodenabled = false
var waterenabled = false

var infectionenabled = true
var infectorenabled = true
var agentscanspread = true
var aggresiveinfection = true