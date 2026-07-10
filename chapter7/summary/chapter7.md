# 📖 Head First OOA&D — Chapter 7 Summary

## *Architecture: Bringing Order to Chaos*

> **Goal of this chapter:** Take all those feature lists, use case diagrams, modules, and MVC patterns from Chapter 6 — and turn that chaotic pile into a **well-ordered application**. Learn what **architecture** really means, how to find what's **architecturally significant**, how to use the **3 Qs of architecture** to prioritize work, and how to reduce **RISK** by tackling the hardest and most important features first. Then actually start building: design the `Board`, `Tile`, and `Unit` classes and wire up the first key features of Gary's Game System Framework.

---

## 🗺️ Chapter Overview

Chapter 7 picks up exactly where Chapter 6 left off. We have everything we need to start building — a feature list, a use case diagram, five modules (Board, Units, Game, Controller, Utilities), and the MVC pattern — but everything still feels like a mess. The chapter has four phases:

1. **Define architecture** — what it is and why you need it
2. **Apply the 3 Qs** — find what's architecturally significant and prioritize it
3. **Reduce RISK** — build the important/hard things first, not the easy things
4. **Build iteratively** — tackle one key feature at a time, using scenarios to validate

---

## 🏗️ What Is Architecture?

Starting from the mess of Chapter 6 — all those feature lists, diagrams, modules — the book makes a key point:

> **Architecture is your design structure, and highlights the most important parts of your app, and the relationships between those parts.**

The formal definition from the Scholar's Corner:

> **Architecture** is the organizational structure of a system, including its decomposition into parts, their connectivity, interaction mechanisms, and the guiding principles and decisions that you use in the design of a system.

In plain terms: architecture is the answer to **"how does this whole thing fit together, and what matters most?"**

Your use case diagram was a starting point, but it didn't tell you how the modules interact or which parts of the system are the most critical to build first. That's what architecture fills in.

```
FROM THIS (chaos):              TO THIS (order):

Feature list     Modules             Well-ordered
Use case diagram ──────────►        application where
MVC pattern      Vision              all the pieces
All scattered    statement           fit together
```

---

## 🎯 The 3 Qs of Architecture

The chapter introduces a concrete tool for figuring out what is **architecturally significant** — i.e., which features and parts of the system you should focus on **first**.

When looking at any feature on your list, ask these three questions:

### Q1 — Is it part of the **essence** of the system?

> The essence of a system is what that system is at its most basic level.

Ask yourself: if this feature wasn't implemented, would the system still really be what it's supposed to be? If the answer is **no** — if removing it means the system fundamentally stops being itself — then it's part of the **essence**, and it's architecturally significant.

**Example for Gary's framework:**
- "The framework provides a board made up of square tiles" → You can't have a board game without a board. **Essence. Significant.**
- "The framework supports add-on modules" → Useful, but the game still works without it. Not essence.

### Q2 — What the heck does it **mean**?

> If you're not sure what the description of a particular feature **really means**, it's probably very important that you pay attention to it early.

Uncertainty about a feature is a signal. If you don't know what something means, it could take weeks to figure out. Spend time on these features early, rather than discovering the problem late.

**Example:**
- "Game-specific units — essence, and **what does this mean?**" → We don't know what game-specific units actually look like in code. That ambiguity itself flags it as architecturally significant.

### Q3 — How the heck do I **do** it?

> Another place to focus attention early is on features that seem **really hard** to implement, or that are **totally new** programming tasks for you.

If you have no idea how you're going to handle a particular feature, it could create problems for the whole project if you ignore it. The hard tasks go to the front of the line.

**Example:**
- "The framework coordinates basic movement — what is it, and **how do we do it?**" → Movement coordination is vague and technically unclear. That's risk. Build it early.

---

## ⚖️ Applying the 3 Qs to Gary's Feature List

Running the 3 Qs against all seven features narrows them down to three **key features** — the ones that are architecturally significant:

| Key Feature | Why It's Significant |
|---|---|
| **1. The board for the game** | Q1 — essence of the system. Without a board, there's no board game. |
| **2. Game-specific units** | Q1 + Q2 — they're essential to gameplay AND we're not sure what "game-specific" means in code. |
| **3. Coordinating basic movement** | Q2 + Q3 — vague description AND we're not sure how to implement it. |

```
Gary's Game System Framework
KEY Features

1. The board for the game — essence of the system
2. Game-specific units — essence, and what does this mean?
3. Coordinating movement — what is it, and how do we do it?
```

> **The things in your application that are really important are architecturally significant, and you should focus on them FIRST.**

---

## ⚠️ Architecture Is About Reducing RISK

This is the chapter's central insight. Three developers argue about which key feature to work on first: Jim says build the board (it's the essence), Joe says clarify game-specific units (we don't understand it), Frank says tackle movement coordination (it's the hardest).

Jill steps in and settles it:

> **They're all right. The problem isn't which feature to start with — the problem is RISK.**

The reason these features are architecturally significant is that they all **introduce risk** to your project:

- If the board (the essence) isn't right → risk the customer won't like the system
- If we don't know what "game-specific units" means → risk it takes weeks and blows the schedule
- If we can't figure out movement coordination → risk it breaks the whole framework

**It doesn't matter which one you start with** — as long as you are always working to **reduce the risks** to your project succeeding. You can start with ANY of the key features.

> **The point is to REDUCE RISK, not to argue over which key feature you should start with first.**

---

## 🏗️ Step 1: Build the Board — Architecture Puzzle

Starting with the board (key feature #1 — essence of the system), the book walks through a complete implementation cycle:

### Requirements (from Gary + domain analysis)

- You need a `Board` base type that game designers can use to create new games
- The board's height and width are supplied by game designers
- The board can return the tile at a given position (x, y)
- The board can add units to a tile at a given position
- The board can return all units at a given position

### The Board class (Java → adapted to Dart concept)

```dart
// Package: headfirst.gsf.board
class Board {
  final int width;
  final int height;
  late List<List<Tile>> tiles;  // 2D array of tiles

  Board(this.width, this.height) {
    _initialize();
  }

  // Pull setup into its own method — keeps constructor readable
  void _initialize() {
    tiles = List.generate(
      width,
      (i) => List.generate(height, (j) => Tile()),
    );
  }

  Tile getTile(int x, int y) {
    return tiles[x - 1][y - 1];
  }

  void addUnit(Unit unit, int x, int y) {
    getTile(x, y).addUnit(unit);
  }

  void removeUnit(Unit unit, int x, int y) {
    getTile(x, y).removeUnit(unit);
  }

  void removeUnits(int x, int y) {
    getTile(x, y).removeUnits();
  }

  List<Unit> getUnits(int x, int y) {
    return getTile(x, y).getUnits();
  }
}
```

**Key design decisions in Board:**
- `Board` delegates all unit-related operations to `Tile` — it doesn't store units itself
- `addUnit()` and `removeUnit()` on `Board` are the public entry point for game designers; `Tile`'s methods are `protected` so only `Board` can call them directly
- Setup code pulled into `_initialize()` → keeps the constructor clean (SRP bonus design principle)

### The Tile class

```dart
// Package: headfirst.gsf.board (same package as Board)
class Tile {
  final List<Unit> _units = [];

  // protected — only Board (in the same package) can call these
  void addUnit(Unit unit) => _units.add(unit);
  void removeUnit(Unit unit) => _units.remove(unit);
  void removeUnits() => _units.clear();
  List<Unit> getUnits() => List.unmodifiable(_units);
}
```

### The Unit class (minimal stub)

```dart
// Package: headfirst.gsf.unit
class Unit {
  Unit();
  // Intentionally bare — details come when we tackle Key Feature #2
}
```

> **Keep the right focus.** You don't need to worry about everything `Tile` and `Unit` will eventually do. Your focus is on making `Board` and its key features work — not on completing `Tile` or `Unit`. Do just enough to get the current key feature working and reduce risk.

### The resulting class diagram

```
┌─────────────────────────────────────────┐
│ Board                                   │
│ width: int                              │
│ height: int                             │
│ tiles: Tile[*][*]                       │──────────────┐
│ getTile(int, int): Tile                 │              │
│ addUnit(Unit, int, int)                 │    ┌─────────▼──────────────┐
│ removeUnit(Unit, int, int)              │    │ Tile                   │
│ removeUnits(int, int)                   │    │ units: Unit [*]        │
│ getUnits(int, int): List                │    │ addUnit(Unit)          │
└─────────────────────────────────────────┘    │ removeUnit(Unit)       │
                                               │ getUnits(): List       │
                                               │ removeUnits()          │
                                               └──────────┬─────────────┘
                                                          │ units
                                                          ▼  *
                                                    ┌──────────┐
                                                    │  Unit    │
                                                    └──────────┘
```

---

## 🎬 Using Scenarios to Validate and Reduce Risk

After building `Board`, how do we know it actually works for real gameplay? That's where **scenarios** come in.

### What Is a Scenario?

A scenario is an informal, lightweight path through a piece of functionality — not as detailed as a use case, but enough to verify that what you've built covers real usage.

> **Scenario:** A description of how the system is actually used, written in plain terms without full use case formality. It gives you the advantages of a use case without forcing you into all the detail you don't need right now.

**Use case** = formal, all alternate paths, every step.
**Scenario** = informal, one realistic path, just enough to catch missing requirements.

### The Board Scenario

```
Gary's Game System Framework — Board Scenario

Game designer creates board with a height and width.

Player 2 moves tanks onto (4, 5).
Player 2 moves army onto (4, 5).
Player 1 moves artillery onto (4, 5).
Game requests units from (4, 5).
Player 1 battles Player 2.
                                    Game requests terrain at (4, 5).
                                    Player 2's units win the battle.
                                    Player 1's units are removed from (4, 5).
                                    Player 1 moves subs to (2, 2).
                                    Game requests terrain at (2, 2).
```

### What the Scenario Revealed

Running through the scenario exposed a **missing requirement**: the scenario involved removing units from a tile, but the original requirements had no `removeUnit()` method. The scenario caught the gap — `removeUnit()` and `removeUnits()` were added to both `Board` and `Tile`.

> **Scenarios are risk reducers.** They let you check that your Board interface actually handles real gameplay — before Gary sees the work and finds a mistake.

---

## 🔄 Step 2: Game-Specific Units — Commonality Revisited

After the board, the team moves to key feature #2: **game-specific units** (architecturally significant because we don't know what it means). Listening to game designers reveals the problem:

- Strategy game designers: units have `attack`, `experience`, `defense`
- Sci-fi designers: units have `armies with lasers`, `spaceships`
- Air battle designers: units have `speed`, `gun`, `model`
- Realistic game designers: units have `ages`, `relationships between characters`

Every game type has a completely different set of unit properties. No two games' units look the same.

**First instinct (Solution #1 — Wrong):** Create subclasses `Tank`, `Soldier`, `Airplane` each with their own hardcoded properties.

```
// PROBLEM: nothing in common goes into Unit base class
// Every new game type = new subclasses = more fragile code
class Unit {}
class Tank extends Unit { double attack; double experience; double defense; }
class Soldier extends Unit { Weapon weapon; String name; }
class Airplane extends Unit { int speed; Weapon gun; String model; }
```

This approach fails because:
- Nothing common between Tank, Soldier, Airplane → `Unit` base class is empty
- Adding a new game type = adding new subclasses
- Properties vary completely by game; the design can't scale

### Going Deeper — Real Commonality

The book applies **commonality analysis** one level deeper. Instead of looking at the *names* of the properties, look at the *structure* of the properties across all unit types:

```
Tank:     attack = 12       type = "tank"
          experience = 22   propertyName = propertyValue
          defense = 9.5

Soldier:  weapon = Bazooka  type = "soldier"
          name = "Simon"    propertyName = propertyValue

Airplane: speed = 110       type = "airplane"
          gun = Gatling     propertyName = propertyValue
          model = "A-10"
```

**What's really common:** Every unit, regardless of game type, has:
1. A **type** (what kind of unit it is)
2. A set of **properties**, each of which is a **name/value pair**

> **Commonality is about more than just the names of properties — you need to look a little bit deeper.**

### Solution #2 — The `Map` Approach (Right)

This is the same insight as from Chapter 5 Part 2 with `InstrumentSpec`. Instead of hardcoding properties as fields, store them in a `Map<String, Object>`:

```dart
class Unit {
  final String _unitType;
  final Map<String, Object> _properties = {};

  Unit(this._unitType);

  String getType() => _unitType;

  void setProperty(String propertyName, Object propertyValue) {
    _properties[propertyName] = propertyValue;
  }

  Object? getProperty(String propertyName) => _properties[propertyName];
}
```

Now game designers can create any type of unit with any set of properties, without the framework needing to know anything specific about them:

```dart
// Historical war game
final tank = Unit("tank");
tank.setProperty("attack", 12.0);
tank.setProperty("experience", 22.0);
tank.setProperty("defense", 9.5);

// Sci-fi game
final spaceship = Unit("spaceship");
spaceship.setProperty("speed", 1500);
spaceship.setProperty("laserCount", 8);
spaceship.setProperty("shieldStrength", 95.0);

// Fantasy game
final ranger = Unit("ranger");
ranger.setProperty("weapon", "Longbow");
ranger.setProperty("name", "Aragorn");
ranger.setProperty("age", 87);
```

**Benefits:**
- Zero new classes needed for any new game type
- `Unit` base class is now concrete and genuinely useful
- Game designers extend `Unit` with game-specific subclasses when they need different *behavior*, but the `Map` handles all property variability
- Same principle as Chapter 5 Part 2: **encapsulate what varies — the properties themselves — inside a Map**

### The Updated Class Diagram

```
┌──────────────────────────────────────┐
│ Unit                                 │
│ type: String                         │
│ properties: Map<String, Object>      │
│ getType(): String                    │
│ setProperty(String, Object)          │
│ getProperty(String): Object          │
└──────────────────────────────────────┘
         ▲            ▲           ▲
         │            │           │
    ┌────┴───┐  ┌─────┴──┐  ┌───┴────┐
    │  Tank  │  │Soldier │  │Airplane│
    │ (game  │  │ (game  │  │ (game  │
    │specific│  │specific│  │specific│
    │behavior│  │behavior│  │behavior│
    │ only)  │  │ only)  │  │ only)  │
    └────────┘  └────────┘  └────────┘
```

> **SRP in action:** The `Unit` class has one job — store unit data using a flexible property map. Game-specific behavior lives in subclasses. No class is doing too many things.

---

## 🔁 The Architecture Feedback Loop

Once key feature #1 (Board) and key feature #2 (game-specific units) are handled, the team reassesses. Architecture isn't a one-time activity:

```
1. Identify key features (using 3 Qs)
          ↓
2. Start with one key feature
          ↓
3. Build just enough to reduce risk
          ↓
4. Use a scenario to validate
          ↓
5. Move to next key feature — build on what exists
          ↓
6. Repeat until all key features are handled
          ↓
7. Go back and add remaining features using full OO principles
```

After building `Board` and `Unit`, the team has:
- Some basic classes in place
- A clearer picture of how the modules interact
- Reduced the biggest risks (Board is built; unit properties are solved)
- Structure to talk about relationships between parts

> **Build on what you've already got done whenever possible.** When you only have requirements and diagrams, you just pick a place to start. Once you have code and classes, pick the next key feature that relates to what you've already built.

---

## 🧰 OOA&D Toolbox — Chapter 7 Additions

```
┌─────────────────────────────────────────────────────────────┐
│ Architecture                                                │
│                                                             │
│ • Architecture is your design structure — the most         │
│   important parts of your app and their relationships       │
│                                                             │
│ • Use the 3 Qs to find what's architecturally significant: │
│   Q1: Is it part of the ESSENCE of the system?             │
│   Q2: What does it MEAN (is it unclear/ambiguous)?         │
│   Q3: How the heck do I DO it (is it hard/new to you)?     │
│                                                             │
│ • Architecturally significant features all introduce RISK  │
│   → work on them first to REDUCE that risk                 │
│                                                             │
│ • Focus on one feature at a time to reduce risk            │
│ • Don't get distracted with features that won't help       │
│   reduce risk                                              │
│                                                             │
│ • Use scenarios (informal use case paths) to validate      │
│   that your code covers real usage before moving on        │
│                                                             │
│ • Build on what you've already done whenever possible      │
└─────────────────────────────────────────────────────────────┘
```

---

## ✅ Key Takeaways

- **Architecture = design structure + most important parts + relationships between them.** It's not just modules — it's knowing which modules matter most and how they connect.
- **The 3 Qs of architecture** identify what's architecturally significant: essence (Q1), meaning/clarity (Q2), and difficulty/novelty (Q3). A feature that triggers any one of these is architecturally significant.
- **Architecture is about reducing RISK.** The reason to work on architecturally significant features first isn't because they're the most "important" in a business sense — it's because they introduce the most risk to the project. Tackle them early and eliminate that risk.
- **It doesn't matter which key feature you start with** — what matters is that you're always working toward reducing risk. Don't waste time arguing about order; pick one and go.
- **Scenarios are lightweight use cases.** When you don't have a full use case, or when writing one would be overkill at this stage, a scenario gives you the key benefits: a realistic path through functionality that reveals missing requirements and validates what you've built.
- **Focus on one feature at a time.** Don't get distracted with `Unit` details when you're building `Board`. Do just enough of the supporting classes to get the key feature working.
- **Commonality requires looking deeper than property names.** Tanks, soldiers, and airplanes look completely different at the property name level. But at a deeper structural level, they all have a type and a set of name/value property pairs — and that common structure is what the `Unit` class should model.
- **The Map pattern recurs.** The `Unit` class uses `Map<String, Object>` to store arbitrary game-specific properties — the same pattern as `InstrumentSpec` in Chapter 5 Part 2. When properties vary across types and you can't know them in advance, a Map beats hardcoded fields every time.
- **Build on what you have.** After building `Board` and a basic `Unit`, you have both classes in place to talk about how they interact. The architecture starts coming into focus through incremental construction.
- **Architecture reduces chaos.** A big chaotic pile of feature lists, diagrams, and modules becomes a well-ordered application when you apply the 3 Qs, identify the key features, and build them one at a time.

---

## ⚠️ Common Mistakes

### ❌ Mistake 1: Treating all features as equally important

Not all features introduce the same amount of risk. Features that answer "no" to all three Qs — they're not essential, they're clear, and they're easy to implement — can wait. Don't waste early architectural focus on safe, well-understood features.

### ❌ Mistake 2: Arguing about which key feature to tackle first

The three programmers (Jim, Joe, Frank) all had valid points. But spending time arguing about it is itself a risk — you're not building anything. Pick one key feature and start. As long as you're reducing risk, the order is secondary.

### ❌ Mistake 3: Building too much of the supporting classes upfront

When building `Board`, there was a temptation to fully flesh out `Tile` and `Unit` at the same time. Resist it. Make them just complete enough to support the key feature you're working on. `Unit` started with literally just a constructor. That's fine — finish it when you tackle the game-specific units key feature.

### ❌ Mistake 4: Stopping at surface-level commonality

Looking at Tank, Soldier, and Airplane, it's easy to conclude "there's nothing in common" because their property *names* are all different. That's surface level. Go deeper: structurally, they all have a type and a set of name/value pairs. That structural commonality is what makes the `Map` approach work.

### ❌ Mistake 5: Skipping scenarios when you're in a hurry

A scenario takes 10 minutes to write and can catch missing requirements before Gary sees your work. The "Board Scenario" exercise immediately revealed `removeUnit()` was missing from the requirements. Without the scenario, that gap would have been discovered in a demo — which is a much more expensive time to find it.

### ❌ Mistake 6: Thinking architecture is a one-time activity

Architecture is iterative. You apply the 3 Qs, build the first key feature, then **reassess** before moving to the next one. What you've built changes your understanding of the system. The architecture keeps evolving as you work through the key features.

---

## ❓ There's No Dumb Questions

**Q: Do I have to use all three Qs on every feature, or is just one enough to flag something as significant?**

A: Just one is enough. Any Q that applies makes the feature architecturally significant. A feature that is part of the essence (Q1) doesn't also need to be unclear (Q2) or hard (Q3) to be worth working on early. Think of the three Qs as independent flags — one flag raised = significant.

---

**Q: What's the difference between a scenario and a use case again?**

A: A use case is a formal, thorough document describing all paths (main path + alternate paths) through one actor-system interaction. It's great for making sure requirements are complete. A scenario is just one path through the system — informal, conversational, no required structure. A scenario gives you enough to validate that your code handles real-world usage without pulling you into the detail overhead of a full use case. Think of a scenario as "one walk through the system to make sure nothing obvious is missing."

---

**Q: If the Map approach works great for Unit properties, why not use it for everything?**

A: There's a trade-off. The Map gains flexibility but loses compile-time type safety — you can put anything in it, including mistakes. For properties that are well-known and fixed (like `Board`'s `width` and `height`), explicit fields are better because the compiler will catch type errors. The Map approach is the right tool when the set of properties varies unpredictably across instances and you can't know them at design time — exactly the situation with game-specific units.

---

**Q: Why did we use a 2D array (List of Lists) for the Board's tiles instead of something more flexible?**

A: Because our requirements specified (x, y) coordinates and a rectangular board. A 2D array is the simplest structure that satisfies those requirements. Yes, it locks us into rectangular boards — but at this stage, we're trying to reduce risk by building the simplest solution that works, not maximize flexibility. If requirements changed to support hex grids later, we'd revisit. At this stage, going with a more complex data structure would actually *increase* risk by adding complexity we don't need.

---

**Q: After handling all three key features, what happens to the other four features on the list?**

A: Once the key features are handled and the major risks are reduced, you go back and implement the remaining features using all the OOA&D principles you know — requirements, use cases, OO design, cohesion, loose coupling. By then, you have a solid structure in place (Board, Tile, Unit, the Map approach), and adding features like "support add-on modules" or "support different time periods" becomes a matter of extending what's there rather than trying to figure out the whole system from scratch.

---

## 📚 Key Terminology

| Term | Definition |
|---|---|
| **Architecture** | The organizational structure of a system: its decomposition into parts, their connectivity, interaction mechanisms, and the guiding design principles |
| **Architecturally significant** | A feature or aspect of the system that is critical to the overall design — flagged by any of the 3 Qs |
| **3 Qs of architecture** | Three questions for identifying what to work on first: Q1 (essence?), Q2 (what does it mean?), Q3 (how do I do it?) |
| **Essence** | What a system is at its most basic level — the things without which the system wouldn't really be what it's supposed to be |
| **Risk** | The potential for a feature or uncertainty to cause project failure, delays, or customer dissatisfaction; the real reason to tackle architecturally significant features first |
| **Scenario** | An informal, single-path description of how the system is used; a lightweight alternative to a full use case, used to validate code and catch missing requirements |
| **Key features** | The subset of features identified by the 3 Qs as architecturally significant and worthy of first focus |
| **Unit (class)** | The base game framework class representing any game unit; stores a type string and a `Map<String, Object>` of game-specific properties |
| **Board (class)** | The core board class in the GSF; manages a 2D grid of `Tile` objects and delegates unit operations to `Tile` |
| **Tile (class)** | Represents a single square on the board; stores a list of units currently on that tile |
| **Map pattern (for units)** | Using `Map<String, Object>` to store arbitrary name/value property pairs in `Unit`; enables any game to define its own unit properties without changing the framework |
| **Iterative architecture** | The practice of building one key feature at a time, reassessing the architecture after each one, and building on what's already in place |
| **Build on what you have** | After writing some code, pick the next key feature that relates to what's already built — rather than starting from scratch each time |