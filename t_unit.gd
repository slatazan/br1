# struct wo name == const t_unit = preload( "t_unit.gd")
extends Object # extends Node
# version 102


# static typing == Godot vers 3.1

# Project: Project Settings: General : Debug: GDScript:
# set_off  warning UNUSED_VARIABLE
# set_off  warning UNUSED_CLASS_VARIABLE


var uniq := 0 # Уникальный номер entity, между загрузками сохранок.
	# Если ноль, то это свободный кусок опер-памяти.

var nom_base := 0 # с какой заготовки взят из масива заготовок.
var type := 0 # type_boat, type_item_(head).

var active := 0 # если ноль, то экзэмпляр не в игре, но готов.

var auto_start := 0 # 0 или 1 // авто-старт тригера.
var active_b := 0 # блокировки для включения тригера.
var event_q := 0 # сколько раз сработает событие тригера.

var wait_full := 0 # ab__eff_dlit
var wait_now := 0
var wait_cd_full := 0 # ab__cooldown откат.
var wait_cd_now := 0
var trig_off_after_wait := 0 # запаска

# 4 числа - как-минимум, для _зданий..
var nx := 0
var n1 := 0
var n2 := 0
var n3 := 0

var bank_now := 0 # stak_now
var bank_max := 0
var bank_ext := 0 # unit.stak_start

var radius := 0

var test_hit_points := 0
var game_easy_obj := 0 # 0 или 1

var baner := 0 # z_baner_side_red штаб владельца, или спец-значение.

var klan := 0 # klan_kont
var bind1 := 0 # версия привязки юнита или предмета (персональный).


var stak_alone := 0 # лиш один такой одно-времено во владениях юнита.

var stak_one_or_minimal := 0 # единственый или колво _минималь_стак.
	# 0= нет_особеностей, 1= единственый, 2= минималь_стак_2 ...
	# stak_alone дублирует stak_one_or_minimal = 1;

var eq_to := 0 # в какой слот экипируется или как_расходуется.
var eq_to_ext := 0 # флаг дву-ручности или подобных особеностей.
	# eq_to_ext, как добавка прироста юнитов, в домиках-пристройках.

var use_in_war := 0 # use_in_war__only_mir == лиш на схеме этапа.
var use_hero_rang := 0 # треба ранжыр юнита не меньшэ этого.

var use_tal_index := 0 # треба иметь талант. // -tal == не иметь tal.
var use_tal_need_lvl := 0 # какая степень таланта нужна.

var gold_sell := 0 # сколько получим, если продать.

var gold_shop := 0 # сколько денег потратить, чтобы получить шмотку.
var res_wood := 0 # часть цены для получения (шмотки, или юнита).
var res_rood := 0
var res_sol := 0
var res_sah := 0
var res_ser := 0
var res_gas := 0

var level_now := 0 # уровень капитана, юнита, шмотки, абилки.
var level_exp_now := 0 # сила юнита // или набрано для (level_now + 1).
var level_exp_next := 0 # сколько набрать надо для повышэния.

var spec_or_dead := 0 # spec_or_dead__now_dead (для аута, active юзать).


var kle1 := 0 # где находимся.
var kle2 := 0 # где были в пре-шаг. // от этого - визуал-направление.
var kle3 := 0 # для лодки.

var steps_now := 0 # шаги стака солдат // шаги лодки.
var steps_max := 0 # шаги_макс.
var steps_ext := 0 # через них заклин _шагаюший_зомби, когда шаги -1.


var hp_top := 0 # колво хитов верхнего в стэке.
var hp_unit := 0
	# хитов в единицэ стэка, учитывая бонусы (или оригинал заготовки).

var hp_unit_start := 0 # оригинальное колво, на момент старта боя.
	# Тоесть, совсем оригинальные хиты лиш в заготовках смотреть.
	# Но это и не надо - в начале боя, скопировал, исказил,
	# и потом несколько раз исказил, опираясь лиш на hp_unit_start.


var dmg_min := 0 # вилка урона
var dmg_max := 0
var dmg_mode := 0 # проклято-норма-блеск-удвоено.

var rate_dist := 0 # bow_rate // рэйтинг даль-атаки.
var rate_dist_sh := 0 # in shadow time.
var rate_dist_ext := 0 # универсальная добавка.

var rate_hand := 0 # рэйтинг ближ-атаки.
var rate_hand_sh := 0
var rate_hand_ext := 0

var anti_dist := 0 # bow_anti // делитель // оборона от дальних атак
var anti_dist_sh := 0
var anti_dist_ext := 0

var anti_hand := 0
var anti_hand_sh := 0
var anti_hand_ext := 0

var anti_mag := 0 # генеральное противление чудесам, без специфики.
var anti_mag_sh := 0
var anti_mag_ext := 0

var ignor_bon := 0 # игнор бонусов // узкая специфика.
var ignor_neg := 0 # игнор негатива // + игнор бонусов = игнор чудес.


var ini := 0 # инициатива // участвует в назначении очереди активности.
var ini_sh := 0
var ini_ext := 0

var luck := 0 # удача // ограничители в коде.
var moral := 0 # мораль // боевой дух.
var moral_good_event := 0 # повышаем от позитива аля юнит.я_ударил.
var moral_bad_event := 0  # повышаем от проблем аля юнит.меня_ударили.

# Прямо через основное свойство Мораль = 100; // игнор.
# В бою нельзя менять экипировку, и её скан в начале боя, можт найти
# шмотку, где тож есть Мораль == 100, и значит, сие надо передать
# в свойство носителя шмотки, как юнит.Мораль = 100.


var mana := 0 # мана-бак // ab__need_mana
var mana_full := 0

var bolt := 0 # снаряды для выстрелов // ab__need_bolt
var bolt_full := 0

var atk_q := 0 # колво норм атак (1 или 2) (в одну цель).
	# подразумевает CONST _макс // большэ двух нельзя.

var atk_back_q := 0 # ответок осталось.
var atk_back_q_max := 0 # сколько выставлять ответок, в начале раунда.

var atk_suport := 0 # запаска // либо для отметок _был_супорт союзнику.
	# Либо наоборот - отнимать за каждый супорт, если здесь большэ ноля.

var atk_long_hand := 0 # 1 = _атака_через_гекс.
	# -1 = _нет_стандартной_ближней_атаки.


var basis1 := 0 # номерок заготовки, аля элементаль чего-то там.
var basis2 := 0
var basis2_perc := 0 # ноль или проценты гибридности.
	# basis1_perc = 100 - basis2_perc;
	# Можно сотню распределить аля 25 и 75,
	# но пока всех гибридов назначить, как 50 на 50.


var vis_name_index := 0 # пресет-имя предмета для игрока.
var vis_bank := 0 # визуальный типаж-номер в банке шмото-спрайтов.
var vis_inst := 0 # явная модэлька в масиве модэлек.


var ab__dekor := 0 # кейс анимации (частицы, звук).

var ab__is_minor := 0 # 1, как минорность (или процент шанса навески).

var ab__need_steps_for_use := 0
	# сколько шагов надо оставить, чтобы заюзать.

var ab__need_ray_targ := 0 # надо-ли проверять луч видимости до цели.

var ab__targ_vers := 0 # targ_vers__self, targ_vers__area ...
	# Можно обойтись кейсом личной реализации абилки - под её номер.


var ab__dist_min := 0 # минимальная дистанция до цели.
var ab__dist_min_err_perc := 0 # 50, как 0.5 .
	# ноль, если нельзя влезать в миним-дистанцию.

var ab__dist_max := 0 # максимальная дистанция до цели.
var ab__dist_max_err_perc := 0
	# ноль, если нельзя превышать макси-дистанцию.
	# Используем для авто-атаки юнитов-стрельцов (анкета юнита).

var ab__area_type := 0 # тип задевания клеток (луч) ...
	# _атака_без_ответа == (юнит.ab__area_type = 1)

var ab__area_tiles := 0 # сколько абилка задевает клеток (2).
	# _атака_2_соседа == ( юнит.ab__area_tiles = 1)


# --- набор свойств эфекта..

var ef_prior := 0 # для эфекта == приоритет аля категория его важности.
	# Допустим, это слои _перво_удар, если юнит-солдат.
	# Тоесть, отметина и число слоёв, в одном свойстве.
	# Если пасивка навсегда у юнита, то ставим сюда 1000, чтобы
	# механика пыталась отнимать, но не успевала даж за долгий бой.
	# А в новом бою, юнита заново загрузим, из заготовки.


var ef_part := 0 # стабил-эфекты, позитив-эфекты, негатив-эфекты.

var ef_blocked_by_ef := 0 # какой эфект не даёт стартовать этому эфекту.
var ef_replace_ef := 0 # номер предмета = кого выбиваем.

var ef_0_from_clearing := 0 # флаг = исчезаем-ли от _очисток.
var ef_0_from_damage := 0 # исчезаем-ли от ранений (слепота спадает).

var ef_0_from_starting_mask := 0 # исчезаем-ли от входа в невидимку.
var ef_0_from_unit_death := 0 # исчезаем-ли от смерти юнита.

var ef__evt_on_start := 0 # пресет-событие по старту висения эфекта.
var ef__evt_on_reset := 0 # по факту исчезания самого бонуса _досрочно.
var ef__evt_on_end := 0 # по факту норм-окончания длительности ...

var ef_starting_layers := 0 # эфект.слоёв_на_старте.
	# юнит..прирост 12 в псевдо-неделю.

var ef_layers_pack_add := 0 # реплэйс эфекта или пачка_добавки_слоёв.
	# юнит..доп-прирост.

var ef_tik_type := 0 # тикалка яда ...
	# unit.alter_dmg_type (указать, если не физич.)

var ef_tik_rate := 0 #
var ef_tik_klv := 0  #
var ef_tik_skip1 := 0 # 

var ef_tik_progres := 0 #
	# можт хранить нечто 1001, чтобы капитан
	# считался _трансфером в этапы, которые доступны из этого.

var ef_tik_layer_mult := 0 #

var zap1 := 0 # запаска.
var zap2 := 0
var zap3 := 0
var zap4 := 0
var zap5 := 0

	# ---
	# t_link2 { uint to_nom; uint w_uniq; }
	# t_link2 stabil[ q];
	# stabil[ 2].to_nom = x;
	#
	# Допустим, вместо t_link2, у меня будет m2_ ( 0 1 x y x y)
	#
	# m2_stabil_last = 10-ая пара; // 20 мест +2 запас, в начале.

var m2_stabil = []
	# Внедряем стабильные пасивки-абилки (заготовка, и откат-слои).
	# У капитанов, здесь таланты и степень прокачки.
	# Исключительно для этого масива, читаем свойства из файла.


var m2_eq = [] # экипировка - кукла капитана (6 именованых + 4 кармана)


	# m2_bag3_last пар == (норм-рюкзак, бонусы, штрафы).
var m2_bag3 = [] # стрелы, сколько.,   бонус, слои.


	# масив - сундук чудес..
var m_box = [] # From 1 to unit_m_box_last (+1, чтобы не отличалось).
	# Ноль = запаска, потом первые 7 или 8 мест - номерки,
	# которых считаем _избраными - всегда доступны. Остальные места
	# делит спец-рубикон (не константа) - число помнит ячейку, с
	# которой начинаем считать _отключеную_линейку заклинаний.


var name := "рус_an" # название (без склонений). // dont save, dont load


# --- extra: dont save, dont load // не сохранять, не загружать.
var vis_holder = null # техническая указка
var vis_holder_flag := 0 # если здесь 1, то vis_holder рабочий.
var nom_in_mas := 0 # e_m_u[ t].nom_in_mas = t





func n1_2_3( nom: int) -> int:
	if nom == 1: return n1
	if nom == 2: return n2
	if nom == 3: return n3
	return 0
#---------

func n1_2_3_first_empty() -> int:
	if n1 == 0: return 1
	if n2 == 0: return 2
	if n3 == 0: return 3
	return 0
#---------

func n1_2_3_( nom: int, v: int):
	if nom == 1: n1 = v
	elif nom == 2: n2 = v
	elif nom == 3: n3 = v
#---------




func game_side__pre_gold() -> int:
	return bolt
func game_side__pre_wood() -> int:
	return bolt_full
func game_side__pre_rood() -> int:
	return atk_q
func game_side__pre_sol() -> int:
	return atk_back_q
func game_side__pre_sah() -> int:
	return atk_back_q_max
func game_side__pre_ser() -> int:
	return atk_suport
func game_side__pre_gas() -> int:
	return atk_long_hand
#---------


func game_side__pre_gold_( v: int):
	bolt = v
func game_side__pre_wood_( v: int):
	bolt_full = v
func game_side__pre_rood_( v: int):
	atk_q = v
func game_side__pre_sol_( v: int):
	atk_back_q = v
func game_side__pre_sah_( v: int):
	atk_back_q_max = v
func game_side__pre_ser_( v: int):
	atk_suport = v
func game_side__pre_gas_( v: int):
	atk_long_hand = v
#---------


func game_side__res_wood_mult() -> int:
	return eq_to
#---------

func game_side__res_rood_mult() -> int:
	return eq_to_ext
#---------

func game_side__res_wood_teh() -> int:
	if eq_to > 1:
		return 1
	return 0
#---------

func game_side__res_rood_teh() -> int:
	if eq_to_ext > 1:
		return 1
	return 0
#---------




func boat__capacity_( v: int):
	bank_max = v # не забудь вызывать, после получения технолы
func boat__capacity() -> int:
	return bank_max
#---------


func boat__formation_( v: int):
	bank_ext = v
func boat__formation() -> int:
	return bank_ext
#---------




func soldier__week_grow() -> int:
	return ef_starting_layers
#---------

func soldier__week_grow_ext() -> int:
	return ef_layers_pack_add
#---------



func war_unit__grave_( v: int):
	if v:
		spec_or_dead = g2.spec_or_dead__now_dead
	else:
		spec_or_dead = 0
#---------
func war_unit__grave() -> int:
	if spec_or_dead == g2.spec_or_dead__now_dead:
		return 1
	return 0
#---------


func war_unit__boat_slot_( v: int):
	ef__evt_on_start = v
#---------
func war_unit__boat_slot() -> int:
	return ef__evt_on_start
#---------




func gar_fort_level() -> int:
# Допустим, что 1 == миним-форт без башней, 2= башня, 3= две башни.
	return 1
#---------




func get_rate_dist( norm1_dark2: int = 0) -> int:
	if norm1_dark2 == 0:
		norm1_dark2 = g3.war__field_is_dark
	elif norm1_dark2 == 1:
		norm1_dark2 = 0

	if norm1_dark2:
		return rate_dist_sh + rate_dist_ext
	return rate_dist + rate_dist_ext
#---------


func get_rate_hand( norm1_dark2: int = 0) -> int:
	if norm1_dark2 == 0:
		norm1_dark2 = g3.war__field_is_dark
	elif norm1_dark2 == 1:
		norm1_dark2 = 0

	if norm1_dark2:
		return rate_hand_sh + rate_hand_ext
	return rate_hand + rate_hand_ext
#---------


func get_anti_dist( norm1_dark2: int = 0) -> int:
	if norm1_dark2 == 0:
		norm1_dark2 = g3.war__field_is_dark
	elif norm1_dark2 == 1:
		norm1_dark2 = 0

	if norm1_dark2:
		return anti_dist_sh + anti_dist_ext
	return anti_dist + anti_dist_ext
#---------


func get_anti_hand( norm1_dark2: int = 0) -> int:
	if norm1_dark2 == 0:
		norm1_dark2 = g3.war__field_is_dark
	elif norm1_dark2 == 1:
		norm1_dark2 = 0

	if norm1_dark2:
		return anti_hand_sh + anti_hand_ext
	return anti_hand + anti_hand_ext
#---------


func get_anti_mag( norm1_dark2: int = 0) -> int:
	if norm1_dark2 == 0:
		norm1_dark2 = g3.war__field_is_dark
	elif norm1_dark2 == 1:
		norm1_dark2 = 0

	if norm1_dark2:
		return anti_mag_sh + anti_mag_ext
	return anti_mag + anti_mag_ext
#---------


func get_ini( norm1_dark2: int = 0) -> int:
	if norm1_dark2 == 0:
		norm1_dark2 = g3.war__field_is_dark
	elif norm1_dark2 == 1:
		norm1_dark2 = 0

	if norm1_dark2:
		return ini_sh + ini_ext
	return ini + ini_ext
#---------


func get_dmg_mode() -> int:
	if dmg_mode < g2.dmg_mode__norma:
		return g2.dmg_mode__norma
	return dmg_mode
#---------


func luck_add( q: int):
	luck = g2.tram( luck + q, g2.units__luck_min, g2.units__luck_max)
#---------

func moral_add( q: int):
	moral = g2.tram( moral + q, g2.units__moral_min, g2.units__moral_max)
#---------


func mana_add( q: int):
	mana = g2.tram( mana + q, 0, mana_full)
#---------


#
