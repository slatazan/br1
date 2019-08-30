# struct wo name == const t_kle = preload( "t_kle.gd")
extends Object # extends Node
# version 102


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
#---------


func clear_links():
	unit_mas_nom = 0
	unit_mas_uniq = 0
	dead_nom = 0
	dead_uniq = 0
#---------


func init( val, tex):
	vis = tex
	orig_land = val
#---------


# INT store_32 --> get_32 UINT // ERROR
# INT store_64 --> get_64 INT // OK

func save_to( r): # file rec
	r.store_64( vis)
	r.store_64( vis_ext)
	r.store_64( orig_land)
	r.store_64( land)
	r.store_64( land_ext)
	r.store_64( unit_mas_nom)
	r.store_64( unit_mas_uniq)
	r.store_64( dead_nom)
	r.store_64( dead_uniq)
#---------


func load_from( r):
	vis = r.get_64()
	vis_ext = r.get_64()
	orig_land = r.get_64()
	land = r.get_64()
	land_ext = r.get_64()
	unit_mas_nom = r.get_64()
	unit_mas_uniq = r.get_64()
	dead_nom = r.get_64()
	dead_uniq = r.get_64()
#---------


