extends KinematicBody2D

signal died

var minDashSpeed = 100
var maxDashSpeed = 400
var GRAVITY = 25000
var velocity = Vector2.ZERO
var maxHorizontalSpeed = 140
var isStateNew = true
var spring = 200
#copy the processes from tutorial. This just isn't fun.

func _process(delta):
	if !$Timer.is_stopped():
		$DashParticle.emitting = true
	else:
		$DashParticle.emitting = false
	if Input.is_action_pressed("reset"):
		emit_signal("died")
	#todo: gravity while in air is different than gravity whilst in a "combo"
	if (!$boostTimer.is_stopped()):
		velocity.y = -1000
	else:
		velocity.y = 0
	
	#if ($boostTimer.is_stopped()):
	#	GRAVITY = 25000
	if Input.is_action_just_pressed("right"):
		
		$Timer.start()
		velocity = Vector2(maxDashSpeed, 0)
	elif Input.is_action_just_pressed("left"):
		
		$Timer.start()
		velocity.y = 0
		velocity = Vector2(-maxDashSpeed, 0)
	if $Timer.is_stopped():
		velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(0, velocity.x, pow(2,-7 * delta))
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$HazardArea.connect("area_entered", self, "on_hazard_area_entered")
	$gravityArea.connect("area_entered", self, "on_gravity_area_entered")
	$Boost.connect("area_entered", self, "on_boost_area_entered")
	
func on_hazard_area_entered(area2d):
	emit_signal("died")

func on_gravity_area_entered(area2d):
	GRAVITY *= -1
	$AnimatedSprite.flip_v = true if $AnimatedSprite.flip_v == false else false

func on_boost_area_entered(area2d):
	$boostTimer.start()
	#GRAVITY = -30000
