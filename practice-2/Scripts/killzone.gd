extends Area2D
@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("you died") # Replace with function body.
	timer.start()



func _on_timer_timeout() -> void:
	get_tree().reload_current_scene() # Replace with function body.
