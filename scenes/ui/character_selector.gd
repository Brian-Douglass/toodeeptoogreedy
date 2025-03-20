extends Control

const RUN_SCENE = preload("res://scenes/Run/run.tscn")
const MINER_STATS := preload("res://characters/Miner/warrior.tres")
const OCCULTIST_STATS := preload("res://characters/Occultist/occultist.tres")
const VAGABOND_STATS := preload("res://characters/Vagabond/vagabond.tres")

@export var run_startup: RunStartup

@onready var title: Label = %Title
@onready var description: Label = %Description
@onready var character_portrait: TextureRect = %CharacterPortrait



var current_character: CharacterStats : set = set_current_character

func _ready() -> void:
	set_current_character(MINER_STATS)


func set_current_character(new_character: CharacterStats) -> void:
	current_character = new_character
	title.text = current_character.character_name
	description.text = current_character.description
	character_portrait.texture = current_character.portrait

func _on_start_pressed() -> void:
	print("Start new run with %s" % current_character.character_name)
	run_startup.type = RunStartup.Type.NEW_RUN
	run_startup.picked_character = current_character
	get_tree().change_scene_to_packed(RUN_SCENE)

func _on_miner_button_pressed() -> void:
	current_character = MINER_STATS


func _on_occultist_button_pressed() -> void:
	current_character = OCCULTIST_STATS

func _on_vagabond_button_pressed() -> void:
	current_character = VAGABOND_STATS
