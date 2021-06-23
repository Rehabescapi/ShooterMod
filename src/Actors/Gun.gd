class_name Gun
extends Position2D
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.


const BULLET_VELOCITY = 500.0
const SHOTGUN_VELOCITY = 400.0
const CANNON_VELOCITY = 200.0
const Bullet = preload("res://src/Objects/Bullet.tscn")


###
const Cannon = preload("res://src/Objects/Cannon.tscn")

###

onready var sound_shoot = $Shoot
onready var timer = $Cooldown




# This method is only called by Player.gd.
func shoot(direction = 1):
	if not timer.is_stopped():
		return false
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2( direction * BULLET_VELOCITY, 0)

	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	return true

func shotgunshoot(direction = 1):
	print("Shotgun")
	if not timer.is_stopped():
		return false
	var bullet = Bullet.instance()
	var bullet2 = Bullet.instance()
	var bullet3 = Bullet.instance()
	bullet2.global_position = global_position;
	bullet2.linear_velocity = Vector2( direction * SHOTGUN_VELOCITY, -100)
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * SHOTGUN_VELOCITY, 0)

	bullet3.global_position = global_position;
	bullet3.linear_velocity = Vector2( direction * SHOTGUN_VELOCITY, -150)


	bullet.set_as_toplevel(true)
	add_child(bullet)
	bullet2.set_as_toplevel(true)
	add_child(bullet2)

	bullet3.set_as_toplevel(true)
	add_child(bullet3)
	sound_shoot.play()
	return true


func cannonshoot(direction = 1):
	print("Cannon")
	if not timer.is_stopped():
		return false
	var bullet = Cannon.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2( direction * CANNON_VELOCITY, -500)

	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	return true