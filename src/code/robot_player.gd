extends Actor






func _physics_process(delta):
	
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		
		if collision.collider.get_class()=="KinematicBody2D":
			collision.collider.push(get_direction().x)
