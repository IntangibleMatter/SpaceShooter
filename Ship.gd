extends Area2D

const Laser = preload("res://Laser.tscn")

const ExplosionEffect = preload("res://ExplosionEffect.tscn")
export(int) var SPEED = 100

var doneyet = false 
var timer = 0

func _process(delta):
	#Movement
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
		
	#Limit player boundaries
	if position.y > 175:
		position.y -= SPEED * delta
	if position.y < 5:
		position.y += SPEED * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		fire_laser()


func fire_laser():
	var laser = Laser.instance()
	var main = get_tree().current_scene
	main.add_child(laser)
	laser.global_position = global_position
	laser.global_position.x += 8



func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var explosionEffect = ExplosionEffect.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position

