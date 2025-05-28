extends Node2D

var inimigo_prefab
var tempo = 0
var pontojogador = 0

func _ready():
	inimigo_prefab = preload("res://Prefabs/Inimigo.tscn")
	
	for i in range(5):
		var inimigo = inimigo_prefab.instantiate()
		get_node(".").add_child(inimigo)
		inimigo.position = $RefInimigo.position
		inimigo.position.x += i*100
		
	
func _physics_process(delta):
#Cronometro
	tempo += delta
	$Cronometro.text = str(int(tempo)) + "seg"
	
#Placar
	#if $SpriteInimigo.animation == "Explosão":
		#pontojogador += 1
	$Placar.text = str(pontojogador)
