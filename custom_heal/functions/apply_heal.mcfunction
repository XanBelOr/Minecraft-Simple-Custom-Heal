# get max health and current health
scoreboard players operation @s c.actual_heal += @s c.heal
attribute @s minecraft:generic.max_health modifier remove 019-1193-66-723-69420
execute store result score #c.max_health c.heal run attribute @s minecraft:generic.max_health get 10000
execute store result score #c.current_health c.heal run data get entity @s Health 10000

# if your current health is at your max health (or greater somehow), exit the function as there is no need to heal
execute if score #c.max_health c.heal <= #c.current_health c.heal run return run scoreboard players set @s c.actual_heal 0

scoreboard players operation #c.max_health c.heal -= @s c.actual_heal
scoreboard players operation #c.max_health c.heal -= #c.current_health c.heal

# if this heal will fully heal the player, no need to modify attributes. Just fully heal and exit.
execute if score #c.max_health c.heal matches ..0 run return run function custom_heal:full_heal

#set up and run the macro
execute store result storage central:heal amount.x double -0.0001 run scoreboard players get #c.max_health c.heal
function custom_heal:set_hp with storage central:heal amount

#heal the health then prepare to remove the attribute modifier
effect give @s minecraft:instant_health 1 28 true
scoreboard players set @s c.custom_healed 1