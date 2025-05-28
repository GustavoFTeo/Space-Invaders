extends CharacterBody2D

func _physics_process(delta):
	var força = 500
	var direcao = Vector2(0, -1)
	
	if get_slide_collision_count() > 0:
		var colisao = get_slide_collision(0)
		
		if colisao.get_collider().is_in_group("Inimigo"):
			queue_free()
			colisao.get_collider().hp_inimigo -= 1
			
			
			if colisao.get_collider().hp_inimigo == 0:
				get_tree().current_scene.pontojogador += 1
				
	velocity = força * direcao
	move_and_slide()
