# this godot_file is part of the archive: tet_fgr_and_swap.zip
extends Control # Node
# project window 1024 x 768


# game like lines-klon


# --- набор кубиков (отдельные текстуры)..
var tex_kub1_red = preload( "res://k-red.tga")
var tex_kub2_green = preload("res://k-green.tga")
var tex_kub3_blue = preload("res://k-blue.tga")
var tex_kub4_vit = preload("res://k-yell.tga")
var tex_kub5_exp = preload("res://k-purp.tga")
var tex_kub6_ba1 = preload("res://k-mix.tga")
var tex_kub7_ba2 = preload("res://k-silver.tga")

var tex_border = preload("res://brick_gray_3.png")
var tex_empty_tile = preload("res://tutorial_pad.png")


# ---
const KUB_254_EMPTY = 254  # -2 # int as byte as char -2 // пусто.
const KUB_255_BORDER = 255 # -1 // борт.
const KUB_ZERO = 0 # same as KUB_254_EMPTY

const KUB_RED = 1 # красный кубик.
const KUB_GREEN = 2
const KUB_BLUE = 3
const KUB_VIT = 4 # нечто мана-энэргия-стамина.
const KUB_EXP = 5 # нечто экспа-опыт-тренинг.
const KUB_BA1 = 6 # нечто мячик-1
const KUB_BA2 = 7 # нечто мячик-2

const  KUB_TYPE_FIRST = KUB_RED # вот первый типаж _кубика.
const  KUB_TYPE_LAST = KUB_BA2
	# Допустим, KUB_RED будет номером кубик-типажа,
	# который подразумеваем красного цвета KUB_S1.
	# Тоесть, буду хранить в тайлах _кубики, и смотреть
	# в процу по дознованию _какого_цвета_кубик.

const KUB_S1 = KUB_RED # sbor == color
const KUB_S2 = KUB_GREEN
const KUB_S3 = KUB_BLUE
const KUB_S4 = KUB_VIT
const KUB_S5 = KUB_EXP
const KUB_S6 = KUB_BA1 # same KUB_BA2
const KUB_S_LAST = KUB_S6


# ---
# fb == foot ball

var targ_swap_q = 0 # считаем обмен двух кубиков для авто-пробы.
var targ_swap_q_player = 0 # считаем ходы игрока.

var hand_klik_tile1 = 0
var hand_klik_tile2 = 0


var fb_test_klik1 = 0
var fb_test_klik2 = 0

var fb_test_auto1 = 0 # под перебор свапов
var fb_test_auto2 = 0


var flag_vis_buf = 1
var test_view_sbor = 1

var result_red = 0
var result_gr = 0
var result_bl = 0
var result_vit = 0
var result_exp = 0
var result_ball = 0

var call_update__q = 0



# ---

var fb_pole_init = 0 # галочка о том, что не было иницы игровых досок.


var fb_pole_tile_w = 48
#var fb_pole_tile_h = 48

const  fb_pole_tiles_w = 7 + 2 # шырь плюс два борта.
const  fb_pole_tiles_h = 7 + 2 #8 + 2

const  fb_buf_top_tiles_w = fb_pole_tiles_w
const  fb_buf_top_tiles_h = 3 + 2 # обязательные борта.


var fb_pole_pos_x = 64
#var fb_pole_pos_z = fb_pole_tile_w * (fb_buf_top_tiles_h - 1)
var fb_pole_pos_z = fb_pole_tile_w * fb_buf_top_tiles_h

var fb_pole_pos_x2 = fb_pole_tile_w * fb_pole_tiles_w + fb_pole_pos_x
	# Если здесь ноль, то дополнительное поле не рисуют.



const t_board1 = preload( "res://t_board1.gd")


var fb_buf_top = null # t_board1
	# Это мини-поле - отдельный буфер (над основным полем).
	# Храним здесь кубики, и копируем их, по-одному.
	# Пусть борта здесь будут как у норм-поля, чтобы хикс-офсет
	# не менять - индэксы бортов никогда не копируем.

var fb_pole1 = null # t_board1
	# основное поле с кубиками-мячиками (цвет узнаём из кубика).

var fb_pole2 = null # t_board1
	# поле для разборок _собираемого на fb_pole1.
	# Важно - собираем цвета, а не кубик-типажы = здесь цвето-индексы.

var fb_pole3 = null # t_board1
	# не-обязательные накладки интэр-актива (паутина).
	# Но пока, использовать для тэст-отрисовки.


var pLabel = null
var pLabel2 = null
var p_targ_swap = null

var k3int = [ 0, 0, 0] # сюда получать несколько значений из функции.




# new_node( self, Label.new())
func new_node( parent_for_call_new, call_new):
	if call_new :
		parent_for_call_new.add_child( call_new)
		return call_new
	return null
#---------




func _ready():
	randomize()

	#pLabel = Label.new()
	#self.add_child( pLabel) 
	# OR
	pLabel = new_node( self, Label.new())
	#pLabel.text = "1"

	pLabel2 = new_node( self, Label.new())
	pLabel2.rect_position.y += 20


	p_targ_swap = new_node( self, Timer.new())
	p_targ_swap.start( 5.0) # or 3.0
	p_targ_swap.set_one_shot( true)

	# ---
	self.connect( "gui_input", self, "_on__gui_input")


	# ---
	fb_buf_top = t_board1.new() # это не нода, а часть скрипта.
	fb_pole1 = t_board1.new()
	fb_pole2 = t_board1.new()
	fb_pole3 = t_board1.new()

#---------




func init_game():
	# add Button --> call this func from Button

	fb_pole_init = 0

	p_targ_swap.start()
	targ_swap_q = 0
	targ_swap_q_player = 0
	hand_klik_tile1 = 0
	hand_klik_tile2 = 0
	fb_test_klik1 = 0
	fb_test_klik2 = 0
	fb_test_auto1 = 0
	fb_test_auto2 = 0

	result_red = 0
	result_gr = 0
	result_bl = 0
	result_vit = 0
	result_exp = 0
	result_ball = 0

#---------




func fb_kub__tex( i):

	if i == KUB_255_BORDER:
		return tex_border
	elif i == KUB_254_EMPTY:
		return tex_empty_tile
	
	elif i == KUB_RED:
		return tex_kub1_red
	elif i == KUB_GREEN:
		return tex_kub2_green
	elif i == KUB_BLUE:
		return tex_kub3_blue
	elif i == KUB_VIT:
		return tex_kub4_vit
	elif i == KUB_EXP:
		return tex_kub5_exp
	elif i == KUB_BA1:
		return tex_kub6_ba1
	elif i == KUB_BA2:
		return tex_kub7_ba2

	return tex_empty_tile
#---------


func fb_kub__clr_ind( i) -> int:

	if i == KUB_RED:
		return KUB_S1
	elif i == KUB_GREEN:
		return KUB_S2
	elif i == KUB_BLUE:
		return KUB_S3
	elif i == KUB_VIT:
		return KUB_S4
	elif i == KUB_EXP:
		return KUB_S5

	elif i == KUB_BA1:
		return KUB_S6 # !!
	elif i == KUB_BA2:
		return KUB_S6 # !!

	return 0
#---------




func fb_kub__3_types_max_from_clr( i3, clr: int) -> int:

	if clr < KUB_S1  ||  clr > KUB_S_LAST :
		return 0
	for x in range( 0, i3.size()):
		i3[ x] = 0 #clear

	var re = 0
	for i in range( KUB_TYPE_FIRST, KUB_TYPE_LAST +1):
	#{
		if fb_kub__clr_ind( i) == clr :
			i3[ re] = i
			re += 1 # zero ofset --> now first element
			if re == 3 : # 3 элемента, максимум.
				return 3
			# пока везде будет единица, кроме clr == KUB_S6,
			# где два кубика несут один цвет.
			# Но для универсальности, треба смотреть все варианты.
	#}
	return re
#---------







func fb_pole__init( pole, w: int, h: int): # t_board1& pole

	pole.recreate( w, h)

	pole.set_all( KUB_254_EMPTY) # не ноль

	var b = KUB_255_BORDER
	pole.set_column( 1, 1, b) # левый борт.
	pole.set_column( w, 1, b) # w == pole.tiles_w()

	pole.set_line( 1, 1, b) # верх.
	pole.set_line( 1, h, b) # низ.
#---------




func priv_fb_pole__random_near( pole, mid: int, # t_board1& pole
rand_min: int, rand_max: int, rand_ext: int) -> int: # return char

	var n = mid + 1 # прибавим
	if n > rand_max :
		n = mid -1 # если центр попался с макси-индэксом.

	if n < rand_min :
		n = rand_ext
		#print( "err: rand_min rand_max: малый диапазон")

	return n
#---------


func g2_random( mini: int = 1, maxi: int = 6):
    return ( randi() % (maxi - mini + 1) ) + mini
#---------


func priv_fb_pole__random1( pole, rand_min: int, rand_max: int):
	# наполнить случийными индексами ..
	for i in range( 0, pole.tiles_q()):
	#{
		# pole  подразумевает обязательное наличие борта,
		# который не надо портить.
		if pole.tile_get( i)  !=  KUB_255_BORDER : # Если клетка не бортовая, то
			pole.tile_set( i, g2_random( rand_min, rand_max)) # меняем клетку.
	#}
#---------




func priv_fb_pole__random_filter1( pole,
rand_min: int, rand_max: int, rand_ext: int):

	# фильтруем условные индексы (числа, а не номера типажэй).
	# А после этой процы, можно заменить числа на что-то логичное.

	# Первая строка == борт, последния строка == борт.
	# --- со 2-й строки до пред-последней - фильтр-поправки ..

	for r in range( 2, pole.tiles_h()): # y
	#{
		for i in range( 2, pole.tiles_w()):
		#{
			# Наша проверка задевает борт-индексы ( например, r - 1),
			# но не должна реагировать на них.
			#
			# Можно поджать накрут, но допустим, что фильтры rand_filter
			# могут быть разными пресетами, и задевать всё поле.

			var mid = pole.tile2( i, r) # центральная клетка фильтра.
			var top = pole.tile2( i, r -1) # верхний сосед.
			var niz = pole.tile2( i, r +1)
			var lft = pole.tile2( i -1, r)
			var rit = pole.tile2( i +1, r)

			if mid == lft  &&  lft == rit :
			#{
				if top == rand_ext :
					# опасно - можно создать вертикаль rand_ext.
					# Поэтому, попытка проверить соседей,
					# и оформить иной индэкс
					if niz != mid :
						# если нижний не такой, как средний,
						# то поставим его, как разделитель горизонтали.
						pole.tile2_( i, r, niz)

					else:
						# оказалось, что три соседа равны центру,
						# и здесь нужны rand_min .. rand_max
						pole.tile2_( i, r,
						priv_fb_pole__random_near( pole, mid,
						rand_min, rand_max, rand_ext)  )

				else:
					pole.tile2_( i, r, rand_ext) # сменить центр

				continue
			#}


			if mid == top  &&  top == niz :
			#{
				#pole.tile2_( i, r, rand_ext) # сменить центр
				#continue
				# OR

				if lft == rand_ext :
					if rit != mid :
						pole.tile2_( i, r, rit)
					else:
						pole.tile2_( i, r,
						priv_fb_pole__random_near( pole, mid,
						rand_min, rand_max, rand_ext)  )

				else:
					pole.tile2_( i, r, rand_ext) # сменить центр

				continue
			#}
		#}
	#}
#---------




func fb_pole__random( pole,
rand_min: int, rand_max: int, rand_ext: int = 0, rand_filter: int = 0):

	if rand_min >= rand_max :
		#print( "err: rand_min rand_max: малый диапазон")
		return

	priv_fb_pole__random1( pole, rand_min, rand_max)

	if rand_ext : # if( rand_ext  &&  rand_filter == 1 )
		priv_fb_pole__random_filter1( pole, rand_min, rand_max, rand_ext)

	# elif rand_ext  &&  rand_filter == 2 : pass


	# ---
	# Допустим, что здесь надо конвертнуть чистые числа в
	# индексы типажэй кубиков, которые могут предоставлять цвета,
	# которые накидали в pole ...
	# Для этого, надо посмотреть все тайлы, и по каждому, находить все кубики,
	# которые могут выдавать цвет,
	# и если такой кубик лиш один, то печатать его индекс, вместо цвета.
	# А если типажэй два, то можно выбрать случийно, либо всегда
	# ставить _наименьшый_первый номерок, среди одно-цветных типажэй.

	for i in range( 0, pole.tiles_q()):
	#{
		var clr = pole.tile_get( i)

		#if clr == rand_ext  ||  (clr >= rand_min  &&  clr <= rand_max) :
		# OR
		var flag = 0
		if clr == rand_ext:
			flag = 1
		elif clr >= rand_min  &&  clr <= rand_max :
			flag = 1
		if flag:
		#{
			var klv = fb_kub__3_types_max_from_clr( k3int, clr)
			if klv > 1 :
				if klv > 3 :
					klv = 3
				flag = g2_random( 1, klv) - 1 # (1,2) == 0 or 1
				pole.tile_set( i, k3int[ flag])

			elif klv == 1 :
				pole.tile_set( i, k3int[ 0])

			#// else ERR // не можт быть
		#}
	#}
#---------




# ? scan cros ?
func fb_pole__skan_krest3( pole, skan_res, # t_board1& skan_res
skan_min: int, skan_max: int, just_ghost: int = 0) -> int: # -> bool:
# bool just_ghost

	if pole.tiles_w() != skan_res.tiles_w() :
		return 0
	if pole.tiles_h() != skan_res.tiles_h() :
		return 0

	#skan_res.set_all( KUB_254_EMPTY) # стираем борт, но это не важно.
	# Можно здесь вызвать процу, чтобы создать борт заново.
	# Либо сделать версию процедуры..
	skan_res.set_all_( KUB_254_EMPTY, KUB_255_BORDER) # кроме значений бортов.

	var re = 0 # result

	# --- со 2-й строки до пред-последней ..

	for r in range( 2, pole.tiles_h()):
	#{
		for i in range( 2, pole.tiles_w()):
		#{
			var mid_kub = pole.tile2( i, r)
			var mid = fb_kub__clr_ind( mid_kub)

			if mid < skan_min  ||  mid > skan_max :
				# сканим цвета, но этот цвет выбивается из указаний.
				continue

			var top = fb_kub__clr_ind( pole.tile2( i, r -1) )
			var niz = fb_kub__clr_ind( pole.tile2( i, r +1) )
			var lft = fb_kub__clr_ind( pole.tile2( i -1, r) )
			var rit = fb_kub__clr_ind( pole.tile2( i +1, r) )

			if mid == lft  &&  lft == rit : # сошлась тройка цветов
			#{
				# впечатываем все три
				#skan_res.tile2_( i -1, r, mid)
				#skan_res.tile2_( i   , r, mid)
				#skan_res.tile2_( i +1, r, mid)
				# OR
				re = 1
				if just_ghost :
					return re

				skan_res.set_line( i -1, r, mid, 3)
			#}

			if mid == top  &&  top == niz : # сошлось по вертикали
			#{
				re = 1
				if just_ghost :
					return re

				skan_res.tile2_( i, r -1, mid)
				skan_res.tile2_( i, r   , mid)
				skan_res.tile2_( i, r +1, mid)
			#}

		#}
	#}

	return re
#---------




#func fb_pole__skan_cost( int* clr_cost, t_board1& skan,
func fb_pole__skan_cost( clr_cost_m, skan,
skan_min: int, skan_max: int) -> int:

	var max_res = 0

	#if ! clr_cost :
	#	return max_res

	# Поле skan содержыт лиш те плитки, которые признаны готовым результатом.

	# --- (k i r)
	for k in range( skan_min, skan_max +1):
	#{
		var max_line = 0 # |
		var line = 0 # |

		for i in range( 2, skan.tiles_w()):
		#{
			for r in range( 2, skan.tiles_h()):
			#{
				if skan.tile2( i, r) == k :
					line += 1 # вертикальная линия.

				elif max_line < line :
					# прервалось, но оказалось что накопили.
					max_line = line
					line = 0
					if max_res < max_line :
						max_res = max_line
					#endif
				else:
					line = 0
			#}
		#}

		if max_line > 4 : # 5+
			clr_cost_m[ k - skan_min] = 3
			#clr_cost_m[ 1 - 1] = 3 # для красного цвета.

		elif max_line > 3 : # 4
			clr_cost_m[ k - skan_min] = 2

		elif max_line > 2 : # std 3
			clr_cost_m[ k - skan_min] = 1
		#else остался ноль.
	#}


	# --- (k r i) // почти копия, но для горизонтальных линий..
	for k in range( skan_min, skan_max +1):
	#{
		var max_line = 0 # --
		var line = 0  # --

		for r in range( 2, skan.tiles_h()):
		#{
			for i in range( 2, skan.tiles_w()):
			#{
				if skan.tile2( i, r) == k :
					line += 1

				elif max_line < line :
					# прервалось, но оказалось что накопили.
					max_line = line
					line = 0
					if max_res < max_line :
						max_res = max_line
					#
				else:
					line = 0
			#}
		#}

		if max_line > 4 :
			clr_cost_m[ k - skan_min] = 3

		elif max_line > 3 :
			clr_cost_m[ k - skan_min] = 2

		elif max_line > 2 :
			clr_cost_m[ k - skan_min] = 1
	#}
	return max_res
#---------







func trig_to_board( pole, x: int, y: int):
	var t = pole.tile2( x, y)
	if t == KUB_254_EMPTY || t == KUB_255_BORDER || t == 0:
		return # это пустышка

	# Можно найти кейс для t,
	# Если это кейс Болотный, то t = 0; pole.tile2_( x, y, t)
	# и повторить обноление для четырех соседей тайла.
	#
	# Если это нечто слоёное, то отнять один слой..
	t -= 1 # убрать слой (льда)
	pole.tile2_( x, y, t)

#---------




# t_board1& pole, t_board1& skan, t_board1& top,
func fb_pole__kill_add2( pole, skan, top,
rand_kub_min: int, rand_kub_max: int):

	if skan.tiles_h() <= 4 :
		#print( "err")
		return

	var first_row = 2
	var t = 0
	for i in range( 2, skan.tiles_w()):
	#{
		for r in range( first_row, skan.tiles_h()):
		#{
			t = skan.tile2( i, r) # сэмплируем образец из доски результата.
			if t == KUB_254_EMPTY || t == KUB_255_BORDER || t < KUB_S1:
				continue # это пустышка - мотаем дальшэ.

			#trig_to_board( fb_pole3, i, r)
			# Убрать слой льда, или убрать паутинку у тайла, и его соседей.

			pole.tile2_( i, r, KUB_254_EMPTY) # затираем в игровом поле.
			# Не важно, что сдвиг можт менять эту пустышку на кубик.
		#}


		# снизу-наверх - встречаем дырку - сдвигаем вниз, строим кубик наверху.
		for r in range( first_row, skan.tiles_h()):
		#for r in range( skan.tiles_h() -1, 1, -1):
		#{
			t = pole.tile2( i, r) # ячейка игрового поля.
			if t == KUB_254_EMPTY : # ноли пусть будут _нормой_от_сдвига.
				# это пустышка - работаем по её задвиганию.

				if r > first_row : # надо сдвинуть на один тайл вниз..
					pole.slide_column( i, first_row, 1, r - first_row)
					# сдвиг ставит Ноли в тайлы, которые стали пустыми после сдвига.

				# пробуем поставить новый кубик..
				#pole.tile2_( i, first_row, g2.random( rand_kub_min, rand_kub_max))
			# OR
				for k in range( top.tiles_h(), 1, -1):
					t = top.tile2( i, k)
					if t == KUB_254_EMPTY || t == KUB_255_BORDER || t < KUB_S1:
						t = KUB_254_EMPTY # чтобы осталось после накрута.
						continue # это пустышка - мотаем дальшэ.
					#top.tile2_( i, k, KUB_254_EMPTY)
					top.slide_column( i, 2, 1, k - 2)
					pole.tile2_( i, first_row, t)
					break

				if t == KUB_254_EMPTY : # не нашли кубика в буфере.
					pole.tile2_( i, first_row, g2_random( rand_kub_min, rand_kub_max))
		#}
	#}
	# здесь могли сойтись новые линии - надо после этой процы проверку вызывать.

#---------







func fb_pole__skan_base( pole, skan_res,
skan_min: int, skan_max: int, k1: int, k2: int) -> int:  # bool

	if skan_min >= skan_max :
		return 0 # err

	k1 -= 1
	k2 -= 1
	var t1 = pole.tile_get( k1)
	var t2 = pole.tile_get( k2)

	if t1 == 0  ||  t2 == 0 :
		return 0 # err

	var fla1 = 0
	var fla2 = 0
	if t1 == KUB_254_EMPTY || t1 == KUB_255_BORDER:
		fla1 = 1
	if t2 == KUB_254_EMPTY || t2 == KUB_255_BORDER:
		fla2 = 1
	if fla1  &&  fla2 :
		fb_test_klik1 = -fb_test_klik1 # для наглядности.
		fb_test_klik2 = -fb_test_klik2
		return 0 # оба клика по полю, но по не-цветным тайлам.


	pole.tile_set( k1, t2) # обменяли, аля PUSH_begin
	pole.tile_set( k2, t1)


	var skan_loop = 0
	var skan_break = 0

	# вероятно, этот цикл надо выделить в отдельную процу..
	while ! skan_break:
	#{
		skan_loop += 1

		#if test_view_sbor  &&  skan_loop == 2 : # для наглядности
		#	break # while

		if ! fb_pole__skan_krest3( pole, skan_res, skan_min, skan_max) :
			if skan_loop == 1 :
				pole.tile_set( k1, t1) # вернули обмен, аля POP, если сбора не было
				pole.tile_set( k2, t2)
				return 0
			skan_break = 1

		else: # из-за этого разделителя, skan_loop накручивает лишнего.

			# норма..
			# Кубики, которых меняли - исчезли, и POP не нужно делать.

			# ---
			#int clr_cost[ skan_max - skan_min +1] = {0}; // ячейки с ноля.
			#int clr_cost[ 100] = {0}; // ячейки с ноля.
			var clr_cost = []
			clr_cost.resize( 100)
			for i in range( 0, clr_cost.size()):
				clr_cost[ i] = 0


			var max_line = fb_pole__skan_cost( clr_cost, skan_res,
			skan_min, skan_max)
			# ячейки clr_cost будут хранить значения.. 0, 1, 2, 3.
			# clr_cost[ skan_min] as 0 == не было красных линий.
			# clr_cost[ skan_min +1] as 3 == была зелёная линия из пяти кубиков.


			#int clr_q[ skan_max - skan_min +1] = {0}; // ячейки с ноля.
			#int clr_q[ 100] = {0}; // ячейки с ноля.
			var clr_q = []
			clr_q.resize( 100)
			for i in range( 0, clr_q.size()):
				clr_q[ i] = 0

			var mono_cost = 1

			for i in range( 0, skan_res.tiles_q()):
			#{
				var clr = skan_res.tile_get( i)

				if clr >= skan_min  &&  clr <= skan_max :
					if mono_cost :
						if clr_cost[ clr - skan_min] > 0 :
							clr_q[ clr - skan_min] += mono_cost
					else:
						clr_q[ clr - skan_min] += clr_cost[ clr - skan_min]
			#}

			# clr_q  хранит выдачу в мана-баки.
			
			result_red += clr_q[ KUB_RED - KUB_RED]
			result_gr += clr_q[ KUB_GREEN - KUB_RED]
			result_bl += clr_q[ KUB_BLUE - KUB_RED]
			result_vit += clr_q[ KUB_VIT - KUB_RED]
			result_exp += clr_q[ KUB_EXP - KUB_RED]
			result_ball += clr_q[ KUB_BA1 - KUB_RED]
			# Надо что-то придумать.
			# Пока это тэстовая фигня - просто набираем, без цели.


			fb_pole3.tiles_copy_from( skan_res) # поле-3 это глобалка.
			# Последний сбор здесь фиксируем, для наглядности.
			# Хотя можно создать много запасных досок..
			# fb_pole_m[ skan_loop -1].tiles_copy_from( skan_res)


			#if 0: перекрывать блок, чтобы наглядней было.
			if 1:
			#{
				fb_pole__kill_add2( pole, skan_res, fb_buf_top,
					KUB_TYPE_FIRST, KUB_TYPE_LAST)
			#}
			# здесь вызывать убирание-добавку кубиков,
			# и скан выйдет на очередной круг,
			# чтобы стихийный доп-сбор был.

			# Хотя уместно, ограничить.
			# Допустим, лиш два хвостовых сбора идут в зачёт
			# игрока, который _сейчас_ходит, а все остальные - пролетают
			# мимо. При этом, любое колво хвостовых сборов-сканов
			# обязано продвинуть доп_действие внутри хода.
			# И если это было первое действие, то считается,
			# что мы два действия совершыли
			# (пофиг, если зажаты на одном действии)
			# (визуально, не показывать действия _за_пределами действий).

		#endif

	#} while
	return 1
#---------





func fb_pole__skan_auto__break( pole, skan_res,
skan_min: int, skan_max: int, x: int, y: int, x2: int, y2: int) -> int: # bool

	var re = 0
	var k1 = pole.ofs_or_negat( x, y)
	var k2 = pole.ofs_or_negat( x2, y2)

	var v1 = pole.tile_get( k1)
	var v2 = pole.tile_get( k2)

	if v1 < 1  ||  v2 < 1 :  # if( v1 == 0  ||  v2 == 0 )
		return re

	pole.tile_set( k1, v2) # обменяли, аля PUSH_begin
	pole.tile_set( k2, v1)

	# skan_res  не трогаем, но пусть будет, для аргумента.
	if fb_pole__skan_krest3( pole, skan_res, skan_min, skan_max, 1) :
		fb_test_auto1 = k1 + 1 # из офсета в номер.
		fb_test_auto2 = k2 + 1
		re = 1

	pole.tile_set( k1, v1) # вернули, аля POP
	pole.tile_set( k2, v2)
	return re
#---------







func fb_pole__try_swap_is_near( pole_w: int, k1: int, k2: int) -> int: # bool
	if k1 - 1  ==  k2 :
		return 1

	elif k1 + 1  ==  k2 :
		return 1

	elif k1 - pole_w  ==  k2 :
		return 1

	elif k1 + pole_w  ==  k2 :
		return 1
	#endif
	return 0
#---------




func fb_pole__try_swap( k1: int, k2: int):

	# проца для сервера,
	# но её надо разбить на _проточную_по_задачную.
	# Тоесть, исполнив часть работы, сервер выставляет
	# задачу с пре-ожыданием, которое подразумевает
	# анимацию на клиент-проге ...
	# Ожыдание заканчивается - задача попадает в свой кейс,
	# и проводит очередной скан, или выходит в основное
	# ожыдание _присылай_свап_клетки_проверю.

	if ! fb_pole__try_swap_is_near( fb_pole1.tiles_w(), k1, k2) :
		# err = tiles_not_near
		print( "fb_pole__try_swap ... not near")
		return

	fb_test_klik1 = k1
	fb_test_klik2 = k2

	# Какой-то баг, когда свапиш с последней строкой ...
	# Возможно, виснет из-за попытки сравнить с бортом.
	# Дебаг делал, но баг не повторился.

	fb_pole__skan_base( fb_pole1, fb_pole2,
	KUB_S1, KUB_S_LAST, k1, k2)

	targ_swap_q_player += 1

	fb_test_auto1 = 0
	fb_test_auto2 = 0
	p_targ_swap.start()
#---------




func fb_pole__try_swap__find_auto() -> int:  #bool

	# Если представить, что нет верхнего борта..
	# [1]  2  3  4 [5] // 2<>3, 3<>4 // from( 2) to( 3).
	# [6]  7  8  9 [10] // 2<>7 // Игнорим строку, в накруте сетки.
	# [11]12 13 14 [15] // Нижния строка, как борт.
	# +++
	# 7<>8 // отдельный накрут по строке.
	# 9<>4 // отдельный вызов.

	var tw = fb_pole1.tiles_w() - 1
	var th = fb_pole1.tiles_h() - 1


	#for( int y = 2; y < th; y += 1)  # борт есть - начинаем с 2.
	for y in range( 2, th):
	#{
		#for( int x = 2; x < tw; x += 1)  # from( 2) to( w -2).
		for x in range( 2, tw):
		#{
			if fb_pole__skan_auto__break( fb_pole1, fb_pole2,
			KUB_S1, KUB_S_LAST,  x, y,  x +1, y) :
				return fb_test_auto1 # return 1;

			if fb_pole__skan_auto__break( fb_pole1, fb_pole2,
			KUB_S1, KUB_S_LAST,  x, y,  x, y +1) :
				return fb_test_auto1
		#} for
	#} for


	#for( int x = 2; x < tw; x += 1)
	for x in range( 2, tw):
	#{ // Линия-строка над нижним бортом ..
		if fb_pole__skan_auto__break( fb_pole1, fb_pole2,
		KUB_S1, KUB_S_LAST,  x, th -1,  x +1, th -1) :
			return fb_test_auto1
	#}

	if fb_pole__skan_auto__break( fb_pole1, fb_pole2,
	KUB_S1, KUB_S_LAST,  tw -1, th -1,  tw -1, th -2) :
		return fb_test_auto1

	return fb_test_auto1
#---------







var rand_ugol_ug = 0 # чтобы чередовать 1 и 2.


func fb_pole__rand_ugol( pole,
rand_kub_min: int, rand_kub_max: int, ext_ball: int = 0):

	# Можно проверить rand_kub_min, rand_kub_max

	if ! rand_ugol_ug :
		rand_ugol_ug = g2_random( 1, 2)

	var x = 0

	if rand_ugol_ug == 1 :  # был слева.
		rand_ugol_ug = 2  # ставим правый нижний.
		x = pole.tiles_w() - 2

	elif rand_ugol_ug == 2 :
		rand_ugol_ug = 1  # левый нижний
		x = 2

	if ! x :
		return


	var top_h = pole.tiles_h() - 2

	if 0: #if 1 :
	#{
		#const int omq = 4;
		#int om[ omq]; // как принадлежность блока накрута.
		var omq = 4
		var om = []
		om.resize( omq)
		om[ 0] = pole.ofs_or_negat( x,  top_h)  # инит-часть накрута,
		om[ 1] = pole.ofs_or_negat( x +1,top_h) # где рядом int i = 0;
		om[ 2] = pole.ofs_or_negat( x,  top_h +1)
		om[ 3] = pole.ofs_or_negat( x +1,top_h +1)

		#//int i = 0;
		#//for( ; i < const_limit_loop_q; i += user_loop_adv) //for(;;)
		#// OR
		for i in range( 0, omq):
		#{
			#//if( i >= omq ) // user_limit_loop_q
			#//	break;

			var kub = g2_random( rand_kub_min, rand_kub_max)

			if ext_ball  &&  x :  # если надо мячик, и его не добавляли.
				if g2_random( 0, 1)  ||  (omq - 1) == i :
					kub = ext_ball  # мячик поверх.
					x = 0  # значит, что мячик добавлен.
			#endif

			pole.tile_set( om[ i], kub)
			# (поверх готовых) добавляем типажы кубиков, а не цвет.
		#} for
	#}


	# ---
	# Вероятно, здесь надо оформить вызов отдельной процы ...
	# Но пока пусть кусочек копи-пасты из  fb_pole__skan_base
	var skan_res = fb_pole2  # t_board1& skan_res = fb_pole2;
	var skan_min = KUB_S1
	var skan_max = KUB_S_LAST

	var skan_break = 0
	while ! skan_break :
	#{
		if ! fb_pole__skan_krest3( pole, skan_res, skan_min, skan_max) :
			skan_break = 1

		else:
			# Прибавки от сборов никому не нужны.
			# Надо лиш стабилизировать поле.
			#
			# fb_buf_top == глобалка.
			fb_pole__kill_add2( pole, skan_res, fb_buf_top,
			rand_kub_min, rand_kub_max)
		#
	#} while
#---------













func _process( delta):

	if fb_pole_init == 0 :
	#{
		fb_pole_init = 1 # была попытка иницы, но результат не гарантирован..

		#fb_pole__init( fb_buf_top, fb_buf_top_tiles_w, fb_buf_top_tiles_h)
		fb_pole__init( fb_buf_top, fb_pole_tiles_w, fb_buf_top_tiles_h)

		fb_pole__init( fb_pole1, fb_pole_tiles_w, fb_pole_tiles_h)
		fb_pole__init( fb_pole2, fb_pole_tiles_w, fb_pole_tiles_h)
		fb_pole__init( fb_pole3, fb_pole_tiles_w, fb_pole_tiles_h)

		fb_pole__random( fb_pole1, KUB_RED, KUB_VIT, KUB_EXP)
		fb_pole__random( fb_buf_top, KUB_RED, KUB_VIT, KUB_EXP)
	#}

	#update
	# OR
	self.update() # update the node // call custom _draw()


	# ---
	# Нужно сделать пробные свапы для авто-подсказки и авто-пилота.
	# Тоесть, перебор без влияния на поле, а лиш выкладка на скан-поле.
	#
	# Такжэ, это важно для определения _свапов_нет.
	# Допустим, что надо выбрать правый или левый нижний угол,
	# и все 4 кубика в этом углу заменить случийными цветами,
	# плюс, на одну из клеток, прямо поверх новых кубиков,
	# наклеить кубик обычного мячика.
	# Это можно называть термином - угловой.

	if ! fb_test_auto1 :
	#{
		if p_targ_swap.is_stopped() :
		#{
			p_targ_swap.start()
			targ_swap_q += 1

			# это тож на клиенте можно.

			# Ну и если серверу надо анимировать _соперника_игрока,
			# то некий дубль такой процы вызывать на сервере.
			if ! fb_pole__try_swap__find_auto() :
			#{
				fb_pole__rand_ugol( fb_pole1,
				KUB_RED, KUB_EXP, KUB_BA1);
				# здесь, надо впрыскивать очередной _угловой.
				# Но ждать 3 секунды, или _сколько_настроено,
				# это сомнительно ...
				# Вероятно, подобный вызов надо делать всегда,
				# при смене хода - там и _угловой уместно ставить.
			#}
		#}
	#}
#---------






#// +++++++++++++++++++


#func g_draw_tile_kub64( char field_ind, DWORD clr,
func g_draw_tile_kub64( field_ind: int, clr4: Color,
x: float, y: float, w: float, h: float, ext_ring: int = 0):

	var tex1 = fb_kub__tex( field_ind)
	#var rect = Rect2( Vector2( x, y), Vector2( w, h)) # position, size
	var rect = Rect2( x, y, w, h)

	#Color modulate = Color( 1, 1, 1, 1 )
	draw_texture_rect( tex1, rect, false, clr4)
	
	if ext_ring :
		var ra = w / 2.0
		draw_circle( Vector2( x + ra, y + ra), ra, Color( 1.0, 0.5, 0.5,  0.35) )
#---------




func is_same_coord_and_ofs( pole, x: int, y: int, ofs: int) -> int:
	var r = 0
	if ofs > -1 :
		if pole.ofs_or_negat( x, y) == ofs :
			r = 1
	return r
#---------

func is_same_crd0_and_n( pole, x: int, y: int, nom: int, nom2: int = 0) -> int:
	if nom > 0 :
		if pole.ofs_or_negat( x +1, y +1) == nom - 1:
			return 1
	if nom2 > 0 :
		if pole.ofs_or_negat( x +1, y +1) == nom2 - 1:
			return 1
	return 0
#---------





func _draw(): # spec custom drawing.
#Draw commands are described in class:  CanvasItem
# Но эту процу не вызывают повторно - надо дёргать её,
# вызывая update у ноды, куда скрипт привязан.
	call_update__q += 1

	var tex_tile = 0
	var gr = 0.0
	var bort = 0
	var gw = 0
	var gh = 0

	# ---
	if flag_vis_buf :
		#var toph = fb_pole_tile_w * (fb_buf_top.tiles_h() + 1)
		var toph = fb_pole_tile_w * fb_buf_top.tiles_h()
		gw = fb_buf_top.tiles_w()
		gh = fb_buf_top.tiles_h()
		for y in range( 0, gh):
		#{
			for x in range( 0, gw):
			#{
				g_draw_tile_kub64( 0,  Color( 0.5, 0.5, 0.5),
				x * fb_pole_tile_w + fb_pole_pos_x,
				y * fb_pole_tile_w + fb_pole_pos_z - toph,
				fb_pole_tile_w, fb_pole_tile_w)

				bort = fb_buf_top.tile2( x +1, y +1)

				g_draw_tile_kub64( bort,  Color( 1.0, 1.0, 1.0),
				x * fb_pole_tile_w + fb_pole_pos_x,
				y * fb_pole_tile_w + fb_pole_pos_z - toph,
				fb_pole_tile_w, fb_pole_tile_w)

			#} for
		#} for
	#


	# --- фон ..
	gw = fb_pole1.tiles_w()
	gh = fb_pole1.tiles_h()

	for y in range( 0, gh):
	#{
		for x in range( 0, gw):
		#{
			#gr = 0.4 + rail_bank( 0.5, y +1, gh) // 0.4 .. 0.9

			bort = fb_pole1.tile2( x +1, y +1)

			if bort != KUB_255_BORDER  &&  bort != KUB_254_EMPTY :
				bort = 0 # будет нарисован вариант KUB_254_EMPTY
				# OR
				#continue # не рисуем.

			g_draw_tile_kub64( bort,
			Color( 0.9, 0.9, 0.9), #to_RGBA( 0.7f, gr, 0.7f),
			x * fb_pole_tile_w + fb_pole_pos_x,
			y * fb_pole_tile_w + fb_pole_pos_z,
			fb_pole_tile_w, fb_pole_tile_w)

		#} for
	#} for


	# --- индэксы поля ..
	var ext_ring = 0
	for y in range( 0, gh):
	#{
		for x in range( 0, gw):
		#{
			bort = fb_pole1.tile2( x +1, y +1)

			if bort == KUB_255_BORDER  ||  bort == KUB_254_EMPTY :
				continue # не рисуем борт или пустышку.

			ext_ring = is_same_crd0_and_n( fb_pole1, x, y, hand_klik_tile1)

			g_draw_tile_kub64( bort,
			Color( 1.0, 1.0, 1.0), #to_RGBA( 1.f, 1.f, 1.f),
			x * fb_pole_tile_w + fb_pole_pos_x,
			y * fb_pole_tile_w + fb_pole_pos_z,
			fb_pole_tile_w, fb_pole_tile_w, ext_ring)

		#} for
	#} for


	# --- индэксы сверочного поля (копированого из skan_res) ..
	if test_view_sbor  &&  fb_pole_pos_x2 > 0 :
	#{
		for y in range( 0, gh):
		#{
			for x in range( 0, gw):
			#{
				bort = fb_pole3.tile2( x +1, y +1)

				#if bort == KUB_255_BORDER  ||  bort == KUB_254_EMPTY :
				#	continue

				ext_ring = is_same_crd0_and_n( fb_pole3, x, y,
				fb_test_auto1, fb_test_auto2)

				g_draw_tile_kub64( bort,
				Color( 1.0, 1.0, 1.0), #to_RGBA( 1.f, 1.f, 1.f),
				x * fb_pole_tile_w + fb_pole_pos_x2,
				y * fb_pole_tile_w + fb_pole_pos_z,
				fb_pole_tile_w, fb_pole_tile_w,  ext_ring)
			#} for
		#} for
	#}


	var fmt = "RGB: %d %d %d   vit: %d  exp: %d  ball: %d  swap_q_player: %d"
	pLabel.text = fmt % [ result_red, result_gr, result_bl,
	result_vit, result_exp, result_ball, targ_swap_q_player]

	fmt = "k1: %d   k2: %d   (a1: %d   a2: %d  swap_q: %d)    draw_q: %d"
	pLabel2.text = fmt % [ fb_test_klik1, fb_test_klik2,
	fb_test_auto1, fb_test_auto2,  targ_swap_q , call_update__q ]

#---------





#	//if event is InputEventMouseMotion or event is InputEventScreenDrag:
#	if event is InputEventScreenDrag:
#		// event.relative.x


func _on__gui_input( event):
	var flag = 0
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				flag = 1

	if flag : #if Input.is_mouse_button_pressed( BUTTON_LEFT) :
		if hand_klik_tile1 :
			hand_klik_tile2 = ofs_tile_2d( fb_pole1.tiles_q(),
			fb_pole1.tiles_w(), fb_pole1.tiles_h(),
			event.position.x, event.position.y,
			fb_pole_pos_x, fb_pole_pos_z,
			fb_pole_tile_w, fb_pole_tile_w )

			hand_klik_tile2 += 1

			#// попытка свапа..
			fb_pole__try_swap( hand_klik_tile1, hand_klik_tile2);

			hand_klik_tile1 = 0
			hand_klik_tile2 = 0

		else:
			#// в кардинах экрана
			hand_klik_tile1 = ofs_tile_2d( fb_pole1.tiles_q(),
			fb_pole1.tiles_w(), fb_pole1.tiles_h(),
			event.position.x, event.position.y,
			fb_pole_pos_x, fb_pole_pos_z,
			fb_pole_tile_w, fb_pole_tile_w )

			hand_klik_tile1 += 1
		#

#---------




func _on_Restart_pressed():
	init_game()
#---------


func _on_VisBuf_pressed():
	fb_pole__random( fb_buf_top, KUB_RED, KUB_VIT, KUB_EXP)
	if flag_vis_buf :
		flag_vis_buf = 0
	else:
		flag_vis_buf = 1
#---------


func _on_Test_pressed():
	if test_view_sbor :
		test_view_sbor = 0
	else:
		test_view_sbor = 1
		fb_pole__init( fb_pole3, fb_pole_tiles_w, fb_pole_tiles_h)
#---------




func ofs_tile_2d( ln: int,  xt: int,  yt: int,
xe,  ye,  bX,  bNiz,  tileW,  tileH ) -> int:

	# ln // mas_len // pole.tiles_q()
	# xt // pole.tiles_w()
	# yt // pole.tiles_h()
	# xe // cursor_x // x_ekr
	# ye // cursor_y
	# bX // pole_pos_x
	# bNiz // fut_pole_pos_z // fut_pole_pos_z - высота поля ?
	# tileW // tile_w
	# tileH // same tile_w

	if xe < 0:
		return -1
	if ye < 0:
		return -1

	# --- слишком мелкие габариты не-допускать // деление на ноль
	if tileW < 1: #8:
		return -1
	if tileH < 1: #8:
		return -1

	var oY := 0
	oY = ye - bNiz
	if oY < 1:
		return -1 # не попали в поле.

	var nomLine := 0
	nomLine = (oY / tileH) # самая нижняя это линия номер Ноль.
	# Низ поля сверху от формального верха поля, потому-что угрик
	# системы координат идёт вниз, повышая своё значение.

	var oX := 0
	oX = xe - bX # офсет гориз внутри поля.
	if oX < 1:
		return -1 # курсор за левой стенкой.

	var poleW := 0
	poleW = xt * tileW # шырь поля
	if xe > (bX + poleW):
		return -1 # курсор за правой стенкой.

	var poleH := 0
	poleH = yt * tileH
	if ye > (bNiz + poleH):
		return -1

	var ofs_tile := 0
	ofs_tile = (nomLine * xt)  + (oX / tileW) # от ноля

	# ---
	# До этого, мы проверяли попадание даже в борта - для нужд редактирования.
	# Теперь проверить Борт-ли это и если борт вернуть -1
	if ln:
		pass

	return ofs_tile
#---------


#.

