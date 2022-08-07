tag @s[tag=cauldron_item_found_overall] remove cauldron_item_found_overall
scoreboard players set @s seek_temp 1
data modify entity @s ArmorItems[0].tag.CauldronSearch set from entity @s ArmorItems[0].tag.Cauldron
data modify entity @s ArmorItems[0].tag.CauldronSearch[0].First set value 1b

data modify entity @s ArmorItems[0].tag.CauldronSearch[0].idtemp set from entity @s ArmorItems[0].tag.CauldronSearch[0].id
execute store success score @s seek_temp run data modify entity @s ArmorItems[0].tag.CauldronSearch[0].id set from entity @e[tag=cauldron_item,limit=1,sort=nearest] Item.id
data modify entity @s[scores={seek_temp=1}] ArmorItems[0].tag.CauldronSearch[0].id set from entity @s ArmorItems[0].tag.CauldronSearch[0].idtemp
data remove entity @s ArmorItems[0].tag.CauldronSearch[0].idtemp
tag @s[tag=cauldron_item_found] remove cauldron_item_found
tag @s[scores={seek_temp=0}] add cauldron_item_found
tag @s[scores={seek_temp=0}] add cauldron_item_found_overall

execute store result score @s[tag=cauldron_item_found] seek_temp run data get entity @e[tag=cauldron_item,limit=1,sort=nearest] Item.Count
execute store result score @s[tag=cauldron_item_found] seek_temp2 run data get entity @s ArmorItems[0].tag.CauldronSearch[0].Count
scoreboard players operation @s[tag=cauldron_item_found] seek_temp += @s[tag=cauldron_item_found] seek_temp2
execute store result entity @s[tag=cauldron_item_found] ArmorItems[0].tag.CauldronSearch[0].Count int 1 run scoreboard players get @s seek_temp

data modify entity @s ArmorItems[0].tag.CauldronSearch append from entity @s ArmorItems[0].tag.CauldronSearch[0]
data remove entity @s ArmorItems[0].tag.CauldronSearch[0]
execute unless data entity @s ArmorItems[0].tag.CauldronSearch[0].First run function cauldron:logic/zarray_search_loop

data remove entity @s ArmorItems[0].tag.CauldronSearch[0].First
data modify entity @s ArmorItems[0].tag.Cauldron set from entity @s ArmorItems[0].tag.CauldronSearch
data remove entity @s ArmorItems[0].tag.CauldronSearch