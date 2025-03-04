# Minecraft-Simple-Custom-Heal
Super simple custom heal library for Minecraft datapacks.

# How to use
It's really simple!
1. Make sure somewhere in your datapack's load function, you call `custom_heal:load` so the scores can be initialized
2. Set a player's `c.heal` score to your desired heal amount (scaled by 10,000, so 10,000 = 1 HP healed.)
3. Call `custom_heal:apply_heal` as the player being healed
   
And that's it! The player will be healed by your specified amount.

# Why?

Minecraft doesn’t natively support custom healing amounts for players, requiring alternative methods to achieve precise healing.

This library leverages a well-established technique: temporarily reducing the player’s max health, applying the Instant Health effect, and then restoring the original max health.

A key improvement over older methods is how it detects when the Instant Health effect is removed. Previously, systems relied on a next-tick delay to safely restore max health, which could occasionally cause minor issues. Instead, this approach uses an advancement-based trigger, allowing the entire process to complete within the same tick—eliminating the need for a ticking command and ensuring fully subtick-accurate healing.

This makes the system lightweight, precise, and efficient.