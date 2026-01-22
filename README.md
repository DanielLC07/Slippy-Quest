# Slippy-Quest
A cute and fast-paced 2D platformer where you play as a small bouncing slime. Jump through handcrafted levels, avoid hazards, and collect every coin to complete each stage. With smooth controls, colorful visuals, and satisfying movement, every jump brings you closer to victory.

# Slippy-Quest – Game Design Document (Final Version)

**Version:** 1.2  
**Status:** In Process  
**Date:** January 22, 2026  
**Development Time:** 2 Days (Wed–Thu)  
**Delivery:** Friday, January 23, 2026

---

## 1. Game Overview

### 1.1 Concept
Slippy-Quest is a simple 2D platformer where a small slime collects coins across several short levels. The core goals are responsive movement, clear objectives, and functional progression. The project is designed as a compact technical demo made in Godot 4.

### 1.2 Demo Scope
The demo includes 3 short levels, each slightly harder than the last. The player must collect all coins to unlock the next level. Falling into the void causes death and reduces lives.

### 1.3 Deadline
Finished demo delivered Friday, Jan 24.

---

## 2. Core Mechanics

### 2.1 Player Movement
- Move left/right
- Jump
- Air control
- Friction + acceleration
- Max horizontal speed

### 2.2 Physics
- Gravity
- Jump impulse
- Smooth horizontal damping

### 2.3 Animations
- Idle
- Walk
- No jump animation (uses idle in air)

### 2.4 Coins
- Disappear when touched
- Increase counter
- Collect all → level complete

### 2.5 Death
- Touching void triggers death
- Lose a life → respawn
- 0 lives = Game Over

### 2.6 Lives
- Start with 3 lives
- Shown on HUD

---

## 3. Level Design

### 3.1 Levels
- **Level 1:** Basic jumps
- **Level 2:** Slightly harder layout
- **Level 3:** Narrower platforms

### 3.2 Platforms
- Static platforms only
- One void area per level

### 3.3 Progression
Beat Level 1 → 2 → 3 → Victory screen.

---

## 4. UI / UX

### 4.1 HUD
- Coin counter
- Lives
- Level indicator (optional)

### 4.2 Game States
- Gameplay
- Level complete (brief pause)
- Game Over
- Victory

---

## 5. Audio

### 5.1 SFX
- Jump
- Coin
- Death

### 5.2 Music
- Simple looping background music
- Optional short victory jingle

---

## 6. Visual Assets

### 6.1 Already Available
- Slime sprite (Idle + Walk)
- Tileset
- Coin animation
- Simple background

### 6.2 Needed
- Basic HUD icons

---

## 7. Technical Specifications

### 7.1 Engine
Godot 4.5.4

### 7.2 Scene Layout
```
Main
 ├─ Level1
 ├─ Level2
 ├─ Level3
 └─ UI
```

### 7.3 Main Nodes
- **CharacterBody2D** → Player
- **TileMap** → Platforms
- **Area2D** → Coins, Void
- **Camera2D**
- **Control** → HUD

### 7.4 Scripts
- `Player.gd`
- `Coin.gd`
- `GameManager.gd`
- `LevelController.gd`
- `VoidZone.gd`

---

## 8. Game Flow

1. Start Level 1
2. Collect all coins
3. Next level
4. Lose life if falling
5. Run out of lives = Game Over
6. Finish Level 3 = Victory

---

## 9. Development Roadmap

### Day 1
- Player movement
- Level 1 layout
- Coin system
- Death + respawn
- HUD basics

### Day 2
- Level 2 + 3
- Level transitions
- Game Over + Victory
- Basic SFX
- Testing

---

## 10. Testing Checklist

### Required
- Movement works
- Coin collection works
- Level progression functional
- Death + respawn correct
- HUD updates correctly
- All 3 levels playable
- No crashes

### Optional Polish
- Simple particles
- Slight camera smoothing

---

## 11. Success Criteria

- All 3 levels playable
- Clear progression
- Stable gameplay
- Functional HUD
- No major bugs

---

## 12. Out of Scope

- Enemies
- Special power-ups
- Moving platforms
- Cutscenes
- Saving system
- Additional biomes
- More than 3 levels

---

## 13. Risks

- Time limitation
- Bugs in movement
- Scene routing issues

---

**End of Document**
