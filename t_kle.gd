# struct wo name == const t_kle = preload( "t_kle.gd")
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

func init( val, tex):
	vis = tex
	orig_land = val


