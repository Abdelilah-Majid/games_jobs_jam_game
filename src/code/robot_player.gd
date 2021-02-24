extends Actor






func _physics_process(delta):
	
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		print()
		if collision.collider.get_collision_layer_bit(4)==true:
			collision.collider.push(get_direction().x)
