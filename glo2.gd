
extends Node #extends Object # extends Node

#begin_zag  # спец-метка, чтобы собирать константы уместные в анкетах.

# --- тип урона..

const dmg_fiz = 1 #// физ
const dmg_fire = 2 #// огонь
const dmg_el = 3 #// электро


# --- нагрузка клетки (как-минимум, на поле боя)..

const land__border = -1 # борт # border # zero == __border
const land__water = 1 # лужа
const land__grass = 2 # 
const land__rock = 3 #
const land__wood = 4 # ? плюс слой, если новый эфект связан с горением.
const land__cirk_bees = 5 # метка_пчёл.
const land__myst_trap = 6 # метка мистические капканы.
const land__wind_funnel = 7 # воздушный вихрь.
const land__kont_sabotage = 8 # саботаж_метка.
const land__smoke_anti_kont = 9 # серый дым анти-контроля.
const land__black_smoke = 10 # чёрный дым пожара // z_sp_flam_burning.
const land__fire_bolt = 11 # костёр поджыга не идёт на land__water.



# ---
const klan_none = 0 # нейтрал.
const klan_first = 1

const klan_kont = 1 # контроль // клан == образ_города. 
const klan_cirk = 2 # циркачи
const klan_myst = 3 # мистики.
const klan_flam = 4 # пламя.
#const klan_x =  # можно добавлять
const klan_last = 4 # это не номерок - это костыль - псевдо-константа.


# --- большой набор констант..

const z_redir_kle1 = 1 # zag_redir_kle1 // пере-направление _капитанское.
const z_redir_kle2 = 2 # второе пере-направление.
const z_redir_kle3 = 3 # три первых номерка - это спец-финты.

# Дальшэ идут номерки, которые можно использовать при создании этапа.
# Выбрать _тайл_4, кликнуть в пустую клетку - создать там невидимый
# юнит.штаб_ядро, у которого выставят unit.baner = z_baner_side_red;

const z_baner_side_first = 4 # game_side
const z_baner_side_red = 4  # первый штаб (первый игрок).
const z_baner_side_green = 5 # цвет флага второго штаба.
const z_baner_side_blue = 6
const z_baner_side_yellow = 7
const z_baner_side_purple = 8
const z_baner_side_teal = 9 # флаг 6-го и последнего игрока в этапе.
const z_baner_side_last = 9
# q = last - first +1;

const z_baner__unit_born = 10 # спец-номерок прироста // _предмет_прикорм.


# --- 4 набора домиков школ и казарм, под каждый клан..

const z_dom_town_kont_m1 = 11 # 1-й этаж школы контроля.
const z_dom_town_kont_m2 = 12
const z_dom_town_kont_m3 = 13
const z_dom_town_kont_m4 = 14

const z_dom_town_kont_m5 = 15 # купол, без заклинаний.
	# Можно назвать (система наблюдения) или (тотал-контроль).
	# При осадах города, купол отключает всем Хитрец..маскировка.
	# Вдобавок, здание продаёт талант Контроль.

const z_dom_town_kont_u1 = 16
const z_dom_town_kont_u2 = 17
const z_dom_town_kont_u34 = 18 # выбор между 3 и 4 юнитом города _контроль.
const z_dom_town_kont_u56 = 19
const z_dom_town_kont_u78 = 20


const z_dom_town_cirk_m1 = 21
const z_dom_town_cirk_m2 = 22
const z_dom_town_cirk_m3 = 23
const z_dom_town_cirk_m4 = 24

const z_dom_town_cirk_m5 = 25 # купол _хит_парад.
	# На одной схеме этапа, каждый капитан можт посетить три таких
	# хит-парада, и последовательно получить 1000, 2000, 3000 опыта.

const z_dom_town_cirk_u1 = 26
const z_dom_town_cirk_u2 = 27
const z_dom_town_cirk_u34 = 28
const z_dom_town_cirk_u56 = 29
const z_dom_town_cirk_u78 = 30


const z_dom_town_myst_m1 = 31
const z_dom_town_myst_m2 = 32
const z_dom_town_myst_m3 = 33
const z_dom_town_myst_m4 = 34
const z_dom_town_myst_m5 = 35 # купол _астрономия (можт быть, как стена).
	# Домик для найма монстра _звёздная_птица.
	# Возможный прикол - доступ для чужаков, если доп-стены не будет.

const z_dom_town_myst_u1 = 36
const z_dom_town_myst_u2 = 37
const z_dom_town_myst_u34 = 38
const z_dom_town_myst_u56 = 39
const z_dom_town_myst_u78 = 40


const z_dom_town_flam_m1 = 41
const z_dom_town_flam_m2 = 42
const z_dom_town_flam_m3 = 43
const z_dom_town_flam_m4 = 44
const z_dom_town_flam_m5 = 45 # купол (? sunrise ?).
	# Преобразование.. череп-мерцатель --> птица-мерцатель.

const z_dom_town_flam_u1 = 46
const z_dom_town_flam_u2 = 47
const z_dom_town_flam_u34 = 48
const z_dom_town_flam_u56 = 49
const z_dom_town_flam_u78 = 50



# --- особые здания кланов..

const z_dom_town_kont_dungeon = 51
	# подземный_полигон // нанять капитана-воеводу.

const z_dom_town_kont_sugar_ext = 52 # сахарный завод // даёт ресурс.
const z_dom_town_kont_x = 53 # запаска


const z_dom_town_cirk_b_market = 54 # чёрный рынок, продаёт талант Хитрость.
	# Наверно, от сочетания наличия домика пегасов и школы чудес
	# 3-го или 4-го левела, в окно закупок чёрного рынка добавляют
	# продажу _звёздная_птица (? количество берут из пегасов ?).

const z_dom_town_cirk_x = 55 # запаска
const z_dom_town_cirk_z = 56 # запаска


const z_dom_town_myst_exp_bank = 57 # либерализм (банк опыта для капитанов).
	# Бунтарские волны монстров на город = накопление опыта капитанам.

const z_dom_town_myst_tele_tower = 58 # теле-башня удачи (кусок стены).
	# Каждый раунд, рядовым союзникам обороны города, прибавляем
	# 5 удачи, если она нижэ ноля. Важно для _мистический_дракон.

const z_dom_town_myst_x = 59 # запаска


const z_dom_town_flam_eternal = 60 # разовая покупка опыта для капитанов.
	# Вечный огонь (треба.. школа пламени, и казарма черепа).
	# Здесь можт быть преобразование (лесоруб --> шаман).

const z_dom_town_flam_park = 61
	# Малиновый сад - прирост (наверно, это не кусок стены).
	# Этот сад-парк можт нести преобразование (бандит --> лесоруб).

const z_dom_town_flam_mega_forge = 62
	# Подземная мега-плавильня (прирост гиганта - не часть стены).


# -------

const z_dom_town_main = 63 # ратуша и образ клана.
	# Подразумеваю спец-процу, которая заполнит доп-свойства и
	# соседей (гарнизон) для образования ядра города.

const z_dom_gar = 64 # гарнизон-точ-филд = обший для всех (городов и шахт).
	# Если нет рядом z_dom_town_main или шахты == само-гарнизон.

const z_dom_gar_tower = 65 # (сосед гарнизона) башня лучников города.

const z_dom_prison = 66 # тюрьма города (не спаунер капитана).
	# Занимаем номерок, но пока проше удалять капитанов,
	# которые проиграли любой бой (не смогли убежать).

const z_dom_wall = 67 # ставить высокий левел, чтоб не пере-прыгивали.

const z_dom_tavern = 68 # наём капитана( хикс) // зависимость от ратушы.

const z_dom_market = 69 # здание рынка не привязано к теме города.

const z_dom_shop_tal = 70 # продажа талантов
const z_dom_shop_mag = 71 # продажа заклинаний
const z_dom_shop_eq = 72 # продажа экипировки

const z_dom_up_x = 73 # случийная разовая повышалка капитану.
const z_dom_up_armor = 74 # броня ап
const z_dom_up_atk = 75 # атака ап
const z_dom_up_ini = 76 # иница ап


const z_dom_key_camp_red = 77 # пароль-цвето-ключ для штаба.
const z_dom_key_camp_green = 78 # ключи могут разово усилять капитана.
const z_dom_key_camp_blue = 79
const z_dom_key_camp_yellow = 80
const z_dom_key_camp_purple = 81
const z_dom_key_camp_teal = 82

const z_dom_key_gate_red = 83 # нет усилений, от прохода через ворота.
const z_dom_key_gate_green = 84 # проход, если иметь зелёный ключ.
const z_dom_key_gate_blue = 85
const z_dom_key_gate_yellow = 86
const z_dom_key_gate_purple = 87
const z_dom_key_gate_teal = 88


const z_dom_temple_mix = 89 # разные варианты, изначально случийные.
const z_dom_temple_luck = 90 # удача // усил до первого боя, включительно.
const z_dom_temple_morale = 91 # мораль
const z_dom_temple_hp_captain = 92 # жызни-мер капитанов.

const z_dom_harv_res = 93
	# Мельница дарит ресурс (прогрес созревания - успей навестить).

const z_dom_harv_exp = 94
	# Тренер-призрак - покупка мини-порции опыта, раз в неделю.

const z_dom_x_mob1 = 95 # найм монстра уровень-1 ( хикс)
const z_dom_x_mob2 = 96 # найм монстра у2( хикс)
const z_dom_x_mob3 = 97 # найм монстра у3( хикс)
const z_dom_x_mob4 = 98 # найм монстра у4( хикс)

const z_dom_x_bank = 99 # для разграбления

const z_mine_gold = 100 # добыча ресурса
const z_mine_wood = 101
const z_mine_rood = 102
const z_mine_sol = 103 # salt
const z_mine_sah = 104 # sugar
const z_mine_ser = 105 # sulphur
const z_mine_gas = 106

const z_gift_pile_gold = 107 # рулетка-порция ресурса
const z_gift_pile_wood = 108
const z_gift_pile_rood = 109
const z_gift_pile_sol = 110
const z_gift_pile_sah = 111
const z_gift_pile_ser = 112
const z_gift_pile_gas = 113

const z_gift_box1 = 114 # box == подарки (костры, скелеты).
const z_gift_box2 = 115
const z_gift_box3 = 116
const z_gift_box4 = 117


const z_trig_signal = 118 # универсальный тригер (изначально - активатор).
const z_trig_sens = 119 # капкан-сигнал, от косания (условия _кого_ждём).
const z_trig_msg = 120 # табличка с текстом.

const z_trig_lock = 121 # Башни-затычки // условия само-исчезания + соседи.
	# Например, убрать 6 соседей, либо спец-залинкованое.
	# Можно выставить невидимость, но изначально - видимая затычка.

const z_trig_portal_red = 122 # версия точ-филда ...
const z_trig_portal_green = 123 # цвет - это условность, и ничего не значит.
const z_trig_portal_blue = 124 # если не назначить цель, то рандом-клетка.

const z_trig_spawn_mob1 = 125 # можно зарядить любого монстра
const z_trig_spawn_mob2 = 126
const z_trig_spawn_mob3 = 127
const z_trig_spawn_mob4 = 128

const z_trig_spawn_item1 = 129 # здание-предмет - видно что охраняют монстры
const z_trig_spawn_item2 = 130
const z_trig_spawn_item3 = 131
const z_trig_spawn_item4 = 132



# --- юниты-рядовые  // u == unit == soldier == creature == monster
 
const z_u1_kont_envier = 133 # [ромбик-1] завистник (1-й уровень)
const z_u2_kont_worker = 134 # [р-2] работяга (1-й левел)
const z_u3_kont_servant = 135 # [р-3] прислуга (2-й левел)
const z_u4_kont_stone_guard = 136 # [р-4] каменый страж (2-й уровень)
const z_u5_kont_mistress = 137 # [р-5] директорша (3-й уровень)
const z_u6_kont_wild_banker = 138 # [р-6] дикий банкир (3-й левел)
const z_u7_kont_presser = 139  # [р-7] давитель (4-й левел)
const z_u8_kont_crystal_god = 140 # [р-8] кристалит (4-й левел)

const z_u1_cirk_lucky_fairy = 141 # [трилист-1] чудесная фея (1-й уровень)
const z_u2_cirk_bear = 142  # [т-2] медведь (1-й левел)
const z_u3_cirk_master_x = 143 # [т-3] мастер-хикс (2-й уровень)
const z_u4_cirk_tearful = 144 # [т-4] плакса (2-й левел)
const z_u5_cirk_pegasus = 145 # [т-5] пегас (3-й уровень)
const z_u6_cirk_harlequin = 146 # [т-6] арлекин (3-й левел)
const z_u7_cirk_motopunk = 147 # [т-7] мотолом (4-й уровень) motorpunk
const z_u8_cirk_battle_wood = 148 # [т-8] чудесная мачта (4-й левел) mast

const z_u1_myst_skeleton_junk = 149 # [пика-1] скелетный лом (1-й уровень)
const z_u2_myst_skull_flicker = 150 # [п-2] череп-мерцатель (1-й уровень)
const z_u3_myst_mummy = 151  # [п-3] ломовая мумия (2-й левел)
const z_u4_myst_ghosts = 152 # [п-4] призраки (2-й левел)
const z_u5_myst_vampire = 153 # [п-5] вампир (3-й левел)
const z_u6_myst_star_bird = 154 # [п-6] звёздная птица (3-й уровень)
const z_u7_myst_mystical_dragon = 155 # [п-7] мистический дракон (4-й ур)
const z_u8_myst_darkness_lord = 156 # [п-8] тёмный повелитель (4-й левел)

const z_u1_flam_bandit = 157 # [сердце-1] бандит (1-й левел)
const z_u2_flam_bird_flicker = 158 # [сердце] птица-мерцатель (3-й уровень)
const z_u3_flam_axeman = 159 # [с-3] лесоруб (2-й уровень)
const z_u4_flam_shaman = 160 # [с-4] шаман (2-й левел)
const z_u5_flam_demonic_guard = 161 # [с-5] демонический страж (3-й уровень)
const z_u6_flam_evil_rider = 162 # [с-6] злой всадник (3-й левел)
const z_u7_flam_steel_giant = 163 # [с-7] стальной гигант (4-й уровень)
const z_u8_flam_queen_jatva = 164 # [с-8] королева-жатва (4-й левел)

const z_u_netr__pantera = 165  # [нейтрал] пантера хикс-тигр (2-й уровень)

const z_u_netr__siege_machine = 166 # [н] осадная машына (2-й уровень)
	# Помогает при осаде городов, но детали не ясны.

const z_u_netr__green_guard = 167 # [н] зелёный страж (3-й уровень)
	# Гоблин-орк, закованый в латы.

const z_u_netr__giant_thrower = 168 # [н] гигант-метатель (3-й уровень)
	# Ходит, махает рукой - раскидывает соседей, стреляет вблизи.

const z_u_netr__captain = 169 # юнит-капитан (обше-заготовка).
const z_u_netr__baner_side_ext = 170 # юнит-штаб-деталь // невидимый.
const z_u_netr__npc = 171 # юнит-купец // запаска

const z_u_boat = 172 # лодка-отряд на сехме этапа.

const z_u_war__totem_luck = 173 # рычаг _ап_удачи // чуток удачи
const z_u_war__totem_hunter = 174 # рычаг _знамя_успешной_дани

const z_u_war__gold_box = 175
	# сундук _плюс_золото // на поле боя, при разграблениях схронов.

const z_u_war__mana_rock = 176 # валун мана-куст // своровать с него ману.
const z_u_war__wall = 177 # кусок забора для имиты фортификаций.
const z_u_war__tree = 178 # дерево-помеха.
const z_u_war__x = 179 # запаска
const z_u_war__z = 180 # запаска


# --- предметы.
# Могут _лежать на земле (z_trig_spawn_item1 + номерок предмета).

const z_item_hand_torch = 181 # Факел. (уровень-1)

const z_item_hand_sabre = 182 # Сабля. (уровень-1)

const z_item_hand_sabre_poison = 183
	# Ядо-сабля < попутный атак-эфект отравления >. (уровень-2)

const z_item_hand_sabre_dark = 184
	# Сабля полной тьмы. (уровень-4) // sabre of darkness

const z_item_hand_mace_el = 185 # electric // Булава шока (уровень-3)

const z_item_hand_sharp_ham = 186
	# Острый молот  < атак-эфект нахождения_слабости >. (уровень-3)

const z_item_hand_mace_vial = 187 # Булава-чаша (уровень-5)


const z_item_spec_black_box = 188
	# шит чёрный яшик < дымка > (уровень-1)

const z_item_spec_avenger = 189 # шит мститель

const z_item_spec_bandage = 190 # шит < перевязка > (уровень-1)

const z_item_spec_fence = 191
	# шит забор < анти-зверин > (уровень-2)

const z_item_spec_plate = 192
	# шит светлый лист < мистическая броня > (уровень-3)

const z_item_spec_fire = 193
	# шит агент огня < матрица огня > (уровень-4)

const z_item_spec_famous = 194 # знаменитый
	# Таинственый шит < нормализовать > (уровень-5)


const z_item_2h_blade = 195 # двуруч кладенец (уровень-2)

const z_item_2h_spear = 196 # двуруч пика (уровень-3)

const z_item_bow_archer = 197 # пустой лук (уровень 1)
const z_item_bow_optic = 198 # лук < оптика > (уровень 1)
const z_item_bow_field = 199 # походный лук (уровень 2)
const z_item_bow_whip = 200 # лук < кнут > (уровень 2)
const z_item_bow_shadow = 201 # ночной бомбер (лук уровень 3)
const z_item_bow_elite_slayer = 202 # элитный стрелок (лук уровень 4)
const z_item_bow_multi_shot = 203 # Много-ярусный лук (уровень 5)

const z_item_head_mag = 204 # шапка-ушанка (уровень 1)
const z_item_head_visor = 205 # шлем-визор.. (уровень 2)
const z_item_head_helm = 206 # шлем полководца (уровень 2)
const z_item_head_dark = 207 # тёмный капюшон (уровень 3)
const z_item_head_archer = 208 # шлем наводчика (уровень 3)
const z_item_head_egoist = 209 # шлем эгоиста (уровень 4)


const z_item_body_pirate = 210 # тело Куртка пирата (уровень 1)
const z_item_body_jacket = 211 # тело Кожанка (уровень 1)
const z_item_body_ringmail = 212 # тело Кольчуга (уровень 1)
const z_item_body_shell = 213 # тело Панцирь (уровень 2)
const z_item_body_shell_adv = 214 # тело Продвинутый панцирь (уровень 3)
const z_item_body_manufacturer = 215 # тело Супер-фабрикант (уровень 3)
const z_item_body_masquerade = 216 # тело Хитрый маскарад (уровень 4)
const z_item_body_el_mantle = 217 # тело Электро-мантия (уровень 4)
const z_item_body_m_cocoon = 218 # тело Механический кокон (уровень 5)


const z_item_amul_star = 219 # амулет яркая звезда (уровень 1)
const z_item_amul_shaman = 220 # амулет что-то шаманское (уровень 2)
const z_item_amul_resist = 221 # амулет резиста (уровень 3)
const z_item_amul_bow = 222 # амулет оптимизатор лука (уровень 4)
const z_item_amul_predictor = 223 # амулет предсказателя (уровень 5)


const z_item_boots_normal = 224 # удобные сапоги (уровень-1)
const z_item_boots_fireproof = 225 # огне-стойкие сапоги (уровень-2)
const z_item_boots_wings = 226 # крылатые сапоги (уровень-3)
const z_item_boots_jump = 227 # сапоги Прыгучий бес (уровень 3)
const z_item_boots_regen = 228 # сапоги с регенератором.. (уровень 4)
const z_item_boots_predictor = 229 # сапоги предсказателя (уровень 5)


const z_item_ext_ini = 230 # часы (уровень 1)
const z_item_ext_pioneer = 231 # медаль пионера (уровень 2)
const z_item_ext_bracelet = 232 # браслет (уровень 2)
const z_item_ext_bow_up = 233 # (некий прицел) (уровень 2)
const z_item_ext_hack = 234 # хакер_мистик (уровень 3)
const z_item_ext_mana = 235 # оптимизатор маны (уровень 3)
const z_item_ext_skull = 236 # череп солдата (уровень 4)

const z_item__x1 = 237 # запас
const z_item__x2 = 238 # запас
const z_item__x3 = 239 # запас
const z_item__x4 = 240 # запас


# --- таланты.
# в конец клик-цепочки - теоретически, они могут лежать на земле.

const z_tal_smart_base = 241 # хитрец
const z_tal_smart_mask = 242 # хитрец_маскировка
const z_tal_smart_econom = 243 # хитрец_экономист
const z_tal_smart_hi_x = 244 # запаска для гибкости
const z_tal_smart_hi_z = 245 # запаска

const z_tal_tactic_base = 246 # воевода
const z_tal_tactic_soldier = 247 # воевода_солдат
const z_tal_tactic_partisan = 248 # воевода_партизан
const z_tal_tactic_hi_x = 249
const z_tal_tactic_hi_z = 250

const z_tal_kontrol_base = 251 # контроль
const z_tal_kontrol_agres = 252 # контроль_агресия
const z_tal_kontrol_food = 253 # контроль_питание
const z_tal_kontrol_hi_x = 254
const z_tal_kontrol_hi_z = 255

const z_tal_cirkus_base = 256 # циркач
const z_tal_cirkus_trainer = 257 # циркач_тренер
const z_tal_cirkus_botanist = 258 # циркач_ботаник
const z_tal_cirkus_hi_x = 259
const z_tal_cirkus_hi_z = 260

const z_tal_mystic_base = 261 # мистик
const z_tal_mystic_avenger = 262 # мистик_мститель
const z_tal_mystic_horror = 263 # мистик_кошмар
const z_tal_mystic_hi_x = 264
const z_tal_mystic_hi_z = 265

const z_tal_flame_base = 266 # пламя
const z_tal_flame_archer = 267 # пламя_лучник
const z_tal_flame_pirate = 268 # пламя_пират
const z_tal_flame_hi_x = 269
const z_tal_flame_hi_z = 270


# --- дальшэ, номерки могут идти с прорехами, потому-что
# кончилась _линия_тайлов_под_редактирование.
# Упоминаемые нижэ предметы, не _лежат на земле (схемы этапа).


# --- заклинания (спелы) // не должны лежать на гексах.

const z_sp_kont_normalize = 301 # нормализовать
const z_sp_kont_optic = 302 # оптика

const z_sp_kont_kowardice = 303 # Трусость
const z_sp_kont_wonderful = 304 # Провокация чудес
const z_sp_kont_glue = 305 # Клей

const z_sp_kont_mana_drain = 306 # Мана-провод
const z_sp_kont_wind_funnel = 307 # воздушная воронка
const z_sp_kont_sabotage = 308 # Саботаж

const z_sp_kont_retreat = 309 # Отступление
const z_sp_kont_teleport = 310 # Телепортация


const z_sp_cirk_whip = 311 # чудо-кнут
const z_sp_cirk_smoke = 312 # Дымка

const z_sp_cirk_wonder_wind = 313 # Чудо-ветер
const z_sp_cirk_training = 314 # Тренировка
const z_sp_cirk_fortune_bit = 315 # Капля фортуны

const z_sp_cirk_fire_inspection = 316 # Пожарный контроль
const z_sp_cirk_bees = 317 # Пчёлы
const z_sp_cirk_regeneration = 318 # Регенератор

const z_sp_cirk_anti_kont_smoke = 319 # Облако анти-контроля
const z_sp_cirk_double_blood = 320 # Двойная кровь


const z_sp_myst_bandage = 321 # Перевязка-чинилка
const z_sp_myst_armor = 322 # Мистическая броня

const z_sp_myst_responder = 323 # Авто-ответчик
const z_sp_myst_swap = 324 # Подмена
const z_sp_myst_el_heart = 325 # Электро-сердце

const z_sp_myst_phantom = 326 # Создать фантом
const z_sp_myst_traps = 327 # Мистические капканы
const z_sp_myst_twin = 328 # Мистический двойник

const z_sp_myst_walking_zombi = 329 # Шагаюший зомби
const z_sp_myst_mummy_king = 330 # Король мумий


const z_sp_flam_anti_beast = 331 # Анти-зверин
const z_sp_flam_fire_matrix = 332 # Матрица огня

const z_sp_flam_chaos_mana = 333 # Хаос-мана
const z_sp_flam_sun_ray = 334 # Солнечный лучик
const z_sp_flam_fire_sabres = 335 # Огненые сабли

const z_sp_flam_loser = 336 # Неудачник
const z_sp_flam_el_blaze = 337 # Всесильная молния
const z_sp_flam_burning = 338 # Пожар

const z_sp_flam_destructor = 339 # Уничтожатель
const z_sp_flam_berserk = 340 # Провокация атаки


const z_medal_kont_mag = 341 # _медаль_школы_контроля // техническое
const z_medal_cirk_mag = 342 # _медаль_школы_циркач
const z_medal_myst_mag = 343 # _медаль_школы_мистик
const z_medal_flam_mag = 344 # _медаль_школы_пламя




# --- предметы, которые не должны лежать на гексах.

const z_item_bag_arrow = 351 # стак-предмет _стрела. // болт-стрела
const z_item_bag_herb = 352 # стак-предмет _аптечка // бутыль крови
const z_item_bag_mana = 353 # стак-предмет _мана // нормальная
const z_item_bag_alk_mana = 354 # стак-предмет _мана_самогон.

const z_item__totem_hunter = 355
	#знамя успешной дани. // технический предмет в рюкзак.

const z_item__mark = 356 # Предмет-отметина.


# другие предметы-расходники ...


# --- условные базисы юнитов..

const z_basis_blood = 381 # _кровный
const z_basis_mechanism = 382 # _механизм
const z_basis_elite = 383 # _элита
const z_basis_air_elem = 384 # _элементаль_воздуха
const z_basis_fire_elem = 385 # _элементаль_огня
const z_basis_stone_elem = 386 # _элементаль_земли
const z_basis_water_elem = 387 # _элементаль_воды
const z_basis_dark_elem = 388 # _элеметаль тьмы // _райсы (поднятие битых).
const z_basis_sun_elem = 389 # _элементаль света // для илюзий и фантомов.



# --- Абилки..

const z_ab_general__next = 391
	# (обший-всегда) Следуший боец (закончить ход активного юнита).

const z_ab_general__wait = 392
	# (обший) Ждать.

const z_ab_general__flee = 393
	# (обший) Бежать (Бегство капитанов).

const z_ab_general__port = 394 # surrender mix town_gate.
	# (обший) телепорт_откуп (мирная гавань)

const z_ab_general__defend = 395 # запас (у меня нет постановки в оборону)

const z_ab_captain_self_bless = 396
	# _само_блеск // абилка капитана

const z_ab_captain_fire_bolt = 397
	# _поджыг - личная абилка лучника


const z_ab_set_hand_poison = 401
	# прислуга. абилка - дарить _шанс_отравы_в_ближнем_бою.

const z_ab_self_transformer = 402
	# каменый_страж. Абилка _заземление

const z_ab_create_illusion = 403
	# директор. личная абилка Илюзия (6 маны)

const z_ab_fireball = 404
	# директор. огне-шар на 6 маны

const z_ab_memory = 405
	# директор. техническая абилка _вспомнить_всё (2 маны).

const z_ab_grab_illusion = 406
	# дикий банкир. _обернуть илюзию

const z_ab_pression_line = 407
	# давитель. Абилка(не треба шагов) _линия_давления

const z_ab_servant_action = 408
	# давитель. _десант_прислуги (абилка погрузки-выгрузки)

const z_ab_fear_near6 = 409
	# медведи. _распугать_соседей

const z_ab_call_animals = 410
	# мастер. _призвать_зверей (15 маны)

const z_ab_ice_bolt = 411
	# плакса. абилка _сосулька. (это не выстрел) (1 раунд откат)

const z_ab_storm_wave = 412
	# пегас. _штормовой_полёт # разовая (треба стак пегасов 11+).

const z_ab_wonder_apple = 413 # арлекин. абилка Жуй

const z_ab_motopunk_atk = 414 # мотолом. _мотолом_атака

const z_ab_skeleton_action = 415
	# _действие // без маны и отката - вкл-откл - аля берсерки.

const z_ab_skeleton_atk = 416
	# _удар_физ_или_эл // авто-выбор.. физ-урон или электро-урон.

const z_ab_skull_mana_drain = 417
	# _воровство_маны (без маны, раунд пере-зарядка, линия взгляда).

const z_ab_pull_to_captain = 418
	# ломовая мумия. Абилка _зов_капитана

const z_ab_ghosts_hide = 419
	# Разовая абилка (без маны) _краткая_невидимость на 1 раунд.

const z_ab_star_bird_sparks = 420
	# _электро_искры // ближния атака (плюс авто-отпрыгивание).

const z_ab_self_teleport = 421
	# само-телепорт по всему полю боя (без маны) (откат 1 раунд).

const z_ab_self_dark_whirl = 422
	# тёмный повелитель. абилка тёмная_вертушка

const z_ab_poison_thrower = 423
	# Бросок отравленого топора // стандартная даль-атака.

const z_ab_giant_fire_stream = 424 # Стальной гигант. абилка _струя_огня.
const z_ab_giant_kick = 425 # Стальной гигант. абилка пинок.
const z_ab_giant_push = 426 # Стальной гигант. абилка снос.

const z_ab_harvester = 427
	# _жатва (10 маны, 2 раунда откат) (1 шаг на момент применения).

const z_ab_red_snow = 428 # Королева жатва. абилка Красный снег


# --- попутный атак-эфект

const z_ae_avenger_ice_hand = 431 # _мститель_заморозка == ближний бой
const z_ae_poison_hand = 432 # отравления от сабли == ближний бой
const z_ae_shock_hand = 433 # от булавы // шанс конфузии
const z_ae_weakness_hole = 434 # нахождения_слабости
const z_ae_vampire_fake = 435 # минорный вампир
const z_ae_minor_fear = 436 # _минорное_пугало  // мистик-кошмар
const z_ae_minor_aroma = 437 # фея. _ароматная_пудра (Минорный).
const z_ae_minor_kowardice = 438 # минорная Трусость.
const z_ae_wind_funnel = 439 # пегас. Воздушная воронка
const z_ae_cursed_home = 440 # ломовая мумия. _проклятый_дом



# --- эфекты и пасивки..

const z_ef_el_atk_kickback = 451 # _электро_отдача

const z_ef_el_transfer = 452
	# _электро_проводник = эл-урон не наносит вреда, если рядом ...

const z_ef_el_vigor = 453 # _электро_бодрость // электро-урон лечит.
const z_ef_fire_rage = 454 # _огне_ярость // лечение от огне-урона.

const z_ef_resist_el = 455 # _электро_гаситель // срез электро-урона.

const z_ef19_resist_fire = 456 # анти дымка
	# _плохо_горит = срез, плюс игнор тылового тайла _струя_огня.

const z_ef91_smoke = 457 # _эф_дымка // анти плохо_горит

const z_ef_extra_el_pain = 458 # _электро_уязвимость (электро-урон +50%).

const z_ef_extra_fire_pain = 459 # _уязвим_к_огню (огне-урон +50%).
	# нет возможности игнорить атаку с участием огня.

const z_ef_ignor_extra_area_dmg = 460 # _игнор_тылового_огня

const z_ef_ignor_el = 461 # _игнор_электро
const z_ef_ignor_fire = 462 # _игнор_огня
const z_ef_ignor_poison = 463 # _игнор_яда // игнор навески яда

const z_ef_poison_layer = 464 # эфект яда слоёный

const z_ef_poisoned_mana = 465 # _отравленая_мана

const z_ef_mana_flare = 466 # _вспышка_маны

const z_ef_anti_kont = 467 # _анти_контроль
const z_ef_anti_cirk = 468 # _анти_циркач
const z_ef_anti_myst = 469 # _анти_мистик
const z_ef_anti_flam = 470 # _анти_пламя

const z_ef_anti_fear = 471 # _анти_страх

const z_ef_anger_at_kont = 472 # _гнев_на_контроль
const z_ef_anger_at_cirk = 473 # _гнев_на_циркач
const z_ef_anger_at_myst = 474 # _гнев_на_мистик
const z_ef_anger_at_flam = 475 # _гнев_на_пламя

const z_ef18_confusion = 476 # _конфузия
const z_ef81_eclipse = 477 # _затмение_замыкание

const z_ef_retribution = 478 # _чистая_месть // от таланта мстителя
	# месть и огонь могут работать вместе.
const z_ef_fire_matrix = 479 # _матрица_огня

const z_ef_silence = 480 # _блокировать_создание_заклинаний // молчанка.
const z_ef_smart_mask = 481 # _стабил_эф__хитрец_маскировка
const z_ef_blocking_flight = 482 # _блокировать_полёт

const z_ef_envier_hat_hater = 483 # _шапко_закидательство
	# Урон выстрела будет удвоен, если целевой стак меньшэ, вдвое.

const z_ef_wrench = 484 # _гаечный_ключ
const z_ef_deprived = 485 # _обделили

const z_ef17_fragility = 486 # _хрупкость
const z_ef71_breakers_of_fragile = 487 # _ломатели_хрупких

const z_ef_anchor = 488 # _якорь // слегка тормозит лодку-отряд.

const z_ef_prevents_wonders = 489 # _мешает_чудесам
const z_ef_statue_on_death = 490 # _статуя_при_смерти
const z_ef_fang_for_gold = 491 # _волчье_золото
const z_ef_vampiric_tax = 492 # _налог_вампирство
const z_ef_ignor_bow_atk = 493 # _игнорит_даль_атаку (выстрел или заклин)
const z_ef_trick_on_death = 494 # _обман_при_смерти

const z_ef_boom6_on_death = 495
	# _взрыв_соседям_при_смерти # у арлекина, и у его коробки

const z_ef_zoo_feeding = 496 # _зоопарк // кормёжка // медведь

const z_ef_flee_behavior = 497 # _сбежать_из_битвы.

const z_ef_two_tears = 498
	# _две_слезы == _водная_электро_уязвимость и фактор спец-атаки.

const z_ef_min_dmg_as_stak = 499
	# _мин_урон_как_стак // если не было промаха.



const z_ef_otvet__step_back = 500 # _уход_вместо_ответки
const z_ef_otvet__stream_or_kick = 501 # _струя_или_пинок_в_ответ
const z_ef_otvet__el_ring_any = 502 # _эл_контр_удар_всех_соседей.
const z_ef_otvet__always_crit = 503 # _всегда_крит_ответка (двойной урон).

const z_ef_link_alter_unit = 504
	# _юнит_с_альтэр_юнитом (на коробку или на гроб).

const z_ef_war_sun_only = 505 # _не_активность_в_тени
const z_ef_war_dark_only = 506 # _не_активность_на_свету

const z_ef_wide_sense = 507 # _восприятие (шырокое восприятие)

const z_ef_ignor_obstacle_for_bow = 508
	# _игнор_помех_выстрелам # в радиусе 5 клеток.

const z_ef_terrible_aura6 = 509 # _аура_ужасного_соседа.

const z_ef_invisible_observer = 510
	# _невидимый_наблюдатель // разведка невидимая (на схеме этапа).

const z_ef_not_a_picker = 511
	# _не_собиратель // нельзя подбирать предметы (везде).

const z_ef_none_home = 512 # _нет_домика_этих_юнитов
const z_ef_bandage_tail = 513 # _хвост_бинтов
const z_ef_wind_reaction = 514 # _реакция_на_ветер # вредный штрих.

const z_ef_beast_vampire = 515 # _звериное_вампирство
const z_ef_beast_defender = 516 # _зверская_оборона
const z_ef_beast_runup = 517 # _звериный_разгон
const z_ef_animals_list = 518 # _находимся_в_списке_зверей

const z_ef16_flam_anti_beast = 519 # _анти_зверин // анти зверо-зомби
const z_ef61_zombi_beast = 520 # _зверо_зомби // от Шагаюший зомби

const z_ef_unlucky_start = 521 # _неудачный_старт
	# Проклятый статус атаки, и проваленый показатель удачи.

const z_ef_ignor99_wonders = 522 # _максимально_вероятный_игнор_чудес.

const z_ef_under_cover = 523 # _под_шумок
const z_ef_avoid_an_atk = 524 # _спрятался_от_атаки # ближней или дальней.
const z_ef_axeman_product = 525 # _добыча_лесорубов (техническая засечка).

const z_ef_lucky_heal = 526 # _полная_отлечка_в_начале_раунда

const z_ef_growing_armor = 527 # _жывая_броня

const z_ef_fire_jump = 528 # _огне_прыжок
const z_ef_wild_agility = 529 # _дикая_сноровка
const z_ef_gifts_for_queen = 530 # _подарки_для_королевы
const z_ef_side_by_side = 531 # _плечо_союзника

const z_ef15_blind = 532 # ослеп
const z_ef51_kont_optic = 533 # оптика

const z_ef_kowardice = 534 # эфект_трусость
const z_ef_kont_glue = 535 # эфект_клей

const z_ef_wind_funnel_targ = 536 # эфект_жэртва_вихря
const z_ef_kont_sabotage = 537 # эфект_саботаж

const z_ef14_giant_muscle = 538 # _мышцы_силача
const z_ef41_double_blood = 539 # _двойная_кровь

const z_ef_regenerator = 540 # эф_регенератор

const z_ef_myst_responder = 541 # эф_авто_ответчик
const z_ef_myst_armor = 542 # эф_мистическая_броня
const z_ef_myst_twin = 543 # эф_мистический_двойник

const z_ef13_berserk_any = 544 # Провокация атаки.
const z_ef31_kont_wonderful = 545 # Провокация чудес.


# --- Если будут нужны класичные чит-эфекты,
# учитывая, что в изначальном бреде, такие эфекты иначе задуманы.

const z_ef12_bless = 546 # эф_блеск
const z_ef21_curse = 547 # эф_проклят

const z_ef_max_luck = 548 # эф_макс_удача
const z_ef_min_luck = 549 # эф_мин_удача
const z_ef_max_morale = 550 # эф_макс_мораль
const z_ef_min_morale = 551 # эф_мин_мораль

const z_ef_waiting = 552 # ожыдание
const z_ef_defend = 553 # оборона
const z_ef_defender = 554 # доп-оборона

# ---
const z_ef_first_strike = 555 # _перво_удар
const z_ef_flight = 556 # _полёт

const z_ef_ignor_bon = 557 # _без_подачек // игнор бонусов
const z_ef_ignor_neg = 558 # _игнор_негатива # блокир. плохих заклятий
const z_ef_ignor_morale = 559 # _игнор_морали

const z_ef_atk_none_hand = 560 # _нет_стандартной_ближней_атаки
const z_ef_atk_none_otvet = 561 # _атака_без_ответа
const z_ef_atk_long_hand = 562 # _атака_через_гекс
const z_ef_atk_wide_hand = 563 # _атака_2_соседа
const z_ef_atk_repeat_hand = 564 # _двойная_атака_ближнего_боя



# --- рецепты строительства зданий..

const z_build_kont_m1 = 601 # рецепт стройки школы
const z_build_kont_m2 = 602
const z_build_kont_m3 = 603
const z_build_kont_m4 = 604
const z_build_kont_m5 = 605 # купол школы

const z_build_cirk_m1 = 606
const z_build_cirk_m2 = 607
const z_build_cirk_m3 = 608
const z_build_cirk_m4 = 609
const z_build_cirk_m5 = 610

const z_build_myst_m1 = 611
const z_build_myst_m2 = 612
const z_build_myst_m3 = 613
const z_build_myst_m4 = 614
const z_build_myst_m5 = 615

const z_build_flam_m1 = 616
const z_build_flam_m2 = 617
const z_build_flam_m3 = 618
const z_build_flam_m4 = 619
const z_build_flam_m5 = 620


const z_build_kont_u1 = 621 # рецепт стройки домика слабого солдатика
const z_build_kont_u2 = 622

const z_build_kont_u34 = 623 # суб-подряд
const z_build_kont_u3 = 624
const z_build_kont_u4 = 625

const z_build_kont_u56 = 626
const z_build_kont_u5 = 627
const z_build_kont_u6 = 628

const z_build_kont_u78 = 629
const z_build_kont_u7 = 630
const z_build_kont_u8 = 631


const z_build_cirk_u1 = 632
const z_build_cirk_u2 = 633

const z_build_cirk_u34 = 634
const z_build_cirk_u3 = 635
const z_build_cirk_u4 = 636

const z_build_cirk_u56 = 637
const z_build_cirk_u5 = 638
const z_build_cirk_u6 = 639

const z_build_cirk_u78 = 640
const z_build_cirk_u7 = 641
const z_build_cirk_u8 = 642


const z_build_myst_u1 = 643
const z_build_myst_u2 = 644

const z_build_myst_u34 = 645
const z_build_myst_u3 = 646
const z_build_myst_u4 = 647

const z_build_myst_u56 = 648
const z_build_myst_u5 = 649
const z_build_myst_u6 = 650

const z_build_myst_u78 = 651
const z_build_myst_u7 = 652
const z_build_myst_u8 = 653


const z_build_flam_u1 = 654
const z_build_flam_u2 = 655

const z_build_flam_u34 = 656
const z_build_flam_u3 = 657
const z_build_flam_u4 = 658

const z_build_flam_u56 = 659
const z_build_flam_u5 = 660
const z_build_flam_u6 = 661

const z_build_flam_u78 = 662
const z_build_flam_u7 = 663
const z_build_flam_u8 = 664


const z_build_kont_dungeon = 665
const z_build_kont_sugar_ext = 666
const z_build_kont_x = 667

const z_build_cirk_b_market = 668
const z_build_cirk_x = 669 # запаска для равности
const z_build_cirk_z = 670

const z_build_myst_exp_bank = 671 # банк опыта // либерализм (мистики)
const z_build_myst_tele_tower = 672
const z_build_myst_x = 673

const z_build_flam_eternal = 674
const z_build_flam_park = 675
const z_build_flam_mega_forge = 676


const z_build__town_main_up1 = 677
const z_build__town_main_up2 = 678

const z_build__town_wall_up1 = 679
const z_build__town_wall_up2 = 680

const z_build__gar_tower = 681 # допустим, стройка и апгрэйд одинаковы.

const z_build__tavern = 682


# +  рецепты предметов ...

# + предметы-мусорные (для квэстов и крафта) (из коробок, из мобов).


# --- пасивки-приоритеты для авто-пилота..
# _меньшэ_движухи = 801
# _не_отступать
# _бить_стрельцов



# ---
const dmg_mode__cursed = 1
const dmg_mode__norma = 2
const dmg_mode__bless = 3
const dmg_mode__dbl = 4


# ---
const targ_vers__self = 1
const targ_vers__area = 2
const targ_vers__all = 3
const targ_vers__boat = 4 # на сжатый отряд (схема этапа)
const targ_vers__enemy = 5
const targ_vers__en_captains = 6
const targ_vers__en_soldiers = 7
const targ_vers__union = 8
const targ_vers__un_captains = 9
const targ_vers__un_soldiers = 10

const spec_or_dead__now_action = 21
const spec_or_dead__now_wait = 22
const spec_or_dead__now_dead = 23


# ---
const type_boat = 1
const type_baner_side = 2
const type_basis = 3

const type_dom = 4
const type_dom_town_main = 5 # ратуша

# type_dom_town_kont == unit.klan as klan_kont

const type_mine_std = 6 # стандартная шахта // rood, sol
const type_mine_alt = 7 # альтэрнатив-шахта // wood, sugar

const type_gift = 8

const type_trig = 9 # тригер
const type_trig_signal = 10
const type_trig_sens = 11
const type_trig_spawn = 12

const type_unit = 13
const type_unit_war = 14 # особый юнит, на поле боя.

const type_item = 15 # item_bag
const type_item_eq = 16

const type_talant = 17
const type_spell = 18 # заклинание.
const type_abil = 19 # абилка (личное заклинание юнита).
const type_atk_ef = 20 # попутка атаки.
const type_efekt = 21 # пасивка, бонус, негатив.

const type_build = 22 # рецепт постройки.
const type_auto_prior = 23 # приоритет для авто-пилота.


const type_dom_mag_x = 41 # школа чудес
const type_dom_unit_x = 42 # домик солдатиков


#end_zag



# ---

const m2_stabil_last = 10

const unit_m_box_hide_first = 9 # 1 to 8 as selected spells.
var unit_m_box_tail_first := 0 # отбрасывание заклинаний в конец.
const unit_m_box_last = 40


# --- слоты экипировки..

const m2_eq_hand = 1 # unit.eq_to = m2_eq_hand; // рука орудия.
const m2_eq_spec = 2 # рука со шитом ...
const m2_eq_head = 3 # голова
const m2_eq_body = 4 # тело
const m2_eq_amul = 5
const m2_eq_boots = 6
const m2_eq_p_first = 7 # карман первый
const m2_eq_p_last = 10
const m2_eq_last = 10 # 10-ая пара (номер, уник).

# Конечно, достаточно номера заготовки (z_item_hand_torch).
# Хотя, если делать случийную поправку свойствам, то с одной
# заготовки можт быть разный шмот - линковка на реальный предмет,
# вместо указания на таблицу заготовок, а значит надо Уник,
# поэтому m2_


# --- микс-масив (рюкзак, позитивы, негативы)

const m2_bag3_bag_last = m2_eq_last; # рюкзак-часть сумки, как экипировка.
	# возможно, здесь авто-пилотные предметы-приоры для солдатов,
	# аля _меньшэ_движухи. У капитанов, которые заново созданы
	# на поле боя, будет пустой рюкзак - для приоритетов поведения.

const m2_bag3_last = m2_eq_last * 3; # столько пар в трёх частях сумки.


const m2_bag3_boat_first = 1 # в лодке, поверх рюкзака.
const m2_bag3_boat_last = 9
const m2_bag3_boat_war_first = m2_bag3_boat_first
const m2_bag3_boat_war_last = 6   # 6 боевых мест.
const m2_bag3_boat_hide_first = 7 # трюм-слоты.
const m2_bag3_boat_hide_last = m2_bag3_boat_last


	# У капитанов, на схеме этапа, почти нет бонусов, а если будут,
	# то считать их _предметами в рюкзаке, поэтому все 3 части
	# можно использовать под предметы.
	# Но для поля боя, надо разметить две доп-части.
const m2_bag3_bon_first = m2_bag3_bag_last +1 # с какого места - бонусы.
const m2_bag3_neg_first = m2_bag3_bon_first + m2_bag3_bag_last
const m2_bag3_ext_first = m2_bag3_bon_first

const m2_bag3_bon_last = m2_bag3_neg_first -1;
const m2_bag3_neg_last = m2_bag3_last;
const m2_bag3_ext_last = m2_bag3_last;



# ---

const z_second = 2 # тэстовый номерок - место в таблице.


#warning-ignore:UNUSED_CLASS_VARIABLE
var name_lang_fold = "ru" # "en"
#var name_lang_fold = "en"
# Сразу после смены языка, нужно заново вызвать load_zag_tab





#extends Node



#var t_unit = load( "t_unit.gd") # грузим _схему_свойств
const t_unit = preload( "t_unit.gd")

const t_kle = preload( "t_kle.gd")
const t_kle2 = preload( "t_kle2.gd")



const m_z_last = 820 # количество мест на складе (в таблице).
var m_z = [] # квиток универсального масива (название таблицы).

var format_name_zag_bin = "res://zag/%d"
var format_name_zag_h = "res://zag/%d.h"

var format_name_zag_lang = "res://zag/%s/%d.txt"  # "user://..."



const m2_tst_last = 3 # но масив будет в два раза большэ + запас.
var m2_tst = []



# ---
var w_m_k2 = [] # war_m_kle2[] // квиток масива клеток для поля боя.

const w_m_k2__xt = 16 #var w_m_k2__xt := 0
const w_m_k2__yt = 16 #var w_m_k2__yt := 0

var w_m_k2__len := 0 # status  # do not use  w_m_k2.size

#var w_m_k2__last_line := w_m_k2__yt - 1



# ---
var e_m_k = [] # etap_m_kle[] // квиток масива клеток для схемы этапа.

var e_m_k__xt := 0
var e_m_k__yt := 0
var e_m_k__len := 0 # status  # do not use  e_m_k.size




# - - - - - -

func m2_new_size( m, m2_name_last_: int):
	m.resize( m2_name_last_ * 2 +2)  # +2 запас( 0, 1)


func m2_get_x( m, n: int):
	if n < 1: return -1
	if m.size() < 1: return -1
	var i: int = n * 2
	if i >= m.size(): return -1
	return m[ i]

func m2_get_y( m, n: int):
	if n < 1: return -1
	if m.size() < 1: return -1
	var i: int = n * 2
	if i >= m.size(): return -1
	return m[ i +1]


func m2_set_x( m, n: int, val):
	if n < 1: return -1
	if m.size() < 1: return -1
	var i: int = n * 2
	if i >= m.size(): return -1
	m[ i] = val
	return m[ i]

func m2_set_y( m, n: int, val):
	if n < 1: return -1
	if m.size() < 1: return -1
	var i: int = n * 2
	if i >= m.size(): return -1
	m[ i +1] = val
	return m[ i +1]


func t_unit_new():
	var u = t_unit.new()
	m2_new_size( u.m2_stabil, m2_stabil_last)
	m2_new_size( u.m2_eq, m2_eq_last)
	m2_new_size( u.m2_bag3, m2_bag3_last)
	u.m_box.resize( unit_m_box_last +1)
	return u


# - - - - - -
var val__next_bin := 0

# функция чтения очередной строки файла, как числа, в начале строки.
func val__next( from_file) -> int: # val__from_file_next_line
	if from_file.eof_reached():
		return -1 # error

	if val__next_bin:
		return from_file.get_32()

	var a = from_file.get_line()
	var b = a.find( " //") #34 // prop_hint # result is 2
	if b < 1:
		return -1 # error
	var d = a.substr( 0, b)
	return d.to_int()


func load_zag_tab__next_item_name( k):
	var f = File.new()
	var fn = format_name_zag_lang % [ name_lang_fold, k]
	f.open( fn, f.READ)
	if f.is_open():
		m_z[ k].name = f.get_line()


func load_zag_tab__next_item( u, f): # ( t_unit u, File f)
	#if u.type != 0:
	#	return;

	u.uniq = val__next( f)
	u.nom_base = val__next( f)
	#u.uniq = -(u.nom_base)

	u.type = val__next( f)
	u.active = val__next( f)
	u.auto_start = val__next( f)
	u.active_b = val__next( f)
	u.event_q = val__next( f)
	u.wait_full = val__next( f)
	u.wait_now = val__next( f)
	u.wait_cd_full = val__next( f)
	u.wait_cd_now = val__next( f)
	u.trig_off_after_wait = val__next( f)
	u.nx = val__next( f)
	u.n1 = val__next( f)
	u.n2 = val__next( f)
	u.n3 = val__next( f)
	u.bank_now = val__next( f)
	u.bank_max = val__next( f)
	u.bank_ext = val__next( f)
	u.radius = val__next( f)
	u.test_hit_points = val__next( f)
	u.game_easy_obj = val__next( f)
	u.baner = val__next( f)
	u.klan = val__next( f)
	u.bind1 = val__next( f)
	u.stak_alone = val__next( f)
	u.stak_one_or_minimal = val__next( f)
	u.eq_to = val__next( f)
	u.eq_to_ext = val__next( f)
	u.use_in_war = val__next( f)
	u.use_hero_rang = val__next( f)
	u.use_tal_index = val__next( f)
	u.use_tal_need_lvl = val__next( f)
	u.gold_sell = val__next( f)
	u.gold_shop = val__next( f)
	u.res_wood = val__next( f)
	u.res_rood = val__next( f)
	u.res_sol = val__next( f)
	u.res_sah = val__next( f)
	u.res_ser = val__next( f)
	u.res_gas = val__next( f)
	u.level_now = val__next( f)
	u.level_exp_now = val__next( f)
	u.level_exp_next = val__next( f)
	u.spec_or_dead = val__next( f)
	u.kle1 = val__next( f)
	u.kle2 = val__next( f)
	u.kle3 = val__next( f)
	u.steps_now = val__next( f)
	u.steps_max = val__next( f)
	u.steps_ext = val__next( f)
	u.hp_top = val__next( f)
	u.hp_unit = val__next( f)
	u.hp_unit_start = val__next( f)
	u.dmg_min = val__next( f)
	u.dmg_max = val__next( f)
	u.dmg_mode = val__next( f)
	u.rate_dist = val__next( f)
	u.rate_dist_sh = val__next( f)
	u.rate_dist_ext = val__next( f)
	u.rate_hand = val__next( f)
	u.rate_hand_sh = val__next( f)
	u.rate_hand_ext = val__next( f)
	u.anti_dist = val__next( f)
	u.anti_dist_sh = val__next( f)
	u.anti_dist_ext = val__next( f)
	u.anti_hand = val__next( f)
	u.anti_hand_sh = val__next( f)
	u.anti_hand_ext = val__next( f)
	u.anti_mag = val__next( f)
	u.anti_mag_sh = val__next( f)
	u.anti_mag_ext = val__next( f)
	u.ignor_bon = val__next( f)
	u.ignor_neg = val__next( f)
	u.ini = val__next( f)
	u.ini_sh = val__next( f)
	u.ini_ext = val__next( f)
	u.luck = val__next( f)
	u.moral = val__next( f)
	u.moral_good_event = val__next( f)
	u.moral_bad_event = val__next( f)
	u.mana = val__next( f)
	u.mana_full = val__next( f)
	u.bolt = val__next( f)
	u.bolt_full = val__next( f)
	u.atk_q = val__next( f)
	u.atk_back_q = val__next( f)
	u.atk_back_q_max = val__next( f)
	u.atk_suport = val__next( f)
	u.atk_long_hand = val__next( f)
	u.basis1 = val__next( f)
	u.basis2 = val__next( f)
	u.basis2_perc = val__next( f)
	u.vis_name_index = val__next( f)
	u.vis_bank = val__next( f)
	u.vis_inst = val__next( f)
	u.ab__dekor = val__next( f)
	u.ab__is_minor = val__next( f)
	u.ab__need_steps_for_use = val__next( f)
	u.ab__need_ray_targ = val__next( f)
	u.ab__targ_vers = val__next( f)
	u.ab__dist_min = val__next( f)
	u.ab__dist_min_err_perc = val__next( f)
	u.ab__dist_max = val__next( f)
	u.ab__dist_max_err_perc = val__next( f)
	u.ab__area_type = val__next( f)
	u.ab__area_tiles = val__next( f)
	u.ef_prior = val__next( f)
	u.ef_part = val__next( f)
	u.ef_blocked_by_ef = val__next( f)
	u.ef_replace_ef = val__next( f)
	u.ef_0_from_clearing = val__next( f)
	u.ef_0_from_damage = val__next( f)
	u.ef_0_from_starting_mask = val__next( f)
	u.ef_0_from_unit_death = val__next( f)
	u.ef__evt_on_start = val__next( f)
	u.ef__evt_on_reset = val__next( f)
	u.ef__evt_on_end = val__next( f)
	u.ef_starting_layers = val__next( f)
	u.ef_layers_pack_add = val__next( f)
	u.ef_tik_type = val__next( f)
	u.ef_tik_rate = val__next( f)
	u.ef_tik_klv = val__next( f)
	u.ef_tik_skip1 = val__next( f)
	u.ef_tik_progres = val__next( f)
	u.ef_tik_layer_mult = val__next( f)
	u.zap1 = val__next( f)
	u.zap2 = val__next( f)
	u.zap3 = val__next( f)
	u.zap4 = val__next( f)
	u.zap5 = val__next( f)
	m2_set_x( u.m2_stabil, 1, val__next( f))
	m2_set_y( u.m2_stabil, 1, val__next( f))
	m2_set_x( u.m2_stabil, 2, val__next( f))
	m2_set_y( u.m2_stabil, 2, val__next( f))
	m2_set_x( u.m2_stabil, 3, val__next( f))
	m2_set_y( u.m2_stabil, 3, val__next( f))
	m2_set_x( u.m2_stabil, 4, val__next( f))
	m2_set_y( u.m2_stabil, 4, val__next( f))
	m2_set_x( u.m2_stabil, 5, val__next( f))
	m2_set_y( u.m2_stabil, 5, val__next( f))
	m2_set_x( u.m2_stabil, 6, val__next( f))
	m2_set_y( u.m2_stabil, 6, val__next( f))
	m2_set_x( u.m2_stabil, 7, val__next( f))
	m2_set_y( u.m2_stabil, 7, val__next( f))
	m2_set_x( u.m2_stabil, 8, val__next( f))
	m2_set_y( u.m2_stabil, 8, val__next( f))
	m2_set_x( u.m2_stabil, 9, val__next( f))
	m2_set_y( u.m2_stabil, 9, val__next( f))
	m2_set_x( u.m2_stabil, 10, val__next( f))
	m2_set_y( u.m2_stabil, 10, val__next( f))

	if val__next_bin:
		var ln = f.get_32()
		var buf = f.get_buffer( ln) # PoolByteArray
		u.name = buf.get_string_from_ascii();
	else:
		u.name = f.get_line() # default




func load_zag_tab():
	var file = File.new()
	var q = 0;
	for k in range( 1, m_z_last +1):
		m_z[ k] = t_unit_new()
		m_z[ k].type = 0 # empty

		var name = format_name_zag_bin % k
		file.open( name, file.READ)
		val__next_bin = 1
		if ! file.is_open():
			name = format_name_zag_h % k
			file.open( name, file.READ)
			val__next_bin = 0
			if ! file.is_open():
				#file.close()
				continue # k

		load_zag_tab__next_item( m_z[ k], file)
		load_zag_tab__next_item_name( k)
		q += 1
		file.close()
	# for k
	return q





# --- Гексо-поле (моё) это норм поле, только каждая вторая линия имеет
# левый борт из двух ячеек, и рисуется со сдвигом на пол-ячейки ...

# Передвижения зависят от того в сдвинутой-ли строке юнит ...

const HexMap_Move1 = 1 # константы актуальны, хотя можно их заменить
const HexMap_Move3 = 3 # на аналогичные из набора.. HexKle_Dir01
const HexMap_Move5 = 5
const HexMap_Move7 = 7
const HexMap_Move9 = 9
const HexMap_Move11 = 11


# Направление - можно 12 штук сделать, вместо 6.
# 12 направлений - это точные отрезки на центры всех клеток 2-го пояса.
# 6 из этих направлений повторяют направ на центры клеток 1-го пояса.
# Шаг направления = 30 градусов.

const HexKle_InitMetka = 255 # иница - означает _не_тронутость.

const HexKle_MaxDist = 16 # 15

const HexKle_Dir01 = 1 # 1 час
const HexKle_Dir02 = 2 # 2 часа // Второй пояс.
const HexKle_Dir03 = 3 # 3 часа // Актуальны все константы аля HexMap_Move3
const HexKle_Dir04 = 4
const HexKle_Dir05 = 5
const HexKle_Dir06 = 6
const HexKle_Dir07 = 7
const HexKle_Dir08 = 8
const HexKle_Dir09 = 9
const HexKle_Dir10 = 10
const HexKle_Dir11 = 11
const HexKle_Dir12 = 12
const HexKle_DirKlvFrom1 = 12




func tram( val: int, min_res: int, max_res: int): # clamp_int
	if val < min_res: return min_res
	if val > max_res: return max_res
	return val


# len == locked word // use ln
func out( h: int, ln: int):
	if h < 0: return 1
	if ln < 1: return 1
	if h >= ln: return 1
	return 0



func kle__is_left_bort( h: int, ln: int, xt: int):
	if out( h, ln): return 0
	if ! (h % xt): return 1
	if (h % (xt * 2)) == (xt + 1): return 1
	return 0

func kle__is_rit_bort( h: int, ln: int, xt: int):
	if out( h, ln): return 0
	if (h % xt) == (xt - 1): return 1 # правая стенка
	return 0

func kle__is_top_bort( h: int, ln: int, xt: int):
	if out( h, ln): return 0
	if h < xt: return 1
	return 0

func kle__is_btm_bort( h: int, ln: int, xt: int):
	if out( h, ln): return 0
	if h >= (ln - xt): return 1
	return 0

func kle__is_any_border( h: int, m, ln: int):
	if out( h, ln): return 0
	if m[ h].orig_land == land__border: return 1
	if m[ h].orig_land == 0 : return 1
	return 0


func kle__restore_bort( val: int, tex: int, m, ln: int, xt: int):
	for h in range( 0, ln): # print default border
		if kle__is_left_bort( h, ln, xt):
			m[ h].init( val, tex)
		elif kle__is_rit_bort(h, ln, xt):
			m[ h].init( val, tex)
		elif kle__is_top_bort(h, ln, xt):
			m[ h].init( val, tex)
		elif kle__is_btm_bort(h, ln, xt):
			m[ h].init( val, tex)


func h_ok_abs( h: int, ln: int, xt: int): # only default borders
	if h < 0: return 0
	if ln < 1: return 0
	if h >= ln: return 0
	
	if kle__is_left_bort( h, ln, xt):
		return 0
	elif kle__is_rit_bort(h, ln, xt):
		return 0
	elif kle__is_top_bort(h, ln, xt):
		return 0
	elif kle__is_btm_bort(h, ln, xt):
		return 0
	return 1


func h_ok( h: int, m, ln: int): # use after __clear
	if h < 0: return 0
	if ln < 1: return 0
	#if ln > m.size(): return 0
	if h >= ln: return 0
	if m[ h].orig_land == land__border: return 0
	if m[ h].orig_land == 0 : return 0 # not init land type
	return 1



#func kle__clear( m, ln: int, xt: int, def_land: int = land__grass):
func kle__clear( m, ln: int, xt: int):
	if ln < 1:
		return
	if ln > m.size():
		return
	for i in range( 0, ln):
		m[ i].clear_all() # m[ i].clear_all( def_land)
	# xt == line_len == x_tiles
	var default_border_tex := 1
	kle__restore_bort( land__border, default_border_tex, m, ln, xt)
	# минимальный борт обязателен.


func kle__clear_vis_ext( m, ln: int):
	if ln < 1:
		return
	if ln > m.size():
		return
	for i in range( 0, ln):
		m[ i].vis_ext = 0



#int t_HexPole::Ych_Get(int h)
func h_get_orig( h: int, m, ln: int):
	if h < 0: return land__border # -1
	if h >= ln: return land__border
	return m[ h].orig_land


#void t_HexPole::Ych_Set(int h, int LandInd)
func h_set_orig( h: int, m, ln: int, xt: int, val):
	if ! h_ok_abs(  h, ln, xt): return
	m[ h].orig_land = val



#BYTE t_HexPole::YchB_Get(int h)
func kle__get_vis_ext( m, ln: int, h: int):
	if h < 0: return 0;
	if h >= ln: return 0;
	return m[ h].vis_ext

#YchB_Set(int h, BYTE Ind)
func kle__set_vis_ext( m, ln: int, h: int, val):
	if h < 0: return;
	if h >= ln: return;
	m[ h].vis_ext = val



#//int t_HexPole::TryPoleBytesFrom(int staYch = 0, BYTE needFlag = 1)
func kle__try_vis_ext( m, ln: int, sta: int, needFlag):
	if ln < 1:
		return land__border # -1
	if ln > m.size():
		return land__border
	if sta < 0:
		sta = 0
	for i in range( sta, ln):
		if m[ i].vis_ext == needFlag:
			return i
	return land__border # не нашли


# ---------

# Получить офсет клетки из пересечения двух номерков
# ВНИМАНИЕ.. подавать номерки, начиная с Единицы.
#// int NomFrom2( int xTileFr1, int zTileFr1)

func NomFrom2( x_tile_fr1: int, y_tile_fr1: int, xt: int, yt: int):
	if x_tile_fr1 < 1: return -1
	if x_tile_fr1 > xt: return -1

	if y_tile_fr1 < 1: return -1
	if y_tile_fr1 > yt: return -1

	var h := 0
	h = (y_tile_fr1 - 1) * xt + (x_tile_fr1 - 1);
	#if(KleOut( h, 0)) return -1;
	return h

# офсет клетки перевести в два офсета ...
#	xtFr0 = hFr0 % tiles_in_line # xt.
#	ztFr0 = hFr0 / tiles_in_line # сколько полных линий уместилось.




# ---------

#void t_HexPole::Ych_MutNear6(int y)



#//int t_HexPole::Ych_Near6(int k, int y2)
func kle__h_near6( h: int,  h2: int,  m, ln: int, xt: int):
	# является-ли ячейка "h2" соседней к центр-ячейке "h" ?

	#
	if h == h2: return 0 # клетка о самой себе ...
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0

	# xt // сколько клеток в строке.

	var spe := 0 # амортизатор сдвига строк
	if ( h % (xt * 2)) > (xt - 1): # // transX -= (kleW*0.5f);
		spe = -1 # центральная клетка находится в сдвинутой строке.
	else:
		spe = 1

	# выдать направления..
	if h - 1 == h2: return HexMap_Move9 #// 9 часов = соседняя слева.
	if h + 1 == h2: return HexMap_Move3

	if h - xt == h2:
		if spe < 0:
			return HexMap_Move1
		else:
			return HexMap_Move11

	if h + xt == h2:
		if spe < 0:
			return HexMap_Move5
		else:
			return HexMap_Move7

	if h - xt + spe == h2:
		if spe < 0:
			return HexMap_Move11
		else:
			return HexMap_Move1

	if h + xt + spe == h2:
		if spe < 0:
			return HexMap_Move7
		else:
			return HexMap_Move5

	return 0






# int t_HexPole::Ych_Dist_wh44k( int k, int y2)

func w_m_k2__h_dist( h: int, h2: int):
	#
	if h == h2: return 0 # клетка о самой себе ...
	if h_get_orig( h, w_m_k2, w_m_k2__len) == land__border: return 0
	if h_get_orig( h2, w_m_k2, w_m_k2__len) == land__border: return 0
	
	return w_m_k2[ h].b_dist[ h2]


func w_m_k2__h_dir2( h: int, h2: int):
	#
	if h == h2: return 0 # клетка о самой себе ...
	if h_get_orig( h, w_m_k2, w_m_k2__len) == land__border: return 0
	if h_get_orig( h2, w_m_k2, w_m_k2__len) == land__border: return 0
	
	return w_m_k2[ h].b_dir2[ h2]



# int t_HexPole::Ych_Near6_wh44k( int k, int y2)

func w_m_k2__h_near6( h: int, h2: int):
	if w_m_k2__h_dist( h, h2) == 1:
		return w_m_k2[ h].b_dir2[ h2] # return w_m_k2__h_dir2( h, h2)
	return 0


# -------




# int t_HexPole::Ych_NearLeft3Hex(int yCentr, int y2)
func kle__near_left_3( h: int,  h2: int,  m, ln: int,  xt: int):
	# h == centr
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0
	
	if ( h % (xt * 2)) > (xt - 1): # transX -= (kleW*0.5f);
		if (h - xt - 1) == h2: return 1
		if (h + xt - 1) == h2: return 1
		if (h - 1) == h2: return 1
		# spe1 = -1;
	else:
		if (h - xt) == h2: return 1
		if (h + xt) == h2: return 1
		if (h - 1) == h2: return 1
	return 0;


# int t_HexPole::Ych_NearRit3Hex(int yCentr, int y2)
func kle__near_rit_3( h: int,  h2: int,  m, ln: int,  xt: int):
	# h == centr
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0
	
	if ( h % (xt * 2)) > (xt - 1): # transX -= (kleW*0.5f);
		if (h - xt) == h2: return 1
		if (h + xt) == h2: return 1
		if (h + 1) == h2: return 1
	else:
		if (h - xt + 1) == h2: return 1
		if (h + xt + 1) == h2: return 1
		if (h + 1) == h2: return 1
		# spe1 = 1;
	return 0;





func kle__in_priv(h: int, h2: int, m, ln: int,xt: int,yt: int, skip, one, mult, a, b):
	# h == centr
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0

	for i in range( 0, yt): #// строки
	#{
		if ( h % (xt * 2)) > (xt - 1): # transX -= (kleW*0.5f);
			h = h + (mult * xt) + a;
		else:
			h = h + (mult * xt) + b;
		#
		if h_get_orig( h, m, ln) == land__border:
			return 0
		#
		if skip < 1:
		#{
			if one:
				if h == h2:
					return 1
				else:
					return 0
			elif h == h2:
				return 1
		#}
		else:
			skip -= 1;
	#}
	return 0


# int t_HexPole::Ych_inRitUpLine(int yCentr, int y2, int skipKlv =0, int one =0)
func kle__in_rit_up_line( h: int, h2: int, m, ln: int, xt: int, yt: int, skip, one):
	return kle__in_priv( h, h2, m, ln, xt, yt, skip, one, -1, 0, 1)


# int t_HexPole::Ych_inRitDnLine(int yCentr, int y2, int skipKlv =0, int one =0)
func kle__in_rit_dn_line( h: int, h2: int, m, ln: int, xt: int, yt: int, skip, one):
	return kle__in_priv( h, h2, m, ln, xt, yt, skip, one, 1, 0, 1)



# int t_HexPole::Ych_inLeftDnLine(int yCentr, int y2, int skipKlv =0, int one =0)
func kle__in_left_dn_line( h: int, h2: int, m, ln: int, xt: int, yt: int, skip, one):
	return kle__in_priv( h, h2, m, ln, xt, yt, skip, one, 1, -1, 0)


# int t_HexPole::Ych_inLeftUpLine(int yCentr, int y2, int skipKlv =0, int one =0)
func kle__in_left_up_line( h: int, h2: int, m, ln: int, xt: int, yt: int, skip, one):
	return kle__in_priv( h, h2, m, ln, xt, yt, skip, one, -1, -1, 0)






# int t_HexPole::Ych_NearBelt2(int yCentr, int y2)

func kle__near_belt2( h: int,  h2: int,  m, ln: int,  xt: int, yt: int):
	# h == centr
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0

	# нам нужен Пояс "через одну от центра"..
	if kle__h_near6( h,  h2,  m, ln, xt): return 0

	if (h - xt * 2) == h2: return 1; # в таких чотных все ровно.
	if (h + xt * 2) == h2: return 1;

	if (h - 2) == h2: return 1 # +-2 это максимум не-проверяемых гориз-сдвигов
	if (h + 2) == h2: return 1
		# это входит в _скобы_клеток, но здесь _раньше обнаружение.

	if kle__near_left_3( h - 1,  h2,  m, ln,  xt): return 1
	if kle__near_rit_3( h + 1,  h2,  m, ln,  xt): return 1

	# осталось узнать "диа отступы" - как-бы на косой линии
	if kle__in_rit_up_line( h, h2,  m, ln, xt, yt,  1, 1): return 1
	if kle__in_rit_dn_line( h, h2,  m, ln, xt, yt,  1, 1): return 1
	if kle__in_left_dn_line( h, h2,  m, ln, xt, yt,  1, 1): return 1
	if kle__in_left_up_line( h, h2,  m, ln, xt, yt,  1, 1): return 1
	
	return 0




# int t_HexPole::Ych_NearBelt3(int yCentr, int y2)

func kle__near_belt3( h: int,  h2: int,  m, ln: int,  xt: int, yt: int):
	# h == centr
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0

	if ! kle__is_left_bort( h - 1, ln, xt):
		if kle__near_left_3( h - 2,  h2,  m, ln,  xt): return 1

	if ! kle__is_rit_bort( h + 1, ln, xt):
		if kle__near_rit_3( h + 2,  h2,  m, ln,  xt): return 1

	if kle__in_rit_up_line( h, h2,  m, ln, xt, yt,  2, 1): return 1
	if kle__in_rit_dn_line( h, h2,  m, ln, xt, yt,  2, 1): return 1
	if kle__in_left_dn_line( h, h2,  m, ln, xt, yt,  2, 1): return 1
	if kle__in_left_up_line( h, h2,  m, ln, xt, yt,  2, 1): return 1

	if kle__in_rit_up_line( h + 1, h2,  m, ln, xt, yt,  1, 1): return 1
	if kle__in_rit_dn_line( h + 1, h2,  m, ln, xt, yt,  1, 1): return 1
	if kle__in_left_dn_line( h -1, h2,  m, ln, xt, yt,  1, 1): return 1
	if kle__in_left_up_line( h -1, h2,  m, ln, xt, yt,  1, 1): return 1


	if kle__in_left_up_line(h - xt * 2, h2,  m, ln, xt, yt,  0, 1): return 1
	if kle__in_rit_up_line( h - xt * 2, h2,  m, ln, xt, yt,  0, 1): return 1

	if kle__in_rit_dn_line( h + xt * 2, h2,  m, ln, xt, yt,  0, 1): return 1
	if kle__in_left_dn_line(h + xt * 2, h2,  m, ln, xt, yt,  0, 1): return 1

	return 0





# int t_HexPole::Ych_NearBelt4(int yCentr, int y2)

func kle__near_belt4( h: int,  h2: int,  m, ln: int,  xt: int, yt: int):
	# h == centr
	if h_get_orig( h, m, ln) == land__border: return 0
	if h_get_orig( h2, m, ln) == land__border: return 0

	if (h - xt * 4) == h2: return 1 # в таких чотных все ровно.
	if (h + xt * 4) == h2: return 1
	# Расчот на то что Борт есть и (h) не залезает
	# на борт - мы смело можем сместить
	# на хекс вправо или влево - попадем этим на борт - это не глюк.

	if ((h - 1) - xt * 4) == h2: return 1
	if ((h + 1) - xt * 4) == h2: return 1
	if ((h - 1) + xt * 4) == h2: return 1
	if ((h + 1) + xt * 4) == h2: return 1

	if kle__in_rit_up_line( h, h2,  m, ln, xt, yt,  3, 1): return 1
	if kle__in_rit_dn_line( h, h2,  m, ln, xt, yt,  3, 1): return 1
	if kle__in_left_dn_line( h, h2,  m, ln, xt, yt,  3, 1): return 1
	if kle__in_left_up_line( h, h2,  m, ln, xt, yt,  3, 1): return 1

	if ! kle__is_left_bort( h - 1, ln, xt):
		if kle__in_left_dn_line( h -1, h2,  m, ln, xt, yt,  2, 1): return 1
		if kle__in_left_up_line( h -1, h2,  m, ln, xt, yt,  2, 1): return 1
		
		if ! kle__is_left_bort( h - 2, ln, xt):
			if kle__in_left_dn_line( h -2, h2,  m, ln, xt, yt,  1, 1): return 1
			if kle__in_left_up_line( h -2, h2,  m, ln, xt, yt,  1, 1): return 1
			
			if kle__near_left_3( h - 3,  h2,  m, ln,  xt): return 1

	if ! kle__is_rit_bort( h + 1, ln, xt):
		if kle__in_rit_up_line( h +1, h2,  m, ln, xt, yt,  2, 1): return 1
		if kle__in_rit_dn_line( h +1, h2,  m, ln, xt, yt,  2, 1): return 1
		
		if ! kle__is_rit_bort( h + 2, ln, xt):
			if kle__in_rit_up_line( h +2, h2,  m, ln, xt, yt,  1, 1): return 1
			if kle__in_rit_dn_line( h +2, h2,  m, ln, xt, yt,  1, 1): return 1
			
			if kle__near_rit_3( h + 3,  h2,  m, ln,  xt): return 1
	return 0;





# ---------




#int t_HexPole::NomYchUnder( int xe, int ye,
#     int poleX, int poleNiz, int tileW, int tileH)

func NomHex_Under( ln: int, xt: int, yt: int,  xe, ye, bX, bNiz, tileW, tileH ):
	if xe < 0: return -1
	if ye < 0: return -1
	if tileW < 8: return -1 # слишком мелкие не-допускать
	if tileH < 8: return -1

	var oY := 0
	oY = ye - bNiz
	if oY < 1: return -1

	var nomLine := 0
	nomLine = (oY / tileH) # самая нижняя это линия номер Ноль

	# ---
	# посмотреть попадет-ли курсор в более тонкую линию (это важно)
	var NizPorog := 0

	NizPorog = 1 + bNiz + (tileH * nomLine) + (tileH / 6);
	if ye < NizPorog: return -1

	NizPorog = bNiz + (tileH * (nomLine + 1)) - (tileH / 6) - 1;
	if ye > NizPorog: return -1


	nomLine = (yt - 1) - nomLine # обернуть

	if nomLine % 2:
		xe += (tileW / 2) # рисуют сдвигая влево - здесь вернем вправо ...

	var oX := 0
	oX = xe - bX # офсет гориз внутри поля.
	if oX < 1: return -1 # курсор за левой стенкой


	var poleW := 0
	poleW = xt * tileW
	if xe > (bX + poleW): return -1

	var poleH := 0
	poleH = yt * tileH
	if ye > (bNiz + poleH): return -1

	var nomT := 0
	nomT = (nomLine * xt)  + (oX / tileW) # от ноля счот "nomT"

	# ---
	# До этого, мы проверяли попадание даже в борта - для нужд редактирования.
	# Теперь проверить Борт-ли это и если борт вернуть -1

	if kle__is_left_bort( nomT, ln, xt):
		return -1
	elif kle__is_rit_bort(nomT, ln, xt):
		return -1
	elif kle__is_top_bort(nomT, ln, xt):
		return -1
	elif kle__is_btm_bort(nomT, ln, xt):
		return -1

	return nomT;








#//void t_HexPole::FillYchB_OnWayLine( int SrcHex, int TargHex,
#//		  float x1, float y1, float x2, float y2, float stepLen,
#//		int poleX, int poleNiz, int tileW, int tileH, BYTE index)

# можно внедрить клас-дескриптор для этой процы..

# kle__fill_vis_ext__line
# x1: float, y1: float, x2: float, y2: float, stepLen: float,

func kle__fill_vis_ext(h: int,h2: int,m,ln,xt,yt, x1,y1,x2,y2,st,bX,bNiz,tW,tH,val):
	
	# clear_vis_ext // ClearPoleBytes();
	# вызывать отдельно перед подобными процами, если не надо "микс".
	#
	# st это аля половинка ребра квада-хекса = прирост здешнего вектора


	# x1 это как-бы икс "откуда луч пойдет - место стрельца"
	x2 -= x1
	y2 -= y1

	var invLen := 1.0
	invLen = invLen / sqrt( (x2 * x2)  +  (y2 * y2) )

	x2 = x2 * invLen
	y2 = y2 * invLen # нормализовали
	x2 = x2 * st
	y2 = y2 * st # получили "прибавочный отрезок"

	var tmp := 0
	var bloker := 0
	if xt > yt:
		# отношение tW  st
		bloker = xt * 3 # но пока просто утроим
	else:
		# отношение tH  st
		bloker = yt * 3 # но пока просто утроим

	for i in range( 0, bloker):
		x1 += x2
		y1 += y2 # очередной чек поинт

		tmp = NomHex_Under( ln, xt, yt,   x1, y1,   bX, bNiz, tW, tH)

		if tmp == -1: continue
		if tmp == h2: return # добежали
		if tmp != h:
			m[ tmp].vis_ext = val







# int t_HexPole::DirFromHex(int ourHex, int toHex)

func HourFromHex( h: int, h2: int,  ln: int, xt: int):
	if h < 0: return -1
	if h >= ln: return -1
	if h2 < 0: return -1
	if h2 >= ln: return -1
	if h == h2: return 0 # нет направления, но кое какой норм-результ

	var xTileOfs := 0
	var yTileOfs := 0
	var xToTileOfs := 0
	var yToTileOfs := 0

	xTileOfs = h % xt;
	#warning-ignore: INTEGER_DIVISION
	yTileOfs = h / xt;
	xToTileOfs = h2 % xt;
	#warning-ignore: INTEGER_DIVISION
	yToTileOfs = h2 / xt;

	if yTileOfs == yToTileOfs: # мы на одной линии
		if xToTileOfs > xTileOfs: # значит направо //на 3 часа
			return HexMap_Move3
		else:
			return HexMap_Move9

	# здесь бы надо отношение офсетов
	# ради нахождения  Move3  Move9  вне одной линии

	var rx := xTileOfs - xToTileOfs;
	var ry := yTileOfs - yToTileOfs;
	if rx < 0:
		rx = -rx;
	if ry < 0:
		ry = -ry;

	if rx > (ry + 1):
		if xToTileOfs > xTileOfs: # значит направо
			return HexMap_Move3
		else:
			return HexMap_Move9

	# и весь остаток для кривых

	if ( h % (xt * 2)) > (xt - 1): # transX -= (kleW * 0.5f);
	#{
		# прямые верх-нижние это скос вправо
		if yToTileOfs > yTileOfs: # если целевой ниже (на 5 или на 7 часов)
			if xToTileOfs >= xTileOfs:
				return HexMap_Move5
			else:
				return HexMap_Move7

		else: # на 1 или на 11 часов
			if xToTileOfs >= xTileOfs:
				return HexMap_Move1
			else:
				return HexMap_Move11
	#}
	else:
	#{
		if yToTileOfs > yTileOfs: # если целевой хекс ниже
			if xToTileOfs <= xTileOfs:
				return HexMap_Move7
			else:
				return HexMap_Move5
		else:
			if xToTileOfs <= xTileOfs:
				return HexMap_Move11
			else:
				return HexMap_Move1
	#}
	#return 0;



# HexFromDir( ourHex: int, HM_x: int):

func HexFromHour( h: int, m, ln: int, xt: int, HM_x: int):
	if h_get_orig( h, m, ln) == land__border: return -1
	#11 1
	#9   3
	var yd := 0
	
	if ( h % (xt * 2)) > (xt - 1):
		if HM_x == HexMap_Move1: # на час
			yd = h - xt;
		elif HM_x == HexMap_Move3: # вправо - на три
			yd = h + 1;
		elif HM_x == HexMap_Move5:
			yd = h + xt;
		elif HM_x == HexMap_Move7:
			yd = h + xt -1;
		elif HM_x == HexMap_Move9:
			yd = h - 1;
		elif HM_x == HexMap_Move11:
			yd = h - xt -1;
		else:
			return -1;
	else:
		if HM_x == HexMap_Move1:
			yd = h - xt +1;
		elif HM_x == HexMap_Move3:
			yd = h + 1;
		elif HM_x == HexMap_Move5:
			yd = h + xt +1;
		elif HM_x == HexMap_Move7:
			yd = h + xt;
		elif HM_x == HexMap_Move9:
			yd = h - 1;
		elif HM_x == HexMap_Move11:
			yd = h - xt;
		else:
			return -1;
	
	if h_get_orig( yd, m, ln) == land__border: return -1
	return yd;







func w_m_k2__priv_FillBeltRay( BeltKle: int, oy: int, sdvig: int, HexMap_x):
	var dist := 0
	var dir = HexMap_x
	var k := oy
	
	for t in range( 0, w_m_k2__yt): # same for(;;)
	#{
		dist = t + sdvig;

		# dir // пока проставим везде одинаково
		w_m_k2[ BeltKle].set_from1( k, dist, dir); # fill

		# узнать ближнего соседа по нужному лучу.
		k = HexFromHour( k, w_m_k2, w_m_k2__len, w_m_k2__xt, HexMap_x);

		if ! h_ok_abs( k, w_m_k2__len, w_m_k2__xt):
			return 1 #// вариант стал фиговым - прервать процу.
	#}
	return 1



# int t_HexPole::priv_SlideFillBelt(int ourHex, int horizRit, int HexMap_x)

func w_m_k2__priv_SlideFillBelt( ourHex: int, horizRit: int, HM_x):
	# Нужно провести итэрацыи, когда опорная клетка будет виртуально
	# сдвигаться вправо, а от неё инэр-накрут по лучу-направу 1 час.
	# Допустим, что здесь НЕ заполняем клетки прямого луча Вправо.
	var oy := ourHex;
	if horizRit > 0:
		horizRit = 1;
	else:
		horizRit = -1;
	
	for t in range( 0, w_m_k2__xt): # same for(;;)
	#{	// вызвать процу прохода по нужному лучу. Например, HexMap_Move1
		w_m_k2__priv_FillBeltRay( ourHex, oy, t, HM_x)
		
		oy += horizRit # сдвинуть вправо или влево.
		
		if horizRit > 0:
			if kle__is_left_bort( oy, w_m_k2__len, w_m_k2__xt): return 1;
		else:
			if kle__is_rit_bort( oy, w_m_k2__len, w_m_k2__xt): return 1;
	#}
	return 1;





# ---
# сначала выпускаем два развед шюпа по лучам 5 и 7, кто из них дальшэ уйдёт,
# тот и будет опорным лучом, от которого в правильный бок будет дублироваться
# дистанцыя, потому-что она в этом "горизонтальном срезе" будет одинаковая.
# Каждая строка обравыется, если доходит до борта или до НЕ-опорного луча.
#
# основа проведения гориз-линий в том, что пирамида равно-бедреная.
# если мы сдвинулись по лучу три раза, то нужно три раза сдвинуться по гориз.

func w_m_k2__priv_RegVert_FillBelt( ourHex: int, HM_i, HM_ii):
	var k := 0;
	var oy := 0;
	var horizRit := 0;
	var dist := 0;
	var dir := 1;
	
	k = ourHex;
	for i in range( 0, w_m_k2__yt):
		oy = i;
		k = HexFromHour( k, w_m_k2, w_m_k2__len, w_m_k2__xt, HM_i);
		# 1  or  HexMap_Move5
		
		if ! h_ok_abs( k, w_m_k2__len, w_m_k2__xt): break
	
	k = ourHex;
	for i in range( 0, w_m_k2__yt):
		horizRit = i;
		k = HexFromHour( k, w_m_k2, w_m_k2__len, w_m_k2__xt, HM_ii);
		# 11  or  HexMap_Move7
		
		if ! h_ok_abs( k, w_m_k2__len, w_m_k2__xt): break
	

	# какой луч длиней // назначить horizRit ...
	# а лучшэ разделить на блоки сразу
	if horizRit >= oy:
	#{
		# horizRit = 1; // HM_ii
		dir = HM_ii
		k = ourHex;
		for i in range( 0, w_m_k2__yt):
			dist = i;
			for j in range( 0, i + 1):
				if ! h_ok_abs( k +j,  w_m_k2__len, w_m_k2__xt): break # j

				# dir // пока проставим везде одинаково
				w_m_k2[ ourHex].set_from1( k +j, dist, dir); # fill
			# for j
			k = HexFromHour( k, w_m_k2, w_m_k2__len, w_m_k2__xt, HM_ii);
			if ! h_ok_abs( k,  w_m_k2__len, w_m_k2__xt): break # i
		# for i
	#}
	else:
	#{
		# horizRit = -1; // HM_i
		dir = HM_i
		k = ourHex;
		for i in range( 0, w_m_k2__yt):
		#{
			dist = i;
			for j in range( 0, i + 1):
			#{
				if ! h_ok_abs( k -j,  w_m_k2__len, w_m_k2__xt): break # j

				# dir // пока проставим везде одинаково
				w_m_k2[ ourHex].set_from1( k -j, dist, dir); # fill
			#}
			k = HexFromHour( k, w_m_k2, w_m_k2__len, w_m_k2__xt, HM_i);
			if ! h_ok_abs( k,  w_m_k2__len, w_m_k2__xt): break # i
		#}
	#}
	return 1;







func w_m_k2__re_init():
	# w_m_k2__xt  is const
	w_m_k2__len = w_m_k2__xt * w_m_k2__yt;
	if w_m_k2.size() < w_m_k2__len:
		w_m_k2.resize( w_m_k2__len)

	for i in range( 0, w_m_k2__len):
		if ! w_m_k2[ i]:
			w_m_k2[ i] = t_kle2.new() # кое-как выделим опер-память.
	
	kle__clear( w_m_k2, w_m_k2__len, w_m_k2__xt)
	

	# используем накрут по Строкам поля
	# (прогоняем клетки одной строки, потом второй).
	# и для каждой клетки используем 6 процэдур,
	# которые пытаются регионом заполнять.
	
	var sta := 0
	var fin := 0
	for i in range( 0, w_m_k2__yt): # каждую строку // each line..
		sta = i * w_m_k2__xt # first tile of line.
		fin = sta + w_m_k2__xt - 1
		while sta < fin:
		#{
			if h_ok_abs( sta, w_m_k2__len, w_m_k2__xt):
			#{
				w_m_k2__priv_SlideFillBelt( sta, 1, HexMap_Move1);
				w_m_k2__priv_SlideFillBelt( sta, 1, HexMap_Move5);
				w_m_k2__priv_SlideFillBelt( sta, 0, HexMap_Move7);
				w_m_k2__priv_SlideFillBelt( sta, 0, HexMap_Move11);

				# 6
				w_m_k2__priv_RegVert_FillBelt( sta, HexMap_Move5, HexMap_Move7)
				
				# 12
				w_m_k2__priv_RegVert_FillBelt( sta, HexMap_Move1, HexMap_Move11)
			#}
			sta += 1;
		#}







# Если надо 15 доступных клеток (горизонталь) в самом шыроком месте,
# то прибавь два борта (аргумент x_tiles == 17).
# Будет чередование 14 и 15 = норма.

func e_m_k__re_init( x_tiles: int = 16, y_tiles: int = 16):
	#e_m_k__len = 0 # e_m_k.reset_mem();
	
	e_m_k__xt = tram( x_tiles, 16, 1024)
	e_m_k__yt = tram( y_tiles, 16, 1024)
	
	e_m_k__len = e_m_k__xt * e_m_k__yt
	#last_line = e_m_k__yt - 1;
	
	if e_m_k.size() < e_m_k__len:
		e_m_k.resize( e_m_k__len)
	# оставляем хвост, если нам надо меньшэ, чем было, но помним,
	# что везде надо использовать e_m_k__len, вместо e_m_k.size
	
	if ! e_m_k.size():
		print( "Err e_m_k   xt:", e_m_k__xt, "  yt:", e_m_k__yt)
	else:
		print( "Mem e_m_k   size: ", e_m_k.size())

	for i in range( 0, e_m_k__len):
		if ! e_m_k[ i]:
			e_m_k[ i] = t_kle.new() # кое-как выделим опер-память.

	#for( int i = 0; i < e_m_k__yt; i++)
	#	masStartLines[i] = i * e_m_k__xt;
	#	masEndLines[i] = masStartLines[i] + e_m_k__xt - 1;
	
	kle__clear( e_m_k, e_m_k__len, e_m_k__xt) #ClearPole();





func random( mini: int = 1, maxi: int = 6):
    return ( randi() % (maxi - mini + 1) ) + mini



func _ready():
	randomize()
	
	m_z.resize( m_z_last +1) # меняем размер склада (+1 запаса).
	m_z[ 0] = t_unit_new() # наша запаска.
	load_zag_tab()
	
	
	w_m_k2__re_init()
	
	#e_m_k__re_init( 128, 128)
	e_m_k__re_init( 32, 32) # тэст быстрей стартовать
	
	e_m_k[ 138].orig_land = 25
	e_m_k[ 139].init( 26, 126)
	
	print( " e_m_k[ 138]: ", e_m_k[ 138].orig_land, ",  e_m_k[ 139]: ", e_m_k[ 139].orig_land )
	
	#m2_tst.resize( m2_tst_last * 2 +2)
	m2_new_size( m2_tst, m2_tst_last)

	m2_set_x( m2_tst, 1,  11)
	m2_set_y( m2_tst, 1,  12)
	
	m2_set_x( m2_tst, 2,  21)
	m2_set_y( m2_tst, 2,  22)

	m2_set_x( m2_tst, m2_tst_last,  31)
	m2_set_y( m2_tst, m2_tst_last,  32)
	
	print( m2_get_x( m2_tst, 1), "  ", m2_get_y( m2_tst, 1))
	print( m2_get_x( m2_tst, 2), "  ", m2_get_y( m2_tst, 2))
	print( m2_get_x( m2_tst, 3), "  ", m2_get_y( m2_tst, 3))



func test_load_zag():
	m_z[2].nx += 1 # сдвигаем число на единицу
	var t1 = m_z[1].nom_base
	var f1 = m_z[1].nx
	var s1 = m_z[1].name  # для удобства
	var t2 = m_z[ z_second].nom_base
	var f2 = m_z[ z_second].nx
	var s2 = m_z[ z_second].name

	print( s1, ".nom_base ", t1, " nx ", f1, "  ", s2, ".n ", t2, " nx ", f2)
	print( m2_get_x( m_z[1].m2_stabil, 3), "  ", m2_get_y( m_z[1].m2_stabil, 3))


# =============






