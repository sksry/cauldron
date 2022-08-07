execute unless block ~ ~ ~ minecraft:cauldron[level=3] run playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 0.65 0.85
execute unless block ~ ~ ~ minecraft:cauldron[level=3] run particle minecraft:large_smoke ~0.5 ~0.85 ~0.5 0.145 0 0.145 0.035 40 force
execute unless block ~ ~ ~ minecraft:cauldron[level=3] run kill @s

scoreboard players add @s seek_timer 1

tag @s remove cauldron_heated
tag @s remove cauldron_superheated
execute if block ~ ~-1 ~ #minecraft:campfires[lit=true] run tag @s add cauldron_heated
execute if block ~ ~-1 ~ minecraft:soul_campfire[lit=true] run tag @s add cauldron_superheated

execute at @s[tag=cauldron_heated] run particle minecraft:bubble_pop ~0.5 ~0.95 ~0.5 0.145 0 0.145 0 5 force
execute at @s[tag=cauldron_heated] run particle minecraft:witch ~0.5 ~0.85 ~0.5 0.145 0 0.145 0 1 force

execute at @s[tag=cauldron_heated,scores={seek_counter=4..}] run particle minecraft:witch ~0.5 ~0.85 ~0.5 0.145 0 0.145 0 1 force
execute at @s[tag=cauldron_heated,scores={seek_counter=8..}] run particle minecraft:soul_fire_flame ~0.5 ~1.1 ~0.5 0.125 0 0.125 0.0225 2 force
execute at @s[tag=cauldron_heated,scores={seek_counter=12..}] run particle minecraft:smoke ~0.5 ~0.85 ~0.5 0.145 0 0.145 0.025 3 force
execute at @s[tag=cauldron_heated,scores={seek_counter=16..}] run particle minecraft:witch ~0.5 ~0.85 ~0.5 0.145 0 0.145 0 1 force
execute at @s[tag=cauldron_heated,scores={seek_counter=16..}] run particle minecraft:campfire_cosy_smoke ~0.5 ~1.1 ~0.5 0.145 0 0.145 0 1 force
execute at @s[tag=cauldron_heated,scores={seek_counter=20..}] run particle minecraft:large_smoke ~0.5 ~0.85 ~0.5 0.145 0 0.145 0.035 1 force

execute at @s[tag=cauldron_superheated] run particle minecraft:bubble ~0.5 ~0.95 ~0.5 0.125 0 0.125 0 8 force
execute at @s[tag=cauldron_superheated] run particle minecraft:bubble_pop ~0.5 ~0.95 ~0.5 0.125 0 0.125 0 3 force

execute at @s[tag=cauldron_superheated,scores={seek_counter=8..}] run particle minecraft:soul ~0.5 ~1.1 ~0.5 0.125 0 0.125 0.0225 1 force

execute at @s[scores={seek_timer=1},tag=cauldron_heated] run playsound minecraft:block.lava.ambient master @a ~ ~ ~ 0.65 0.85
scoreboard players set @s[scores={seek_timer=130..,seek_counter=18..}] seek_timer 0
scoreboard players set @s[scores={seek_timer=160..,seek_counter=12..}] seek_timer 0
scoreboard players set @s[scores={seek_timer=190..,seek_counter=6..}] seek_timer 0
scoreboard players set @s[scores={seek_timer=220..}] seek_timer 0