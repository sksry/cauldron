scoreboard players set @s seek_temp 1
scoreboard players set @s seek_counter 0
data modify entity @s ArmorItems[0].tag.Cauldron[0].First set value 1b
data modify entity @s ArmorItems[0].tag.Cauldron[0].Enum set value 1
execute store result score @s seek_temp2 run data get entity @s ArmorItems[0].tag.Cauldron[0].Count
scoreboard players operation @s seek_counter += @s seek_temp2
data modify entity @s ArmorItems[0].tag.Cauldron append from entity @s ArmorItems[0].tag.Cauldron[0]
data remove entity @s ArmorItems[0].tag.Cauldron[0]
execute unless data entity @s ArmorItems[0].tag.Cauldron[0].First run function cauldron:logic/zarray_enumerate_loop

data remove entity @s ArmorItems[0].tag.Cauldron[0].First 