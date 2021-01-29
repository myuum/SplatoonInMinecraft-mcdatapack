clear @s[tag=splatoon.sneaked_floor] minecraft:fishing_rod{display:{Name:"{\"text\":\"ink shooter (3)\"}"}}
clear @s[tag=splatoon.sneaked_wall] minecraft:fishing_rod{display:{Name:"{\"text\":\"ink shooter (3)\"}"}}
execute if entity @s[tag=!splatoon.sneaked_floor,tag=!splatoon.sneaked_wall] unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",tag:{display:{Name:"{\"text\":\"ink shooter (3)\"}"}}}]}] run give @s minecraft:fishing_rod{display:{Name:"{\"text\":\"ink shooter (3)\"}"}}

execute if entity @s[scores={splatoon.ink=10..160}] at @s anchored eyes positioned ^ ^ ^ run tag @e[type=minecraft:fishing_bobber,tag=!splatoon.ink_shooter,distance=..1,sort=nearest,limit=1] add splatoon.ink_shooter
execute at @s anchored eyes positioned ^ ^ ^ if entity @e[type=minecraft:fishing_bobber,tag=splatoon.ink_shooter,sort=nearest,limit=1] run scoreboard players remove @s splatoon.ink 3
execute at @s[team=blue] anchored eyes positioned ^ ^ ^ at @e[type=minecraft:fishing_bobber,tag=splatoon.ink_shooter,sort=nearest,limit=1] run summon minecraft:arrow ~ ~ ~ {Tags:["splatoon.motion_copy","splatoon.blue"],Team:"blue",Color:-1,life:1200s}
execute at @s[team=orange] anchored eyes positioned ^ ^ ^ at @e[type=minecraft:fishing_bobber,tag=splatoon.ink_shooter,sort=nearest,limit=1] run summon minecraft:arrow ~ ~ ~ {Tags:["splatoon.motion_copy","splatoon.orange"],Team:"orange",Color:-1,life:1200s}
execute as @e[type=minecraft:fishing_bobber,tag=splatoon.ink_shooter] at @s store result entity @e[type=minecraft:arrow,tag=splatoon.motion_copy,sort=nearest,limit=1] Motion[0] double 0.0001 run data get entity @s Motion[0] 20000
execute as @e[type=minecraft:fishing_bobber,tag=splatoon.ink_shooter] at @s store result entity @e[type=minecraft:arrow,tag=splatoon.motion_copy,sort=nearest,limit=1] Motion[1] double 0.0001 run data get entity @s Motion[1] 20000
execute as @e[type=minecraft:fishing_bobber,tag=splatoon.ink_shooter] at @s store result entity @e[type=minecraft:arrow,tag=splatoon.motion_copy,sort=nearest,limit=1] Motion[2] double 0.0001 run data get entity @s Motion[2] 20000
tag @e[type=minecraft:arrow,tag=splatoon.motion_copy] remove splatoon.motion_copy