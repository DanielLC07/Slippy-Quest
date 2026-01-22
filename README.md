# Slippy-Quest
A cute and fast-paced 2D platformer where you play as a small bouncing slime. Jump through handcrafted levels, avoid hazards, and collect every coin to complete each stage. With smooth controls, colorful visuals, and satisfying movement, every jump brings you closer to victory.

Slippy-Quest - Game Design Document
1. Game Overview
1.1 Concept
A 2D platformer where a slime character collects coins across multiple levels. The player must collect all coins in a level to progress to the next one. Built in Godot Engine as a technical demo showcasing fundamental platformer mechanics.
1.2 Demo Scope
Three progressively challenging levels featuring platform navigation, coin collection, and void hazards. The demo focuses on tight movement controls, precise jumping mechanics, and satisfying collection gameplay.
Clear Objective: Collect all coins in each level to unlock the next level. Avoid falling into the void. Complete all 3 levels to win the demo.
1.3 Target Completion
Friday delivery deadline - 2 days total development time (Wednesday-Thursday).

2. Core Mechanics
2.1 Player Movement
Horizontal Movement: Arrow keys (Left/Right)
Jump: Spacebar
Movement Type: Smooth platformer physics (acceleration/deceleration)
Jump Mechanics:
Single jump only (no double jump for demo)
Variable jump height (hold jump for higher jump)
Coyote time (brief grace period after leaving platform)
Jump buffering (jump input registers slightly before landing)
2.2 Physics System
Gravity: Standard downward force
Friction: Ground friction for stopping movement
Max Speed: Cap on horizontal velocity
Jump Force: Upward impulse force
Air Control: Reduced but present horizontal control while airborne
2.3 Animation States
Available Animations (already created):
Idle: Standing still
Walk/Run: Moving left or right
NO Jump Animation Available - Will use Idle animation when airborne
Animation Triggers:
Idle: velocity.x == 0
Walk: velocity.x != 0
(Airborne state uses Idle animation since no jump animation exists)
2.4 Coin Collection
Interaction: Collision with coin (Area2D overlap)
Feedback:
Coin disappears immediately
Counter updates (+1)
Sound effect plays (if implemented)
Particle effect (optional polish)
Win Condition: All coins collected → Level complete screen → Next level
2.5 Death System
Death Trigger: Falling below a certain Y position (void zone)
Consequence:
Lose 1 life
Respawn at level start
Coins reset to uncollected state
Game Over: When lives reach 0
2.6 Lives System
Starting Lives: 3 lives (configurable to 5 if too hard)
Display: Heart icons or number counter in UI
Life Loss: Only from falling into void
Game Over State: Screen showing "Game Over" with restart option

3. Level Design
3.1 Level Structure
Total: 3 Levels
Level 1 - Tutorial/Easy:
Simple platform layout
Coins placed in obvious locations
Wide platforms, short gaps
No difficult jumps
Coin Count: 5-8 coins
Goal: Teach basic movement and jumping
Level 2 - Intermediate:
Narrower platforms
Larger gaps requiring precise jumps
Coins in slightly harder-to-reach places
Introduce vertical platforming
Coin Count: 8-12 coins
Goal: Test player's mastery of controls
Level 3 - Challenge:
Complex platform arrangements
Long jump sequences
Coins requiring multiple precise jumps
Narrow platforms over void
Coin Count: 10-15 coins
Goal: Final test of skill
3.2 Platform Types
Static Platforms: Non-moving solid platforms (ONLY type for demo)
Ground: Bottom solid area (above void)
Void Zone: Area below platforms where player dies
3.3 Level Progression
Level 1 Complete → Transition Screen (1-2s) → Level 2
Level 2 Complete → Transition Screen (1-2s) → Level 3
Level 3 Complete → Victory Screen → End Demo

4. UI/UX Design
4.1 HUD (Heads-Up Display)
Always Visible:
Coin Counter: "Coins: X / Y" (collected / total)
Lives Display: Heart icons ❤️❤️❤️ or "Lives: 3"
Optional:
Current level indicator: "Level 1"
4.2 Screen States
Game Screen:
Level environment
HUD overlay (coins, lives)
Level Complete Screen:
"Level Complete!"
"Coins Collected: X / X"
Auto-advance to next level after 2 seconds
Game Over Screen:
"Game Over"
"Press R to Restart" or "Press ESC to Quit"
Victory Screen:
"You Win!"
"All Levels Complete!"
Stats (optional): Total deaths, total time
4.3 Visual Feedback
Coin collection: Coin sprite disappears, counter updates
Death: Fade to black (0.3s) → Respawn with fade in (0.3s)
Level transition: Fade out/in (0.5s each)

5. Audio Design
5.1 Sound Effects Priority
High Priority (Must Have):
Jump sound (quick "boing" or "hop")
Coin collection sound (pleasant "ding" or "ping")
Death sound (sad "ooh" or failure sound)
Medium Priority (Nice to Have):
Level complete jingle
Game over sound
Low Priority (Polish):
Ambient level sounds
NOT INCLUDED:
❌ Footstep sounds (slimes don't have feet)
5.2 Music
Background Music:
Upbeat, looping track for gameplay
Different track for each level (if time permits)
Victory fanfare for completion
Implementation:
Use Godot AudioStreamPlayer
Loop music seamlessly
Adjust volume to not overpower SFX

6. Visual Assets
6.1 Confirmed Assets
✅ Slime character sprites with animations (Idle, Walk) - NO Jump animation
✅ Platform tiles from Rocky Roads asset pack (itch.io)
Coin sprite (static or animated)
Background (simple gradient or parallax layers)
UI elements (heart icons, text boxes)
6.2 Asset Requirements
Still Needed:
Coin sprite (can use itch.io or draw simple circle)
Background art (can be solid color or simple gradient)
UI hearts or life counter graphics
Platform Assets:
Using Rocky Roads tileset from itch.io (already acquired)
Sources for Missing Assets:
itch.io (free platformer asset packs)
Kenney.nl (huge library of free game assets)
OpenGameArt.org

7. Technical Specifications
7.1 Engine
Godot Engine 4.5.4 (latest stable version)
2D project setup
Using Godot 4 syntax and nodes (CharacterBody2D, not KinematicBody2D)
7.2 Scene Structure
Main
├── Level1
│   ├── Player (CharacterBody2D with AnimatedSprite2D)
│   ├── PlatformTileMap (TileMap using Rocky Roads tileset)
│   ├── Coins (Area2D x 5-8)
│   ├── VoidZone (Area2D below map)
│   └── Camera2D (follows player)
│
├── Level2
│   └── (same structure as Level1)
│
├── Level3
│   └── (same structure as Level1)
│
├── UI
│   ├── HUD (Coins, Lives)
│   ├── LevelComplete
│   ├── GameOver
│   └── Victory
7.3 Key Godot Nodes
Player: CharacterBody2D (Godot 4 node)
AnimatedSprite2D: For player animations (Idle, Walk only)
Platforms: TileMap with Rocky Roads tileset
Coins: Area2D with CollisionShape2D and Sprite2D
Camera: Camera2D with smoothing enabled
Void Zone: Area2D detecting player fall
UI: Control nodes (Label, TextureRect for hearts)
7.4 Core Scripts Needed
Player.gd - Movement, jump, animation control
Coin.gd - Collection detection, signal emission
GameManager.gd - Track coins, lives, level progression
VoidZone.gd - Detect player death
LevelController.gd - Level completion, transitions
7.5 Player Movement Implementation
Movement System:
Uses Input actions mapped to Arrow Left and Arrow Right keys
Detects directional input to move player horizontally
Applies velocity to CharacterBody2D
move_and_slide() handles physics and collision
Smooth acceleration and deceleration for responsive feel
Jump System:
Detects jump input mapped to Spacebar
Only allows jump when on floor (is_on_floor() check)
Applies upward velocity impulse
Gravity constantly pulls player down when airborne
Animation Control:
Checks velocity.x to determine if moving or idle
Plays "walk" animation when velocity.x != 0
Plays "idle" animation when velocity.x == 0
Uses idle animation when airborne (no jump animation available)
Flips sprite horizontally based on movement direction

8. Game Flow
8.1 Start to Finish Flow
1. Game Start → Level 1 loads directly
   ↓
2. Player collects coins
   ↓
3a. All coins collected → Level Complete → Level 2
3b. Fall into void → Lose life → Respawn Level 1
3c. Lives = 0 → Game Over → Restart or Quit
   ↓
4. Repeat for Level 2
   ↓
5. Repeat for Level 3
   ↓
6. Level 3 complete → Victory Screen → End
8.2 Respawn System
When player dies:
Trigger death animation/sound
Fade to black (0.3s)
Decrement lives counter
Reset player position to spawn point
Reset all coins to uncollected
Fade in (0.3s)
Resume gameplay

9. Development Roadmap
Day 1 - Wednesday (TODAY) ⚡
Goal: Playable Level 1 with core mechanics
Morning Session (3-4 hours):
Set up Godot 4.5.4 project (2D platformer template)
Import slime animations (Idle, Walk - no Jump available)
Import Rocky Roads tileset
Create Player scene (CharacterBody2D + AnimatedSprite2D)
Configure input actions (Arrow Left, Arrow Right, Spacebar for jump)
Implement basic movement (Arrow keys left/right)
Implement jump mechanics (Spacebar)
Test movement feels good (adjust SPEED and JUMP_VELOCITY)
Afternoon Session (4-5 hours):
Create TileMap layer with Rocky Roads tiles
Build Level 1 layout (simple platforms using TileMap)
Configure TileMap collision shapes
Add Camera2D that follows player
Implement player animations (idle, walk triggers - use idle when airborne)
Add sprite flipping based on direction
Create VoidZone (Area2D below map)
Implement death on void collision
Evening Session (3-4 hours):
Create Coin scene (Area2D + Sprite)
Place 5-8 coins in Level 1
Implement coin collection (on Area2D overlap)
Create coin counter UI (Label showing "Coins: X / Y")
Implement lives system (start with 3 lives)
Lives UI display (hearts or text)
Respawn system on death (reset position + coins)
Test full Level 1 loop
CRITICAL End of Day Milestone: ✅ Player moves smoothly with animations (walk/idle) ✅ Can jump and land on TileMap platforms ✅ Can collect coins (counter updates) ✅ Dies when falling into void ✅ Respawns with 1 less life ✅ Level 1 is fully playable start to finish

Day 2 - Thursday (FINAL DEVELOPMENT DAY) 🔥
Goal: Complete 3 levels + polish
Morning Session (3-4 hours):
Implement level completion system
Check if all coins collected
Trigger level complete screen
Transition to next level
Create Level 2 scene (duplicate Level 1, modify TileMap layout)
Design Level 2 platforms using Rocky Roads tiles (harder jumps)
Place 8-12 coins in Level 2
Test Level 1 → Level 2 transition
Create Level 3 scene
Design Level 3 platforms (challenging layout)
Place 10-15 coins in Level 3
Afternoon Session (4-5 hours):
Implement Game Over screen (when lives = 0)
Implement Victory screen (after Level 3)
Add restart functionality (R key or button)
Test full 3-level progression
Find/create audio assets:
Jump sound effect (squishy bounce)
Coin collection sound
Death sound (sad squish)
Background music (upbeat, looping)
Integrate all sound effects
Add background music loop
Evening Session (3-4 hours) - POLISH & TESTING:
Visual polish:
Particle effects on coin collection (optional)
Death fade transition smooth
Level transition fade smooth
Balance pass on all 3 levels:
Adjust platform spacing if too hard/easy
Verify coin counts feel right
Test lives count (3 vs 5)
Add simple background (gradient or image)
UI polish (font, colors, positioning)
Run through MANDATORY CHECKLIST (Section 10)
Bug fixing session
Final playthrough all 3 levels
Build/export demo for submission
CRITICAL End of Day Milestone: ✅ All 3 levels complete and playable ✅ Can progress Level 1 → 2 → 3 ✅ Lives system works correctly ✅ Game Over and Victory screens functional ✅ Audio implemented (SFX + music) ✅ No game-breaking bugs

Friday - DELIVERY DAY 📦
NO DEVELOPMENT - Submission only
Submit GDD document
Submit playable demo build
(Optional: Brief testing to ensure build works)

10. Testing Checklist
🔴 MANDATORY - Top 10 Critical Items (Must Work)
These are NON-NEGOTIABLE for demo submission:
Player movement - Arrow keys (Left/Right) moves player smoothly
Jump mechanics - Spacebar makes player jump, feels responsive
Platform collision - Player lands on platforms, doesn't fall through
Void death - Falling below map kills player
Coin collection - Touching coin makes it disappear and updates counter
Lives system - Deaths decrement lives, game over at 0 lives
Respawn - Death respawns player at level start with coins reset
Level completion - Collecting all coins triggers level complete
Level progression - Can advance from Level 1 → 2 → 3
No crashes - Can play all 3 levels without game-breaking bugs
If these 10 work, you have a submittable demo.

⚪ IMPORTANT - Secondary Features (Highly Recommended)
Animation:
Idle animation plays when standing still
Walk animation plays when moving
Sprite flips correctly based on movement direction
Animation continues (idle or walk) when airborne (no jump animation available)
UI Elements:
Coin counter displays correctly (X / Y format)
Lives display shows current lives (hearts or number)
Level complete screen appears
Game over screen appears at 0 lives
Victory screen appears after Level 3
Audio:
Jump sound plays when jumping
Coin sound plays when collecting coin
Death sound plays when dying
Background music loops during gameplay

🟢 NICE TO HAVE - Polish Features (If Time Permits)
Visual Effects:
Particle effect on coin collection
Screen shake on death (subtle)
Fade transitions smooth between levels
Background art or gradient
Juice & Feel:
Coyote time (can jump briefly after leaving platform)
Jump buffering (jump input queues before landing)
Squash/stretch animation on landing (advanced - requires extra animation frames)
Balance & Design:
Level 1 feels tutorial-easy
Level 2 feels appropriately harder
Level 3 feels challenging but fair
3 lives feels like right difficulty (not too easy/hard)

Edge Cases to Test
Can player jump while already in air? (should be no - single jump only)
What happens if player pauses mid-air? (no pause for demo)
Coins respawn correctly after death
Can't progress to next level without all coins
Game over triggers correctly at 0 lives
Restart button works from game over screen
Music doesn't restart every respawn (keeps looping)
Sprite doesn't get stuck facing wrong direction

11. Success Criteria
The demo is considered successful if:
✅ Player can move and jump smoothly ✅ All 3 levels are playable and completable ✅ Coin collection works and tracks correctly ✅ Lives system functions (death → respawn → game over) ✅ Level progression works (1 → 2 → 3 → Victory) ✅ Animations play correctly (idle, walk, jump) ✅ Audio enhances the experience (jump, coin, death sounds minimum) ✅ No game-breaking bugs or crashes ✅ Game has clear win condition (complete Level 3) ✅ Game has clear lose condition (0 lives = game over)

12. Out of Scope (Post-Demo)
These features are NOT included in the demo but could be added later:
❌ Double jump mechanic ❌ Wall jump / wall slide ❌ Dash ability ❌ Enemies or hazards (spikes, moving obstacles) ❌ Moving platforms ❌ Collectible power-ups ❌ Timer/speedrun mode ❌ Checkpoints within levels ❌ More than 3 levels ❌ Save/load system ❌ Settings menu (volume control, key rebinding) ❌ Leaderboards or scoring system ❌ Different slime skins/colors ❌ Environmental hazards (falling rocks, etc.)

13. Risk Management
High Risk Areas
Jump Feel: Getting jump to feel good is critical
Mitigation: Test early and often, adjust JUMP_VELOCITY and gravity values
Level Design: Making levels fun and balanced
Mitigation: Start simple (Level 1), playtest frequently, adjust platform spacing
Time Constraint: Only 2 days
Mitigation: Focus on core loop first, polish is secondary
Contingency Plans
If behind schedule Wednesday night: Skip Level 3, make 2-level demo instead
If jump feels bad by Wednesday evening: Simplify physics, use standard values, move on
If level design takes too long: Use very simple rectangular platforms, no fancy layouts
If Thursday evening incomplete: Cut victory screen, just show "Level 3 Complete - Demo End" text
If audio not working: Submit without sound, focus on gameplay working perfectly

14. Post-Demo Extensions (Future)
If the demo goes well, these could be added later:
Phase 2 Additions:
More levels (5-10 total)
Different level themes (forest, cave, sky)
Moving platforms
Enemy slimes that patrol
Spikes and hazards
Checkpoints within levels
Power-ups (speed boost, high jump)
Phase 3 Additions:
Boss levels
Different playable slime characters
Level editor
Speedrun timer and leaderboards
Achievement system
Save/load progress
Settings menu

15. Technical Notes & Tips
Godot-Specific Implementation Tips
Player Movement (CharacterBody2D):
Use smooth acceleration and friction values for responsive feel
ACCELERATION constant controls how quickly player reaches max speed
FRICTION constant controls how quickly player stops when no input
move_toward() function creates smooth velocity transitions
Coin Collection:
Coin uses Area2D node to detect overlap with player
When player body enters coin's area, emit collection signal
Coin removes itself from scene (queue_free)
GameManager increments coin counter
Void Death Detection:
VoidZone is an Area2D positioned below the entire level
When player falls and enters VoidZone, triggers death
Player script handles death by calling respawn function
Respawn resets player position and decrements lives
Camera Follow:
Camera2D attached to player or positioned in level
Enable position_smoothing for smooth camera movement
Adjust smoothing_speed for desired camera lag
Set camera limits to prevent showing area outside level bounds
Recommended Values
Gravity: Use Godot's default (980) or increase to 1500-2000 for snappier platformer feel
Jump Velocity: -400 to -500 (negative is upward)
Movement Speed: 150-250 pixels per second
Player Collision Size: 32x32 or 64x64 pixels
Coin Size: 16x16 or 24x24 pixels

16. Asset Checklist
Visual Assets Needed
Slime character sprites with animations (Idle, Walk, Jump)
Platform tiles (can be simple colored rectangles)
Coin sprite (static or simple animation)
Background (solid color, gradient, or image)
UI elements (heart icons for lives, fonts)
Level complete/Game over/Victory screen graphics (optional, can be text)
Audio Assets Needed
Jump sound effect (squishy bounce sound for slime)
Coin collection sound effect
Death/fall sound effect (sad squish)
Background music (upbeat, looping)
Level complete jingle (optional)
Game over sound (optional)
Data Assets to Create
Level layouts using Rocky Roads TileMap (platform positions, coin placements for 3 levels)
Player stats (speed, jump height, etc.)
Game constants (starting lives, gravity, etc.)

17. Contact & Resources
Useful Godot Resources
Official Godot Docs: https://docs.godotengine.org
Platformer tutorials: Search "Godot 2D platformer tutorial"
CharacterBody2D documentation
AnimatedSprite2D documentation
Asset Sources
Kenney.nl (huge free asset library)
itch.io (free 2D platformer packs)
OpenGameArt.org (community assets)
freesound.org (free sound effects)
Community Help
Godot Discord/Reddit for technical questions
Keep questions specific to your implementation

Document Version
Version: 1.0
 Date: Wednesday, January 22, 2026
 Status: Ready for Development
 Development Period: Wednesday-Thursday (2 days)
 Delivery Deadline: Friday, January 24, 2026

