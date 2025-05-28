extends CharacterBody2D

var forca = 350
var direcao 
var hp_inimigo
var prefab_tiro 
	
func _ready():
	forca = 350
	direcao = Vector2(1, 0)
	hp_inimigo = 5
	prefab_tiro = preload("res://Prefabs/tiro_inimigo.tscn")
	
func _physics_process(delta):
	if $SpriteInimigo.animation == "Explosão" and not $SpriteInimigo.is_playing():
		queue_free()
	
	if get_slide_collision_count() > 0:
		var colisao = get_slide_collision(0)
		direcao = direcao.bounce(colisao.get_normal())
		#Verificar se o inimigo colidiu com o tiro
	
	#Tiro do Inimigo
	if $Timer.is_stopped():
		var tiro = prefab_tiro.instantiate()
		get_parent().add_child(tiro)
		tiro.position = position
		$Timer.start()
		
	#Vida
	if hp_inimigo == 5: $SpriteInimigo.animation = "Inimigo hp5"
	if hp_inimigo == 4: $SpriteInimigo.animation = "Inimigo hp4"
	if hp_inimigo == 3: $SpriteInimigo.animation = "Inimigo hp3"
	if hp_inimigo == 2: $SpriteInimigo.animation = "Inimigo hp2"
	if hp_inimigo == 1: $SpriteInimigo.animation = "Inimigo hp1"
	if hp_inimigo == 0: 
		direcao = Vector2(0,0)
		$SpriteInimigo.animation = "Explosão"
		$"ColisãoInimigo".disabled = true
	
	
	velocity = forca * direcao
	move_and_slide()
