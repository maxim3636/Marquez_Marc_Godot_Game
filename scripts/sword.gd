extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite = $AnimatedSprite2D
var original_rotation: float

func _ready():
	# Escuchar el input para activar la animación
	set_process_input(true)
	# Guardar la rotación original en radianes
	original_rotation = rotation

func _input(event):
	
	# Verificar si el input es la tecla de ataque
	if event.is_action_pressed("attack"):
		animation_player.play("hurt")
		# Reproducir la animación "swing"
		animated_sprite.play("swing")
		# Hacer que la espada rote hacia adelante
		rotation = deg_to_rad(70) if animated_sprite.flip_h else deg_to_rad(170)

func animation_finished():
	#animation_player.play("rest")
	# Restaurar la rotación original
	rotation = original_rotation

func _on_area_2d_area_entered(area):
		if area.is_in_group("enemy"):
		# Desactivar la escena
			area.queue_free()
