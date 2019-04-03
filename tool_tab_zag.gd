tool # in script_names_list --> rit klik menu --> RUN
extends EditorScript

var glob_scan_stad := 0

var glob_scan_err := 0
const glob_scan_err__rec_not_open = 1
const glob_scan_err__scan_eof = 2
const glob_scan_err__scan_bad_format = 3
const glob_scan_err__dzag_const = 4


var glo2__format_name_zag_bin = "res://zag/%d"
var glo2__format_name_zag_h = "res://zag/%d.h"
# glo2.format_name_zag_h
# Почему-то их не видят на перво-начальных местах ...
# glo2.m_z_last  видят ... мутновато.
# И всё-таки, не увидели, в очередную загрузку проекта.
const glo2__m_z_last = 820 # дублируем


var dzag = {}
# сюда будем собирать константы и номерки.
# А потом, будем искать имена констант, чтобы заменять на номерки.
# Тоесть, будем выправлять человеческий текст на _чисто_числовой,
# который легко хранить в бинарном формате.

# Можно обойтись без бинарного формата, и печатать новые файлы,
# как старые (стринговые), но с другим три-буквием, в названиях.
#
# Процу считки _таблицы_заготовок можно сделать универсальной,
# когда она пробует открыть бинарный файл, и если не находит, то
# открывает текстовой формат. (бинарный - быстрей и надёжней).



func scan_err_print( i, k):
	print( "Err scan: line_", i, "  nom_file: ", k)


# --- scan
# space = 32 // надо убрать в начале, и в конце найденого
# + = 43
# - = байт 45
# 0 = 48  последовательно до  9 = 57
# Если есть хоть один такой символ, или байт,
# то можно считать число нормальным, а иначе _через_словарик.

func str_start_digital( st) -> bool:
	var buf = st.to_ascii() # st.( 123an)
	
	for i in range( 0, st.length()):
		if buf[ i] < 33:
			continue # пропуск пробелов

		if buf[ i] > 47 && buf[ i] < 58:
			return true
		elif buf[ i] == 43:
			return true
		elif buf[ i] == 45:
			return true
		else:
			break
	return false



#	var st = "123_5"
#	var b = st.find("_")
#	if b != -1:
#		st = st.left( b)
#	print( st) # result 123

func first_str( st):
	var b = st.find(" ")
	if b == -1:
		return st
	return st.left( b)


func first_op( st) -> int:
	var buf = st.to_ascii() # st.( + 123)
	for i in range( 0, st.length()):
		if buf[ i] == 43 || buf[ i] == 45:
			return buf[ i]
	return 0 # при нолевом операторе == лиш первое число учитывают.


func last_val( st, use_abs: int = 1) -> int:
	var a = st.rstrip( " ")
	var b = a.rfind(" ")
	if b == -1:
		return 0 # прибавить или отнять ноль == это не ошыбка.
	a = a.right( b)
	var i = a.to_int()
	if use_abs && i < 0:
		return -i # только позитив
	return i



func scan__op( val1: int, op, val2) -> int:
	if op == 43: # +
		#print( "op+ ", val1 + val2) # test (2 first files)
		return val1 + val2
	elif op == 45:
		#print( "op- ", val1 - val2)
		return val1 - val2
	#print( "val1 ", val1)
	return val1



func scan__next( from_file) -> int: # val__from_file_next_line
	
	if from_file.eof_reached():
		glob_scan_err = glob_scan_err__scan_eof
		return -1 # error
	var a = from_file.get_line()

	var b = a.find( " //") #34 // prop_hint # result is 2
	if b < 1:
		glob_scan_err = glob_scan_err__scan_bad_format
		return -1 # error
	var d = a.substr( 0, b)

	# надо распарсить, если допускать одну операцию (+ или -).
	# d.( z_name + 11 ) --> s1.(z_name) --> op.(43) --> val2.(11)
	var op := 0
	var val2 := 0

	#d = d.lstrip( " ") # попытка убрать пробел, которого не должно быть.
	#d = d.rstrip( " ") # d.(z_name + 11)
	# or
	d = d.strip_edges() # повторяет верхний вариант, и наверно, лучшэ.

	#print( a)
	#print( "[",d,"]")

	var s1 = first_str( d)
	if s1.length() != d.length(): # могут быть добавки.
		d = d.right( s1.length()) # d.( + 11)
		op = first_op( d)
		val2 = last_val( d)

	#print( "---")
	#print( "[",s1,"]  [",d,"]")
	#print( op)
	#print( val2)
	#print( "------")

	if str_start_digital( s1): # число
		#print( "--- s1.to_int")
		return scan__op( s1.to_int(), op, val2)
		# a.( z_name+11 // )  считаем извратом, и не рекомендуем.
		# a.( -z_name - -11 // )  считаем извратом, и не рекомендуем.
		# Первый минус будет воспринят, как ноль - спасибо, GODOT.

	else: # предпологаем название из словарика..
		if dzag.has( s1 ):
			#print( "--- dzag[s1]")
			return scan__op( dzag[ s1 ], op, val2)
		else: # нету такой константы в словарике..
			glob_scan_err = glob_scan_err__dzag_const
			# во_вне, прервать - напечатать номер файла и строки.
			return -1 # error

# -----------




func scan_zag_tab__next_item( k, f):
	var rec = File.new()
	var name = glo2__format_name_zag_bin % k

	rec.open( name, rec.WRITE)
	if ! rec.is_open():
		glob_scan_err = glob_scan_err__rec_not_open
		return

	# rec, как аргумент == запихивать все бин-файлы в один сборник,
	# ставя номер файла и колво чисел, перед очередной анкетой.
	# const q = 151;  rec.store_32( k);  rec.store_32( q)
	# for i in range( 1, q+1): rec.store_32( scan__next( f));

	for i in range( 1, 152):
		rec.store_32( scan__next( f)) # int lines
		if glob_scan_err:
			scan_err_print( i, k)
			break # i

	if ! glob_scan_err:
		var str_name = f.get_line()
		rec.store_32( str_name.length() )
		rec.store_buffer( str_name.to_ascii()) # string as PoolByteArray.
		# В пределах 127, потому-что рус-буквы сжали-заменили,
		# или сделали их отрицательными (я не вникал).

	rec.close()
	# rec.store_32( an)
	# an = rec.get_32()



func scan_zag_tab__dzag_line( st):
	var b = st.find( "const ")
	if b < 0:
		return 0 # like empty line

	var t = st.find( "#")
	if t != -1: # если комент-знак есть..
		if t < b: # если ключевое слово попало в коментарий..
			return 0 # __# const an

	# b as 1
	# st.( const  name= 123 #) -->  sub1.( name)  sub2.( 123 #)
	var r = st.find( "=")
	var con_mark = 6
	var sub1 = st.substr( b +con_mark, r - (b +con_mark))
	# trim sub1 # убрать пробелы в начале и в конце.
	sub1 = sub1.lstrip( " ") # слева убрали
	sub1 = sub1.rstrip( " ") # справа убрали

	if t != -1:
		if t < r +2:
			return 0
		else:
			t = t - (r +1) # kill koment-part.
	else:
		t = 9 # an tail.

	var sub2 = st.substr( r +1, t)
	# sub2 тримить надо лиш в конце - убрать комент-часть.
	# пробел в начале выкинет проца to_int.
	#
	# стринг " 11 # 1-й" через to_int, выдаст 111.
	
	dzag[ sub1 ] = sub2.to_int()
	print( " ++ ", sub1, ": ", dzag[ sub1 ])
	return 1



func scan_zag_tab__dzag():
	glob_scan_stad = 0
	glob_scan_err = 0
	# оформить закачку словарика dzag..
	var src = File.new()
	var name := "res://glo2.gd"

	src.open( name, src.READ)
	if ! src.is_open():
		return 0

	var st := "s"

	while ! src.eof_reached(): # find mark
		st = src.get_line()
		if st.length() < 10:
			continue # while
		if st.find( "#begin_zag") != -1: # горите в аду со своим нолём.
			glob_scan_stad = 1
			print( "starting dzag ...")
			break # while

	var i := 0
	while ! src.eof_reached():
		st = src.get_line()
		if st.length() < 6: # const_
			continue # while
		if st.find( "#end_zag") != -1: # zero is trap
			glob_scan_stad = 10
			print( "dzag fin ( ", i, " )")
			break # while

		if scan_zag_tab__dzag_line( st):
			i += 1

	src.close()
	if glob_scan_stad == 10:
		return 1
	return 0



func scan_zag_tab():
	if ! scan_zag_tab__dzag():
		return 0

	#return 1 # test1


	var file = File.new()
	var q = 0;
	for k in range( 1, glo2__m_z_last +1):
	#for k in range( 1, 3): # test2
		#
		#var name = glo2.format_name_zag_h % k #  Invalid get index
		var name = glo2__format_name_zag_h % k
		file.open( name, file.READ)
		if file.is_open():
			scan_zag_tab__next_item( k, file)
			if glob_scan_err:
				file.close()
				break
			q += 1
		file.close()
	return q



func _run(): # func _ready():
	print( "Files: ", scan_zag_tab())


#