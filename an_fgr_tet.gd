# this godot_file is part of the archive: tet_fgr_and_swap.zip
extends Control # Node
# project window 1024 x 768

# tet-klon

# RUS
# Скрипт привязан к ноде, где созданы несколько таймеров, и пара тайл-мэпов.
# Сцена-скрипт реализует игру наподобие тетриса, со свободными фигурами.
# Каждые 10 новых фигур, пробуем добавить фигуру-бублик, в игровое поле.
# Первая сотая фигура - это супер-звезда, которую можно считать победой в игре.

# Наверху, печатаем количество убраных линий.
# 30 линий - это сильный результат.
# Там, рядом, есть кнопка RE, чтобы начать игру заново.

# Управляем фигурой, чтобы пристроить её в нужное место..
# Стрелки вправо-влево = двигаем.
# Стрелка вниз = ускоряем падение фигуры вниз.
# Пробел или стрелка вверх = поворот фигуры.


#var texKub1_Red = preload("res://k-red.tga")
# вместо отдельных, надо тайл-сэт создать.
# "res://tileset_kub.res"


# --- конфиг назначения клавиш управления..
var key_r = KEY_RIGHT
var key_left = KEY_LEFT
var key_down = KEY_DOWN

var key_rot2 = KEY_UP # поворот фигуры
var key_rotate = KEY_SPACE # поворот фигуры


var key_sel = KEY_F1 # // менять-тестировать
var key_sel2 = KEY_F2 # // менять-тестировать

var key_pause = KEY_ENTER # // ставить игру на паузу // разок


const  indKubN2_Empty = 254  # -2 # int as byte as char -2
const  indKubN1_Border = 255 # -1
#//const  indKub0_Empty = 0
const  indKub1_Red = 1

# Все кубики в стакане, как единички.
# Тоесть, не помнят декоративных деталей (цвета или узора).
# При этом, можно вносить не только единички - линию проверяем с флажком,
# о том, что все номерки вышэ ноля, как одинаковые для логики.



const t_board1 = preload( "res://t_board1.gd")
var board_draw = null  #t_board1 // холст - псевдо-рендер таргет.
var board_test = null  #t_board1 // доска для выяснения сборов.
var stakan = null  #t_board1 // tet_field // начинка стакана, без бортов.


const t_tet_fgr2 = preload( "res://t_tet_fgr2.gd")
var tet_fgr = null  #t_tet_fgr2


#var tog1: t_toggle // остаются нолями - инстанс не создают им.
#var tog2: t_toggle
#var tog3: t_toggle
# OR
const t_toggle = preload( "res://t_toggle.gd")
var tog1 # on ready: tog1 = t_toggle.new()
var tog2
var tog3



# --- глобалки

var main_kolvo = 0 # tmp

var test_key_dn = 0
var test_key_left = 0
var test_key_rit = 0

var need_exit = 0 # // флажок о том, что надо закрыть програму.

var update_pause = 0 # // если не ноль, то обнова игры не происходит.

var update_pause_anim = 0.0 # спец-пауза, чтобы указать убираемые кубики.

var game_over = 0 # // отметка, что игра закончена.

var gen_lines_q = 0 # // сколько линий собрано // статистика для игрока.
var gen_lines_q_tier = 6 #9 # non const == наверно, можно менять, по ходу игры.

var time_last_frame # // время последнего кадра
var time_last_frame_sens_pause # // время последнего кадра, учитывая паузу

#var fall_reinit = 1.0 # 1000 # // таймер авто-падения фигуры.
#var fall_reinit_step = 0.050 # // после сбора каждой линии, уменьшаем fall_reinit.

var fall_reinit = 0.0 # init_tet_game // таймер авто-падения фигуры.
var fall_reinit_step = 0.1 # // после сбора каждой линии, уменьшаем fall_reinit.


var re_hard = 0 # init_tet_game # чтобы сложные фигуры не часто сыпались.
var re_hard_now = re_hard
var klv_fgr_all = 0 # считаем фигуры, которые появились в стакане.
var need_one_kub = 0 # после трудных фигур, вызываем однушку.

var edge_w = 1 # у нас, один борт, поэтому такое краткое название.
var edge_h = 1


var tiles_main_icon = 1 # плитка-знак для кубиков стакана.
var kub_znak1 = 4 # для среднего кубика фигуры.
var kub_znak2 = 7 # когда нет центрального кубика.
var kub_znak3 = 2 # для кубиков фигуры первого пояса.
var kub_znak4 = 6




var fall = null # Timer
var tim1 = null
var tim2 = null
var tim3 = null
var tim4 = null
var tim5 = null

var p_TMapFon = null
var p_TMap2 = null

var p_game_label = null
var p_lines_label = null



const tet_field_w = 15
const tet_field_h = 20



func g2_random( mini: int = 1, maxi: int = 6):
    return ( randi() % (maxi - mini + 1) ) + mini
#---------


# new_node( self, Label.new())
func new_node( parent_for_call_new, call_new):
	if call_new :
		parent_for_call_new.add_child( call_new)
		return call_new
	return null
#---------




func _ready():
	randomize()

	fall = new_node( self, Timer.new())
	fall.start( 1.0)
	fall.set_one_shot( true)

	tim1 = new_node( self, Timer.new())
	tim1.start( 0.15 )
	tim1.set_one_shot( true)

	tim2 = new_node( self, Timer.new())
	tim2.start( 0.15 )
	tim2.set_one_shot( true)

	tim3 = new_node( self, Timer.new())
	tim3.start( 0.04 )
	tim3.set_one_shot( true)

	tim4 = new_node( self, Timer.new())
	tim4.start( 0.15 )
	tim4.set_one_shot( true)

	tim5 = new_node( self, Timer.new())
	tim5.start( 0.15 )
	tim5.set_one_shot( true)



	#p_TMapFon = $TMapFon
	p_TMapFon = new_node( self, TileMap.new())
	
	p_TMapFon.tile_set = load( "res://tileset_kub.res")
	p_TMapFon.cell_size.x = 64
	p_TMapFon.cell_size.y = 64
	p_TMapFon.scale.x = 0.5
	p_TMapFon.scale.y = 0.5

	
	p_TMap2 = new_node( self, TileMap.new())
	
	p_TMap2.tile_set = load( "res://tileset_kub.res")
	p_TMap2.cell_size.x = 64
	p_TMap2.cell_size.y = 64
	p_TMap2.scale.x = 0.5
	p_TMap2.scale.y = 0.5



	# --- после тайл-мэпов
	p_game_label = new_node( self, Label.new())

	p_lines_label = new_node( self, Label.new())
	p_lines_label.rect_position.y += 20


	tog1 = t_toggle.new() # это не нода, а часть скрипта.
	tog2 = t_toggle.new()
	tog3 = t_toggle.new()

	if ! init_tet_game( tet_field_w, tet_field_h) :
		need_exit = 1
	else:
		print( " init_tet_game OK")
#---------




func tet_fgr_restart():
# добавь кнопку, чтобы вызвать эту процу

	if ! init_tet_game( tet_field_w, tet_field_h) :
		need_exit = 1
	else:
		print( " init_tet_game OK")
#---------




func init_tet_game( w: int, h: int) -> int:

	# Подготовка к игре.
	# w  # нужная чистая ширь стакана, без бортов.
	# h  # нужная глубина стакана.

	need_exit = 0
	update_pause = 0
	update_pause_anim = 0.0
	game_over = 0
	gen_lines_q = 0
	gen_lines_q_tier = 6

	fall_reinit = 1.5
	fall.one_shot = true
	fall.start( fall_reinit)

	re_hard = 15
	re_hard_now = re_hard
	klv_fgr_all = 0
	need_one_kub = 0


	if board_draw == null :
		board_draw = t_board1.new()
		#an_pole__init( board_draw, w, h)

	if board_test == null :
		board_test = t_board1.new()
		#an_pole__init( board_test, w, h)

	if stakan == null :
		stakan = t_board1.new()
		#an_pole__init( stakan, w, h)

	if tet_fgr == null :
		tet_fgr = t_tet_fgr2.new() # фигура внутри стакана.

	tet_fgr.re_init()


	if ! board_draw.recreate( edge_w * 2 + w,  edge_h * 2 + h) : # +борты
		return 0

	if ! board_test.recreate( w, h) :
		return 0

	if ! stakan.recreate( w, h) :
		return 0


#	var s_t = "board 1 2: %d %d" % [ board_draw.tile2( 1, 1), board_draw.tile2( 1, 2) ]
#	print( s_t )
#	# показано, что поле заполнено хаос-числами
#
#	board_draw.set_all( 3)
#
#	s_t = "board 1 2: %d %d" % [ board_draw.tile2( 1, 1), board_draw.tile2( 1, 2) ]
#	print( s_t )
#	# показано, что поле заполнено тройками, после вызова процы set_all( 3)

	board_draw.set_all( 0) # всё-таки нолями надо.

	board_test.set_all( 0)
	stakan.set_all( 0) # заполним поле нолями - пусто.


	var cube = 1 # char // накидаем немного кубиков..
	stakan.set_column( 1, 3, cube) # левый край.
	stakan.set_column( w, 5, cube) # правый край.
	# поле стакана без бортов.

	stakan.set_column( 2, 10, cube) # добавим
	stakan.set_column( w -1, 12, cube)

	#//for( int i = 2; i < stakan.tiles_w(); i++)
	for i in range( 2, stakan.tiles_w()):
	#{
		# перекопать несколько строк
		stakan.tile2_( i, h - 3, g2_random( 0, cube))
		stakan.tile2_( i, h - 2, g2_random( 0, cube)) # g2.random( 0, 1)
		stakan.tile2_( i, h - 1, g2_random( 0, cube))
		stakan.tile2_( i, h, g2_random( 0, cube)) # нижния строка
	#}


	fgr_start_pos( stakan, tet_fgr)


	# --- фон-рамка..
	var border_simb = indKubN1_Border # 'z'

	# старое - заполняем один раз, считая, что не будем обновлять эти тайлы..
	board_draw.set_line( 1, 1, border_simb) # верхний борт
	board_draw.set_line( 1, board_draw.tiles_h(), border_simb) # нижний
	board_draw.set_column( 1, 1, border_simb) # левый
	board_draw.set_column( board_draw.tiles_w(), 1, border_simb) # правый
	# надо это перегнать в отдельный тайлмэп.

#	s_t = "board 1-3 2-2: %d %d" % [ board_draw.tile2( 1, 3), board_draw.tile2( 2, 2) ]
#	print( s_t )
#	# показано, что борт появился, и норм-клетка осталась с тройкой.

	upd_tilemap( board_draw, p_TMapFon, 0)
	# p_TMapFon заполнили фоном, и большэ н етрогаем этот тайл-мэп.

	board_draw.set_all( 0) # стираем тайлы борта, потому-что они отдельно.

	return 1
#---------






func _process( delta):
	if delta:
		pass

#	int tet_st_x = 9; позиция тайлмэпов, вместо этого.
#	int tet_st_y = 2;
# Сейчас, тайл-мэпы остались в нолевой позиции - лучшэ двигать
# опорную ноду, чем дублировать сдвиг нескольких тайл-мэпов.

	if need_exit :
		return

	#Sleep( 5) // заботимся о компутере игрока - даём отдыхать.
	# Это внёс в конфиг базовой проги (а не локальной ноды).

	if update_pause_anim > 0.0 :
		update_pause_anim -= delta
		return


	pure_control()

	if ! update_pause : # Если нет видео-роликов, и прочих пауз,
		game_update() # то продвигаем рутину игры.


	# --- набиваем псевдо-пикселя рендер-таргета (посылка от сервера)..

	board_draw.set_all( indKubN2_Empty)  # пустое чистое полотно.

	#render( board_draw, 0, 0, &tet_border, null)  # фон-рамка
	# Допустим, что плитки рамки вбиваем в отдельнкю ноду, при старте игры.


	render( board_draw, edge_w, edge_h, stakan, null)
	# добавляем в board_draw обычные кубики из стакана.

	if ! game_over :
		tet_fgr.draw1( board_draw, edge_w, edge_h,
		kub_znak1, kub_znak2, kub_znak3, kub_znak4)
		# добавляем в board_draw кубики фигуры.

#	#if ! update_pause :
#	dekor_ghost( board_draw, edge_w, edge_h,  'L', 'J', &stakan);


	upd_tilemap( board_draw, p_TMap2, 1)
	# TileMap == p_TMap2 == client node.
	# board_draw считаем буфером, который заполняем инфой от сервера.


	# ---
	main_kolvo += 1 # all frames

	var s = " "
	if game_over :
		s += "Game over ..." # "Game over:  press ESC"
	else:
		s += ("Game frame: %d  h%d  main_icon F1 F2:%d" % [main_kolvo,
		board_draw.tiles_h(), tiles_main_icon])
	
	p_game_label.text = s

	var sfmt = "Lines: %d   (dn %d,  left %d,  rit %d)"
	p_lines_label.text = sfmt % [gen_lines_q, test_key_dn, test_key_left, test_key_rit]

#---------




func an_pole__init( pole, w: int, h: int): # t_board1& pole

	pole.recreate( w, h)

	pole.set_all( indKubN2_Empty) #// не ноль

	var b = indKubN1_Border
	pole.set_column( 1, 1, b) # левый борт.
	pole.set_column( w, 1, b) # pole.tiles_w()

	#pole.set_line( 1, 1, b) # верх.
	pole.set_line( 1, h, b) # низ.
#---------




# upd_tilemap( board_draw, $TMap2)
func upd_tilemap( board_from, tmap_targ, zero_as_empty: int = 0):
	# --- swap to screen.. // из серверного пакета в локальный тайл-мэп
	var orig = 0
	for j in range( 1, board_from.tiles_h() +1):  # все строки
		for i in range( 1, board_from.tiles_w() +1):  # печатаем строку
			orig = board_from.tile2( i, j)

			if orig == indKubN2_Empty :
				orig = -1
			elif orig == indKubN1_Border :
				orig = 8
			elif orig == 0  &&  zero_as_empty :
				orig = -1 # иначе, будем печатать нолевой узор тайл-сета.
			#else:
			#	orig = tiles_main_icon

			tmap_targ.set_cell( i - 1, j - 1, orig)
		#for
	#for j
#---------





# t_tet_fgr2& fgr, t_board1& tf
func fgr_rotate( fgr, tf, q1_q2: int, to_left: int, sinhr: int = 1) -> int:
	# tf // stakan

	if q1_q2 != 1  &&  q1_q2 != 2 :
		return 0

	var fake = t_tet_fgr2.new()
	fake.re_init()
	fake.copy( fgr)

	var imit = t_tet_fgr2.new()
	imit.re_init()
	imit.copy( fgr)

	var dir = 1
	if to_left :
		dir = -1

	var s1 = fgr.belt.size()
	var s2 = fgr.belt2.size()
	var ofs = 0

	for j in range( 0, q1_q2):
	#{
		for i in range( 1, s1):
		#{
			ofs = i + dir
			if ofs == s1 :
				fake.belt[ 1] = imit.belt[ i]

			elif ofs == 0 :
				fake.belt[ s1 -1] = imit.belt[ i]
			else:
				fake.belt[ ofs] = imit.belt[ i]
		#}

		for i in range( 1, s2):
		#{
			ofs = i + dir
			if ofs == s2 :
				fake.belt2[ 1] = imit.belt2[ i]

			elif ofs == 0 :
				fake.belt2[ s2 -1] = imit.belt2[ i]
			else:
				fake.belt2[ ofs] = imit.belt2[ i]
		#}

		if ! fake.proj_ok( tf, 0, 0) :
			return 0  # что-то не-пускает

		imit.to_belt( fake.belt) # обновить имитацию пояса
		imit.to_belt2( fake.belt2)

	#} for j


	if sinhr : # если не нужна гусеница, то второй пояс двигаем снова..
		for j in range( 0, q1_q2):
		#{
			for i in range( 1, s2):
			#{
				ofs = i + dir
				if ofs == s2 :
					fake.belt2[ 1] = imit.belt2[ i]

				elif ofs == 0 :
					fake.belt2[ s2 -1] = imit.belt2[ i]
				else:
					fake.belt2[ ofs] = imit.belt2[ i]
			#}

			if ! fake.proj_ok( tf, 0, 0) :
				return 0

			imit.to_belt2( fake.belt2)
		#} for j


	fgr.to_belt( imit.belt)  # обновить реальный пояс
	fgr.to_belt2( imit.belt2)
	return 1
#---------






#if filter_and_result.tile2( i, j) < 0 :
#if filter_do_stop( filter_and_result.tile2( i, j) ):

func filter_do_stop( filter_tile: int ) -> int:
	# это наметка процедуры - возможно, эти константы здесь не уместны.
	if filter_tile == indKubN2_Empty:
		return 1
	if filter_tile == indKubN1_Border:
		return 1
	return 0
#---------




# ---
# Пара процедур для сканирования цепочек _цветовых_индексов.
# Все совпадения вписываются в доску _result - после этого, проходимся
# по доске результатов, и как-угодно делаем зачёты.
# Вероятно, можно считать это частью класа t_board1

# t_board1& src, t_board1& filter_and_result,
func board_skan1_lines( src, filter_and_result,
chain_minim: int, ind_mean_same: int) -> int:

	#  filter_and_result это обязательный элемент, который заполнен нолями.
	# А если надо блокировать ячейку, то поставь туда отрицательное число.

	var res = 0
	var ind = 0
	var ln = 0
	var val = 0
	var step = 0

	if chain_minim < 1 :
		chain_minim = 1

	for j in range( 1, src.tiles_h() +1):  # все строки.
	#{
		ind = 0
		ln = 0
		step = 1

		#for( int i = src.tiles_w(); i > 0; i--) // уместно в обратную сторону.
		for i in range( src.tiles_w(), 0, -1): # 1 == last
		#for k in range( 0, src.tiles_w(), 1):
		#{
			#var i = src.tiles_w() - k

			var t = src.tile2( i, j)
			val = 0 # если t ноль, то не будет val = t

			var tail_skip = 0

			if filter_do_stop( filter_and_result.tile2( i, j) ):
				val = 0 # фильтр говорит, что индекс-ячейка не доступна.
				print( "board_skan1_lines:  do_stop")

			elif t : # если есть какой-то индекс.
			#elif val = src.tile2( i, j) : // err
			#{
				val = t
				# val может быть отрицательным, и это считается нормальным.

				var flag = 0
				if ind  &&  ind_mean_same :
					flag = 1
				elif ind == val :
					flag = 1
				if flag :
				#{
					# засекли повтор // или это какой-то _второй_камень
					ln += 1  # прибавим.

					if i != 1 : # если мы не доползли до первой левой ячейки,
						#continue # переходим на новую ячейку (левей).
						# OR
						tail_skip = 1 # Если запретить опасный оператор continue
					else:
						step = 0
				#}
			#}

			# --- в любом случии, повтор не найден, и надо проверить накопленое
			if ! tail_skip :
				if ln >= chain_minim :
				#{
					# надо внести индекс в результат
					filter_and_result.set_line( i + step, j, ind, ln) # назад-вправо.
					#var s = "res: i%d, step%d, j%d, ind%d, ln%d" % [ i, step, j, ind, ln ]
					#print( s)
					
					res = 1
				#}

				if val != 0 :  # есть индекс - назначим новые показатели.
					ind = val
					ln = 1

				else: # обнолим показатели.
				#{
					ind = 0
					ln = 0
				#}
			# else: next lap
		#} for k
	#}for

	if res :
		return 1
	return 0
#---------




# t_board1& src, t_board1& filter_and_result
func board_skan1_columns( src, filter_and_result,
chain_minim: int, ind_mean_same: int) -> int:

	var res = 0
	var ind = 0
	var ln = 0
	var val = 0
	var step = 0

	if chain_minim < 1 :
		chain_minim = 1

	for i in range( 1, src.tiles_w() +1):  # !!! // все колонки
	#{
		ind = 0
		ln = 0
		step = 1

		#for j in range( src.tiles_h(), 0, -1):
		for k in range( 0, src.tiles_h(), 1):
		#{
			var j = src.tiles_h() - k # !!! // идём снизу наверх.

			var t = src.tile2( i, j)
			val = 0 #

			if filter_do_stop( filter_and_result.tile2( i, j) ):
				val = 0

			elif t :
			#{
				val = t
				if ind == val  ||  (ind && ind_mean_same) :
				#{
					ln += 1

					if j != 1 :  # если мы не доползли до верхней ячейки
						continue
					else:
						step = 0
				#}
			#}

			if ln >= chain_minim :
			#{
				filter_and_result.set_column( i, j + step, ind, ln) # вниз
				res = 1
			#}

			if val != 0 :
				ind = val
				ln = 1

			else:
			#{
				ind = 0
				ln = 0
			#}
		#} for k
	#} for

	if res :
		return 1
	return 0
#---------




















#void fgr_start_pos( t_board1& tf, t_tet_fgr2& fgr)
func fgr_start_pos( tf, fgr):
	var now_fgr_q = klv_fgr_all + 1

	fgr.mid_tx = tf.tiles_w() / 2 + 1  # в центр стакана.
	#fgr.mid_ty = 2  # чтобы верхний ряд фигуры попадал в верхнюю линию.
	# Новость - добавлен _пояс_2, поэтому надо на строку нижэ..
	fgr.mid_ty = 3
	fgr.set_belt2( 0)

	# ---
	if now_fgr_q == 100 :
		need_one_kub = 0 # чтобы не пропустить супер-звезду.
	elif g2_random( 0, 3) == 3  &&  klv_fgr_all > 99 :
		need_one_kub = 1


	# --- надо взять фигуру из пресетов, либо дать волю рулетке
	if need_one_kub :
		fgr.mid_core = 1
		fgr.set_belt( 0)
		need_one_kub = 0

	elif now_fgr_q % 10 == 0 : # иногда, однушка вытесняет этот кейс.
	#{
		if now_fgr_q % 100 == 0 : # super_star
			fgr.mid_core = 1
			fgr.set_belt( 1)
			fgr.belt2[ 3] = 1 # наверху
			fgr.belt2[ 7] = 1 # справа
			fgr.belt2[ 11] = 1 # снизу
			fgr.belt2[ 15] = 1 # слева
			need_one_kub = 1
		else: # бублик..
			need_one_kub = 1 # чтобы не делать повторного бублика.
			fgr.mid_core = 0 # нет центрального, но
			fgr.set_belt( 1) # заполняем весь пояс.
			if g2_random( 0, 2) :
				fgr.belt[ 6] = 0 # дырка внизу
		#
	#}
	elif g2_random( 1, 9) == 5 :
	#{
		fgr.mid_core = 1  # центральный кубик фигуры

		# не чистим пояс-1, и добавляем вертикальную палку
		fgr.belt[ 2] = 1 # верхния серединка в первом поясе
		fgr.belt[ 6] = 1

		if g2_random( 0, 1) :
			fgr.belt2[ 3] = 1 # верхния серединка в втором поясе
	#}
	elif g2_random( 1, 9) == 4 :  # циферки от балды
	#{
		fgr.mid_core = 1

		fgr.set_belt( 0)  # чистим пояс-1
		fgr.belt[ 2] = 1

		if g2_random( 0, 2) == 2 :
			fgr.set_belt2( 0)
			if g2_random( 0, 1) :
				fgr.belt[ 2] = 1
			if g2_random( 0, 1) :
				fgr.belt[ 3] = 1
			if g2_random( 0, 1) :
				fgr.belt[ 4] = 1
	#}
	else:
	#{
		if gen_lines_q > gen_lines_q_tier * 2 : # если собрано большэ порога
			fgr.rand_fill( 6)  # усложняем-2
			if re_hard_now :
				re_hard_now -= 1
			else:
				re_hard_now = re_hard
				re_hard -= 1
				fgr.belt2_rand_fill( 7)
				need_one_kub = 1

		elif gen_lines_q > gen_lines_q_tier :
			fgr.rand_fill( 5)  # усложняем-1
			need_one_kub = g2_random( 0, 1)

		else:
			fgr.rand_fill( 4)
	#}

	if ! fgr.proj_ok( tf, 0, 0) :  # если фигура сразу не влезла в поле.
		#update_pause = 1; мало эфекта - можно клавишу паузы жмакать.
		game_over = 1  # нужен отдельный флажок.
	else:
		klv_fgr_all += 1

#---------







# void event_landing( t_board1& tf, t_tet_fgr2& fgr)
func event_landing( tf, fgr):

	# событийная процедура.

	fgr.draw1( tf, 0, 0,   1, 0, 1) # врисовать единички в реальное поле.

	fgr_start_pos( tf, fgr) # поднять фигуру, и новые кубики там сделать

	# далее проба сделать зачёт

	var chain = tf.tiles_w()
	var same = 1

	# --- сканируем без фильтра, но обноляем доску теста..
	board_test.set_all( 0)


	if board_skan1_lines( tf, board_test, chain, same) :
	#{
		#print( "landing res")
		# нашлось - нужно оформить реакцию, добавить статистику.
		
		#update_pause_anim = 1.5 # полторы секунды паузы.
		# Кажысь глюк-лок из-за этого (двигать вбок нельзя)

		# здесь можно выставить декор-фазу, и добавить update_pause = 1;
		# Когда искры закончатся, то снова update_pause = 0;
		# ... момент поджимания строк придётся перенести отсюда
		# в место, где снова update_pause = 0;

		# хитро поджать строки..
		#for( int k = 1; k <= board_test.tiles_h(); k++) // строки сверху-вниз
		for k in range( 1, board_test.tiles_h() +1):
		#{
			if ! board_test.tile2( 1, k) :
				continue

			#else: // есть первая отметина, как вся линия.

			gen_lines_q += 1 # статистика

			#fall_reinit -= fall_reinit_step # усложнение.
			# Можно обойтись без ускорения.

			if fall_reinit < 0.5 : # 500 milsec or 0.5 sec
				fall_reinit = 0.5

			#for( int j = k; j >= 1; j--) # мотаем строки к первой.
			for j in range( k, 0, -1):
			#{
				if ! stakan.line_copy( j -1, j) : # верхнюю в нижню.
					stakan.set_line( 1, j,  0) # если верхней линии нет.
			#}for

		#}for

		# board_test остался не тронут, но проекция линий уже не совпадает.
	#}

#---------




#func GetAsyncKeyState( key_scancode) -> int:
func pressed( key_scancode) -> int:
	if Input.is_key_pressed( key_scancode) :
		return 1
	return 0
#---------







func pure_control():

	# проточная процедура.

	if update_pause :
		pass
		#tik2.reinit(); // сбрасываем в ноль, чтобы не накапливалось ...
#	time_last_frame_sens_pause = tik2.non_pulse_result( 1);


	# для тестирования важных параметров во время игры
	if tog1.trig_zero( pressed( key_sel)) :
	#{
		tiles_main_icon -= 1
		# OR
		#stakan.slide_line( 2, stakan.tiles_h(), -2, stakan.tiles_w() -1);
		#stakan.slide_column( 2, 3, -2, stakan.tiles_h() -2);
	#}

	if tog2.trig_zero( pressed( key_sel2)) :
	#{
		tiles_main_icon += 1
		# OR
		#stakan.slide_line( 1, stakan.tiles_h(), 2, stakan.tiles_w() -1);
		#stakan.slide_column( 2, 1,  2, stakan.tiles_h() -2);
	#}

	if tiles_main_icon < 1 :
		tiles_main_icon = 1

	if tiles_main_icon > 7 :
		tiles_main_icon = 7


	if tog3.trig_zero( pressed( key_pause)) :
	#{
		if update_pause :
			update_pause = 0
		else:
			update_pause = 1
	#}

	if Input.is_key_pressed( KEY_ESCAPE) :
		need_exit = 1
#---------







func game_update():

	if game_over :
		return  # игра закончена - закрой програму (или жми RE).

	if tim1.is_stopped()  &&  pressed( key_r) :
	#{
		tim1.start() # заново, после нажатия на кнопку.
		test_key_rit += 1
		if tet_fgr.proj_ok( stakan, 1, 0) :
			tet_fgr.mid_tx += 1
	#}
	elif tim2.is_stopped()  &&  pressed( key_left) :
	#{
		tim2.start()
		test_key_left += 1
		if tet_fgr.proj_ok( stakan, -1, 0) :
			tet_fgr.mid_tx -= 1
	#}
	elif tim3.is_stopped()  &&  pressed( key_down) :
	#{
		tim3.start()
		test_key_dn += 1
		if tet_fgr.proj_ok( stakan, 0, 1) :
			tet_fgr.mid_ty += 1
			fall.start( fall_reinit)
	#}


	if tim4.is_stopped()  &&  pressed( key_rotate) :
		tim4.start()
		if ! fgr_rotate( tet_fgr, stakan, 2, 1, 1) : #tet_fgr.rotate( stakan, 2, 1)
			print( "blocked fgr_rotate left")

	if tim5.is_stopped()  &&  pressed( key_rot2) : # up: по-часовой
		tim5.start()
		if ! fgr_rotate( tet_fgr, stakan, 2, 0, 1) : #tet_fgr.rotate( stakan, 2, 0)
			print( "blocked fgr_rotate rit")


	if fall.is_stopped() : # если засекли очередной пульс _падения_фигуры
	#{
		fall.start( fall_reinit)

		# проге нужно двинуть фигуру вниз.

		if tet_fgr.proj_ok( stakan, 0, 1) : # если проекция +1 успешна
			tet_fgr.mid_ty += 1  # продвигаем на клеточку вниз.
		else: # иначе
			#print( "call landing")
			event_landing( stakan, tet_fgr) # событие приземления.
	#}

#---------




#func tet_texture( int x, int y, t_board1* a, t_board1* ext)
func tet_texture( x: int, y: int, a, ext):
	# ext == поле, где отмечены тайлы _льда, _песка ...
	# Но пока, самая простая реализация - забираем то, что хранит тайл.
	return a.tile2( x, y)

#	if a.tile2( x, y): return tiles_main_icon
#---------




#void render( t_board1& rt, int ofs_x, int ofs_y, t_board1* obj,
#  t_board1* obj2 = 0 )

func render( rt,  ofs_x: int,  ofs_y: int,  obj, obj2 ):

#  // rt // render_targ // board_draw
#  // obj2 аля не-обязательный фильтр
#	if ! obj :
	if obj == null :
		return

	#for( int j = 1; j <= obj->tiles_h(); j++) // все строки
	for j in range( 1, obj.tiles_h() +1):
	#{
		#for( int i = 1; i <= obj->tiles_w(); i++) // печатаем строку
		for i in range( 1, obj.tiles_w() +1):
		#{
			# проекция тайла на холст
			var val_set = tet_texture( i, j, obj, obj2)
			if val_set:
				rt.tile2_( i + ofs_x,  j + ofs_y, val_set )
			# obj.draw_tile( i, j, obj2)
		#}
	#}
#---------




#.
