# Create cauldron vessels
execute as @e[type=item] at @s align xyz if block ~ ~ ~ minecraft:cauldron[level=3] if block ~ ~-1 ~ #minecraft:campfires[lit=true] run function cauldron:cauldron/update_vessel
execute as @e[tag=cauldron_vessel] at @s align xyz run function cauldron:cauldron/vessel_properties