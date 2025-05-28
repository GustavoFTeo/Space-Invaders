extends CharacterBody2D

var prefab_tiro
var hp_jogador
var tempo = 0
var ponto

func _ready():
	prefab_tiro = preload("res://Prefabs/tiro.tscn")
	hp_jogador = 5
	ponto = 0
	
func _physics_process(delta):

	
#Sumir depois de morrer
	if $SpriteJogador.animation == "Explosão" and not $SpriteJogador.is_playing():
		queue_free()
		
	var eixo = Input.get_axis("Jogador_esquerda", "Jogador_direita")
	var força = 300
	var direcao = Vector2(eixo, 0)

#Tiro
	if Input.is_action_pressed("Tiro") and $Timer.is_stopped():
		var tiro = prefab_tiro.instantiate()
		get_parent().add_child(tiro)
		tiro.position = position
		$Timer.start()
	
#Texturas e vida
	if hp_jogador == 5: $SpriteJogador.animation = "Jogador hp 5"
	if hp_jogador == 4: $SpriteJogador.animation = "Jogador hp 4"
	if hp_jogador == 3: $SpriteJogador.animation = "Jogador hp 3"
	if hp_jogador == 2: $SpriteJogador.animation = "Jogador hp 2"
	if hp_jogador == 1: $SpriteJogador.animation = "Jogador hp 1"
	if hp_jogador == 0: 
		direcao = Vector2(0,0)
		$SpriteJogador.animation = "Explosão"
		$"ColisãoJogador".disabled = true
	
	velocity = força * direcao
	move_and_slide()
