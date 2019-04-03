# struct wo name == const t_kle2 = preload( "t_kle2.gd")
extends Object # extends Node

# static typing == Godot vers 3.1

# Project: Project Settings: General : Debug: GDScript:
# set_off  warning UNUSED_VARIABLE
# set_off  warning UNUSED_CLASS_VARIABLE


var vis := 0 # тайл_текстура.
var vis_ext := 0 #

var orig_land := 0 # изначалка _border, _grass, _rock ...

var land := 0   # повтор изначалки, либо особые варианты.
var land_ext := 0 # слои.

var unit_mas_nom := 0 # на масив юнитов.
var unit_mas_uniq := 0 #

var dead_nom := 0  # трупак - линк на масив юнитов.
var dead_uniq := 0 #
# труп ставим на борт, если на его клетке погиб новый стак.

var b_dist = PoolByteArray() # 256 bytes
var b_dir2 = PoolByteArray() # 256 bytes

func clear_all( val: int = 0):
	vis = 0
	vis_ext = 0
	orig_land = val
	land = 0
	land_ext = 0
	unit_mas_nom = 0
	unit_mas_uniq = 0
	dead_nom = 0
	dead_uniq = 0

	if b_dist.size() < 256:
		b_dist.resize( 256)
	for i in range( 0, b_dist.size()):
		b_dist[ i] = 0

	if b_dir2.size() < 256:
		b_dir2.resize( 256)
	for i in range( 0, b_dir2.size()):
		b_dir2[ i] = 0


func init( val, tex):
	vis = tex
	orig_land = val



func set_from1( kle: int, dist0_16_to_kle: int, dir1_12_to_kle: int):
	if b_dist.size() < 256: return 0
	if kle < 0: return 0
	if kle >= b_dist.size(): return 0

	if dist0_16_to_kle < 1: return 0 # можно не ноль вернуть, но пока не нужно.

	if dist0_16_to_kle > 16: # 15
		dist0_16_to_kle = 16; # хотя можно и ноль вернуть

	# если не попали в константы - исправить нельзя..
	if dir1_12_to_kle < 1: return 0

	#if dir1_12_to_kle > HexKle_DirKlvFrom1: return 0
	if dir1_12_to_kle > 12: return 0


	b_dist[ kle] = dist0_16_to_kle
	b_dir2[ kle] = dir1_12_to_kle

	return 1



