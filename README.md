# Minecraft-Simple-Custom-Heal
Super simple custom heal library for Minecraft datapacks.

# How to use
It's really simple!
1. Make sure somewhere in your datapack's load function, you call `custom_heal:load` so the scores can be initialized
2. Set a player's `c.heal` score to your desired heal amount (scaled by 10,000, so 10,000 = 1 HP healed.)
3. Call `custom_heal:apply_heal` as the player being healed
   
And that's it! The player will be healed by your specified amount.

# Why?
Custom amounts of healing for players isn't supported by default, so it must be done using other methods.
This uses the tried and true trick of reducing the player's max health, giving instant_health, then setting it back.
This library is lightweight but still effective. Since the instant_health effect doesn't process at the same time as
when functions are called, older methods had to wait until the next tick to remove the attribute modifier or it wouldn't work correctly.
That could (albeit uncommonly) cause some minor issues. This one instead uses an advancment to detect exactly
when the instant_health effect is removed, eliminating the need for a ticking command and allowing it
to do everything completely subtick! (Within the same tick.)
