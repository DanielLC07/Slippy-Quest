# Slippy-Quest
A cute and fast-paced 2D platformer where you play as a small bouncing slime. Jump through handcrafted levels, avoid hazards, and collect every coin to complete each stage. With smooth controls, colorful visuals, and satisfying movement, every jump brings you closer to victory.

# Slippy-Quest - Game Design Document

## 1. Game Overview

### 1.1 Concept
A 2D platformer where a slime character traverses multiple levels. The player must reach the end of each level to progress to the next. Built in Godot Engine as a technical demo showcasing fundamental platformer mechanics.

### 1.2 Demo Scope
- Three progressively challenging levels featuring platform navigation and void hazards.  
- Focuses on tight movement controls, precise jumping mechanics, and level completion gameplay.  

**Clear Objective:** Reach the end of the level to unlock the next one. Avoid falling into the void. Complete all 3 levels to win the demo.

### 1.3 Target Completion
- Friday delivery deadline — 2 days total development time (Wednesday-Thursday).

---

## 2. Core Mechanics

### 2.1 Player Movement
- **Horizontal Movement:** Arrow keys (Left/Right)  
- **Jump:** Spacebar  
- **Movement Type:** Smooth platformer physics (acceleration/deceleration)  

**Jump Mechanics:**
- Single jump only (no double jump for demo)  
- Variable jump height (hold jump for higher jump)  
- Coyote time (brief grace period after leaving platform)  
- Jump buffering (jump input registers slightly before landing)  

### 2.2 Physics System
- Gravity: Standard downward force  
- Friction: Ground friction for stopping movement  
- Max Speed: Cap on horizontal velocity  
- Jump Force: Upward impulse force  
- Air Control: Reduced but present horizontal control while airborne  

### 2.3 Animation States
- Idle: Standing still  
- Walk/Run: Moving left or right  
- No jump animation available — Idle animation used when airborne  

---

## 3. Level Design

### 3.1 Level Structure
- **Total:** 3 Levels  

**Level 1 - Tutorial/Easy:**  
- Simple platform layout, wide platforms, short gaps  
- No difficult jumps  
- Goal: Teach basic movement and jumping  

**Level 2 - Intermediate:**  
- Narrower platforms, larger gaps requiring precise jumps  
- Introduce vertical platforming  
- Goal: Test player's mastery of controls  

**Level 3 - Challenge:**  
- Complex platform arrangements, long jump sequences  
- Narrow platforms over void  
- Goal: Final test of skill  

### 3.2 Platform Types
- Static Platforms: Non-moving solid platforms  
- Ground: Bottom solid area (above void)  
- Void Zone: Area below platforms where player dies  

### 3.3 Level Progression
- Level 1 Complete → Transition → Level 2  
- Level 2 Complete → Transition → Level 3  
- Level 3 Complete → Victory Screen → End Demo  

**Progression Trigger:** Reaching the end-of-level Area2D triggers level transition.

---

## 4. UI/UX Design
- ❌ No HUD or lives display.  
- Optional: Simple “Level Complete” or “Victory” screens.  
- Visual feedback: fade transitions on level change and death.

---

## 5. Audio Design

- **High Priority:**  
  - Jump sound (quick “boing” or “hop”)  
  - Death sound (falling into void)  
- **Medium Priority (Optional):**  
  - Level complete jingle  
  - Victory fanfare  
- Background music: looping track for gameplay  

---

## 6. Visual Assets

- Slime character sprites (Idle, Walk)  
- Platform tiles (Rocky Roads asset pack)  
- Background (simple gradient or parallax)  
- End-of-level Area2D marker (invisible or subtle)  
- Optional: Victory/Level Complete screen graphics  

---

## 7. Technical Specifications

- **Engine:** Godot 4.5.4, 2D project setup  
- **Key Nodes:**  
  - Player: CharacterBody2D  
  - Platforms: TileMap  
  - Camera: Camera2D  
  - Void Zone: Area2D  
  - EndZone: Area2D to trigger next level  
- **Core Scripts:**  
  - Player.gd — Movement, jump, animation  
  - VoidZone.gd — Detect fall  
  - EndZone.gd — Detect level completion  

---

## 8. Game Flow

1. Game Start → Level 1 loads  
2. Player moves through platforms  
3. Player reaches **EndZone** → Level Complete → Next Level  
4. Fall into void → Respawn at level start  
5. Repeat for Level 2 → Level 3  
6. Level 3 complete → Victory Screen → End  

**Respawn System:**  
- Player falls into void → respawns at level start  
- Fade transition smooth  
- Player starts over the same level  

---

## 9. Development Roadmap

### Day 1 - Wednesday
- Setup Godot project, import assets  
- Implement player movement, jump physics  
- Build Level 1 layout  
- Implement Camera2D follow  
- Implement VoidZone (death on fall)  
- Implement EndZone (level completion trigger)  

### Day 2 - Thursday
- Build Levels 2 & 3  
- Test level progression  
- Implement victory/level complete screens  
- Integrate sound effects and background music  
- Polish: fade transitions, platform spacing, visual tweaks  
- Final playthrough for bugs and timing  

---

## 10. Testing Checklist

**Critical Items:**
- Player moves and jumps smoothly  
- Platforms collide correctly  
- Falling into void respawns player  
- Reaching EndZone triggers next level  
- Level 3 completion shows victory screen  
- No crashes or game-breaking bugs  

**Nice-to-Have:**
- Smooth fade transitions  
- Background music loops seamlessly  
- Optional level complete/victory sound  

---

## 11. Success Criteria

- Player can move and jump smoothly  
- All 3 levels playable and completable  
- End-of-level trigger works reliably  
- Death and respawn work correctly  
- Victory screen appears after final level  
- Game is stable and free of major bugs  

---

## 12. Out of Scope (Post-Demo)

- Coins and coin collection  
- Lives system / HUD  
- Enemies or hazards (spikes, moving obstacles)  
- Power-ups or double jump  
- Moving platforms, checkpoints  
- Save/load system or settings menu  

---

## 13. Risk Management

**High Risk Areas:** Jump feel and level progression  
- Mitigation: test early, adjust physics constants, start simple with Level 1  

**Time Constraint:** 2 days  
- Mitigation: focus on core loop, polish optional  

---

## 14. Post-Demo Extensions (Future)

- Add coins or collectibles later  
- More levels, moving platforms, enemies  
- Checkpoints and power-ups  
- Leaderboards, achievements, slime variants  

---

## 15. Contact & Resources

- **Godot Docs:** [https://docs.godotengine.org](https://docs.godotengine.org)  
- Tutorials: search “Godot 2D platformer tutorial”  
- Assets: Kenney.nl, itch.io, OpenGameArt.org
- Itchio page Link : https://daniellc07.itch.io/slippy-quest

**Version:** 1.1  
**Date:** Wednesday, January 22, 2026  
**Status:** Project in Process

