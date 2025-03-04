advancement revoke @s only custom_heal:reset_heal
attribute @s minecraft:max_health modifier remove custom_heal:health_adjuster
scoreboard players set @s c.custom_healed 0
scoreboard players set @s c.actual_heal 0
