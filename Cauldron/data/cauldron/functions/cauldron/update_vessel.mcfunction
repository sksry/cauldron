execute unless entity @e[tag=cauldron_vessel,distance=..0.1] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Silent:1b,Tags:[cauldron_vessel],NoGravity:1b,ArmorItems:[{id:"minecraft:stone",Count:1b,tag:{Cauldron:[]}},{},{},{}]}
tag @s add cauldron_item
execute as @e[tag=cauldron_vessel,sort=nearest,limit=1,nbt={ArmorItems:[{tag:{Cauldron:[{}]}}]}] at @s run function cauldron:logic/array_search
execute as @e[tag=cauldron_vessel,sort=nearest,limit=1] at @s unless entity @s[tag=cauldron_item_found_overall] run data modify entity @s ArmorItems[0].tag.Cauldron append from entity @e[tag=cauldron_item,sort=nearest,limit=1] Item
execute as @e[tag=cauldron_vessel,sort=nearest,limit=1] at @s unless entity @s[tag=cauldron_item_found_overall] store result entity @s ArmorItems[0].tag.Cauldron[-1].Count int 1 run data get entity @s ArmorItems[0].tag.Cauldron[-1].Count
execute as @e[tag=cauldron_vessel,sort=nearest,limit=1] run function cauldron:logic/array_enumerate

particle minecraft:splash ~0.5 ~0.85 ~0.5 0.15 0 0.15 0 50 force
particle minecraft:witch ~0.5 ~0.85 ~0.5 0.15 0.1 0.15 0 50 force
playsound minecraft:entity.generic.splash master @a ~ ~ ~ 1 1.5
data modify entity @s Motion[1] set value 0.05d

kill @s