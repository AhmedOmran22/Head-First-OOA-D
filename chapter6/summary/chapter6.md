# 📖 Head First OOA&D — Chapter 6 Summary

## *Solving Really Big Problems: "My Name is Art Vandelay... I Am an Architect"*

> **Goal of this chapter:** Learn how to handle a system that is much larger and more complex than anything we've built before. Stop panicking at the scale, and discover that you already have all the tools you need. Add three new tools to your OOA&D toolbox: **feature lists**, **use case diagrams**, and **domain analysis** — and use them to break a huge problem into smaller pieces you already know how to solve.

---

## 🗺️ Chapter Overview

The chapter introduces Gary, owner of Gary's Games, who wants to build a **Game System Framework (GSF)** — a reusable library that any game designer in his company can use to build turn-based strategy board games without writing bookkeeping code from scratch.

**The chapter has five phases:**

1. **Realize big problems are just lots of small problems**
2. **Listen to the customer** to figure out what the system is like and not like (commonality and variability)
3. **Figure out the features**, then draw a **use case diagram** as a blueprint
4. **Domain analysis** — describe the system in language the customer understands
5. **Break the big problem up** into modules, apply design patterns, and conquer

---

## 🧠 The Big Secret: Big Problems Are Just Lots of Small Problems

When you see a huge application, it's easy to freeze up. But here's the truth the chapter hammers from page one:

> **You solve big problems the same way you solve small problems.**

Everything you've learned so far — requirements, use cases, OO principles, encapsulation, cohesion, loose coupling — all of it applies to systems with 1,000 classes just as much as systems with 5.

```
BIG PROBLEM
┌──────────────────────────────────────┐
│  ┌─────────┐  ┌─────────┐           │
│  │ Small   │  │ Small   │           │
│  │ Problem │  │ Problem │           │
│  └─────────┘  └─────────┘           │
│        ┌─────────┐  ┌─────────┐    │
│        │ Small   │  │ Small   │    │
│        │ Problem │  │ Problem │    │
│        └─────────┘  └─────────┘    │
└──────────────────────────────────────┘

A BIG problem is really just a collection of
functionalities, where each piece of functionality
is really a smaller problem on its own.
```

**The three steps still apply — even at scale:**

1. Make sure your software does what the customer wants it to do
2. Apply basic OO principles to add flexibility
3. Strive for a maintainable, reusable design

And the bigger the system, the more these principles matter — especially **high cohesion** (each module does ONE thing) and **loose coupling** (modules don't depend deeply on each other).

---

## 🧭 Step 1: Listen to the Customer — Commonality and Variability

All Gary had to give us at the start was a **vision statement**. That's not enough to write requirements or use cases — we need to understand the system better first.

The book introduces two powerful lenses for analyzing any new system:

### What is the system LIKE? → Commonality

Find things the system resembles or shares traits with — things you already understand.

**Example from Gary's customer conversation:**
> *"Remember that old computer game Zork? Everybody loved that thing, even though it was pure text."*

That tells us the system is **text-interface-oriented**, not graphics-heavy. We've already found commonality — the system is like Zork.

### What is the system NOT LIKE? → Variability

Find what makes this system different — what it *doesn't* share with other things you know.

**Example:**
> *"The system is NOT a graphic-rich game like Star Wars... it's NOT tied to one specific time period... it's NOT limited to one set of units."*

Variability tells you what you **don't need to worry about** and what areas need to be **flexible** in the design.

---

## 🗣️ Step 2: Customer Conversation — Turn What You Hear Into Features

After listening to Gary's team (Tom, Bethany, Susan, and Bob), we learn the following about what the system should do:

- Support different types of terrain (mountains, rivers, plains, grass, even space or asteroid)
- Support different time periods, including fictional periods like sci-fi and fantasy
- Support multiple types of troops or units that are game-specific
- Support add-on modules for additional campaigns or battle scenarios
- Provide a board made up of square tiles, each with a terrain type
- Keep up with whose turn it is, and coordinate basic movement

---

## 📋 Step 3: Figure Out the Features

A **feature** is a high-level description of something a system needs to do. You get features from the customer conversation, and then turn them into requirements.

> **One feature → multiple requirements.**

```
Feature (from customer)          Requirements (for developer)
                              ┌─ A tile is associated with a terrain type.
Supports different types  ────┤─ Game designers can create custom terrain types.
of terrain.                   └─ Each terrain has characteristics that affect movement.
```

**Don't get hung up on the difference between a "feature" and a "requirement."** Some people use them interchangeably. The key distinction (if you use one):
- **Feature** = the "big thing" the customer wants
- **Requirement** = the smaller, more specific things you need to build to satisfy that feature

**The feature list for Gary's Game System Framework:**

| # | Feature |
|---|---------|
| 1 | The framework supports different types of terrain |
| 2 | The framework supports different time periods, including fictional periods like sci-fi and fantasy |
| 3 | The framework supports multiple types of troops or units that are game-specific |
| 4 | The framework supports add-on modules for additional campaigns or battle scenarios |
| 5 | The framework provides a board made up of square tiles, and each tile has a terrain type |
| 6 | The framework keeps up with whose turn it is |
| 7 | The framework coordinates basic movement |

> **Use a feature or requirement list to capture the BIG THINGS your system needs to do.**

---

## 🗃️ Step 4: Use Case Diagrams — The Blueprint

Use cases are great for capturing detail, but when you're working on a large system you're not ready for that much detail yet. You need a **big-picture view** first.

> **Always defer details as long as you can.** You won't get caught up in the little things when you should be working on the big things.

That's where **use case diagrams** come in.

### What Is a Use Case Diagram?

A use case diagram is a simple, high-level picture that shows:
- The **system boundary** — a big box; everything inside is what you're building, everything outside is what uses it
- **Actors** — stick figures; any external entity (person or system) that interacts with your system
- **Use cases** — ovals; each represents one thing the system needs to do

```
┌─────────────────────────────────────────────┐
│                                             │
│         ┌──────────────┐                   │
│         │ Create New   │                   │
│         │    Game      │                   │
│         └──────────────┘                   │
│                                             │
○──────────┼──────────────────────────────── │
│         ┌──────────────┐                   │
│         │ Modify       │                   │
│         │ Existing     │                   │
│         │ Game         │                   │
│         └──────────────┘                   │
│                                             │
│         ┌──────────────┐                   │
│         │ Deploy Game  │                   │
│         └──────────────┘                   │
│                                             │
└─────────────────────────────────────────────┘
Game Designer
```

### Use Case Diagrams Are Blueprints

> **Use case diagrams are the blueprints for your system.**

They help you stay focused on the **fundamental things** your system *must* do. Without a diagram, you could spend all your time on how a game designer creates a new game and completely forget that they also need to *deploy* it.

### Use Your Feature List to Validate the Diagram

Cross-check every feature against your use case diagram. If you can't attach a feature to a use case on the diagram, you're either missing a use case or the feature doesn't belong in the system.

---

## 🎭 Actors Don't Have to Be People

When mapping the feature "The framework keeps up with whose turn it is, and coordinates basic movement," we couldn't attach it to the Game Designer — because *the Game Designer doesn't interact with this functionality*. The **game itself** does.

This reveals an important insight:

> **An actor is any external entity that interacts with the system — it doesn't have to be a human.**

The game that the designer creates (and that the player plays) is also an **actor** on the GSF system, because the game uses the framework during gameplay.

**Updated use case diagram with two actors:**

```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│   ┌──────────────┐        ┌──────────────┐                │
○───│ Create New   │        │ Create Board │───○            │
│   │ Game         │        └──────────────┘   │            │
│   └──────────────┘                           │            │
│                           ┌──────────────┐   │            │
│   ┌──────────────┐    ────│ Take Turn    │───│            │
○───│ Modify       │        └──────────────┘   │            │
│   │ Existing     │                           │            │
│   │ Game         │        ┌──────────────┐   │            │
│   └──────────────┘    ────│ Move Units   │───○            │
│                           └──────────────┘   │            │
│   ┌──────────────┐                       The Game         │
○───│ Deploy Game  │        ┌──────────────┐                │
│   └──────────────┘    ────│ Add/Remove   │───○            │
│                           │ Units        │                 │
│                           └──────────────┘                │
└────────────────────────────────────────────────────────────┘
Game Designer
```

---

## 🔬 Step 5: Domain Analysis — Speak the Customer's Language

Once we have our features and use case diagram, the next step is **domain analysis**: putting the system description together in a way the customer can actually understand.

> **Domain analysis**: The process of identifying, collecting, organizing, and representing the relevant information of a domain, based upon the study of existing systems and their development histories, knowledge captured from domain experts, underlying theory, and emerging technology within a domain.

In plain English: **talk about the system in terms the customer understands.**

For Gary, that means talking about:
- **Units** — not `class Unit extends AbstractGamePiece`
- **Terrain** — not `Map<String, TerrainType>`
- **Tiles** — not a 2D array index
- **The board** — not a `Grid` object

### What Most People Give the Customer vs. What We Give

| ❌ What most developers give | ✅ What we give |
|---|---|
| Class diagrams, package diagrams, variable names, method signatures — in developer language | A feature list in words the customer actually uses — "The framework supports different types of terrain" |
| Customer is lost: *"What the heck is this? I have no idea if this is what I want."* | Customer is thrilled: *"Very cool! That's exactly what I want the system to do."* |

> **Domain analysis helps you avoid building parts of a system that aren't your job to build.**

**Example:** Tony (a game player, not a game designer) says "You don't even have a graphics package — the game is gonna SUCK!" But graphics are the **game designer's** responsibility, not the framework's. Domain analysis keeps you focused on YOUR customer (Gary/game designers), not someone else's needs.

---

## 🧩 Step 6: Break the Big Problem Into Modules

With a complete feature list and use case diagram, you're ready to **divide and conquer**. Break the big system up into several smaller, more manageable pieces of functionality — **modules**.

The key pieces of functionality in Gary's game framework:

```
┌──────────────┐   ┌──────────────┐
│    Units     │   │    Board     │
│              │   │              │
│ Troops,      │   │ Board itself,│
│ armies, all  │   │ tiles,       │
│ units used   │   │ terrain, and │
│ in a game.   │   │ related      │
│              │   │ classes.     │
└──────────────┘   └──────────────┘

┌──────────────┐   ┌──────────────┐
│    Game      │   │  Utilities   │
│              │   │              │
│ Basic classes│   │ Tools and    │
│ extended by  │   │ helper       │
│ game         │   │ classes      │
│ designers.   │   │ shared across│
│ Time period, │   │ modules.     │
│ properties.  │   │              │
└──────────────┘   └──────────────┘

┌──────────────┐
│  Controller  │
│              │
│ Turns, basic │
│ movement,    │
│ keeping the  │
│ game going.  │
│ The "traffic │
│ cop."        │
└──────────────┘
```

**Key module decisions:**

- **No separate Terrain or Tile modules** — they'd only have one or two classes, so they were folded into the `Board` module
- **Graphics is NOT a module** — that's the game designer's job, not the framework's
- **There's no single right answer** — what matters is that all features and use cases are covered, and no module is too bloated or too tiny

---

## 🔄 The MVC Pattern Emerges

Once the modules are laid out, one of the team members notices something:

> *"Once the game designer adds a Graphics module, this looks an awful lot like the Model-View-Controller pattern!"*

```
                     Controller
                    ┌──────────┐
                    │          │◄──────────────── Game designers can
                    └──────────┘                  extend with their own
                         │                        game-specific controller
                         │ controller
                         │ manipulates model
                         ▼
          ┌──────────────────────────┐
          │          Model           │
          │  ┌─────────┐ ┌────────┐ │
          │  │  Board  │ │ Units  │ │
          │  └─────────┘ └────────┘ │
          └──────────────────────────┘
                 │ model notifies
                 │ view of a change
                 ▼
               View (Graphics)
          ┌──────────┐
          │          │◄── Game designer adds this;
          └──────────┘    it's NOT your responsibility
```

- **Model** = Board + Units (models what's actually happening in the game)
- **View** = Graphics (the game designer's responsibility, not yours)
- **Controller** = Controller module (handles turns, movement, game flow)
- **Game + Utilities** don't fit cleanly into MVC — they're supporting infrastructure

> **Design patterns are one of the LAST steps of design.** You apply OO principles first (encapsulation, delegation, cohesion), get a flexible structure, and then recognize or apply a pattern that fits.

---

## 🌀 The Big Picture: How It All Comes Together

The chapter ends with a beautiful summary of the full process, showing that everything connects:

```
1. We listened to the customer.
   (Vision statement → commonality & variability)
              ↓
2. We made sure we understood the system.
   (Feature list in the customer's language → domain analysis)
              ↓
3. We drew up blueprints for the system we're building.
   (Use case diagram with all actors and use cases)
              ↓
4. We broke the big problem up into smaller pieces of functionality.
   (Units, Board, Game, Controller, Utilities modules)
              ↓
5. We applied design patterns to help us solve the smaller problems.
   (MVC pattern maps naturally to the module structure)
              ↓
Congratulations! You've turned a BIG PROBLEM into a bunch of
SMALLER PROBLEMS that you already know how to solve.
```

---

## ✅ Key Takeaways

- **Big problems are just lots of small problems.** Every tool you've learned — requirements, use cases, OO principles — applies at any scale. Don't freeze up.
- **Commonality and variability** are your lenses for analyzing a new system before you have enough information to write requirements. Ask: what is this system *like*? What is it *not* like?
- **Features are high-level descriptions** of what a system needs to do. Start with features when you don't have enough info for full requirements. One feature often maps to multiple requirements.
- **Don't confuse features and requirements** — some people use them interchangeably, some treat features as "big things" and requirements as "small things." Neither is wrong. Don't waste time arguing about it.
- **Use case diagrams are blueprints.** They show what the system does at 10,000 feet without getting lost in implementation detail. They're not a substitute for use cases — they're a complement to them.
- **Validate your diagram against your feature list.** Every feature should map to at least one use case. If a feature doesn't fit anywhere, you're either missing a use case or that feature isn't part of your system.
- **Actors aren't always people.** Any external entity that interacts with your system — including another system — is an actor.
- **Domain analysis keeps you speaking the customer's language.** Never show a customer class diagrams when a feature list in plain English does the job better. Domain analysis also stops you from building things that aren't your responsibility.
- **Break the big system into modules.** Each module handles one focused area of functionality. There's no single right answer — what matters is that all features and use cases are covered and no module is absurdly large or tiny.
- **Design patterns are a last step.** Apply OO principles first. Patterns often emerge naturally (like MVC did here) once the structure is clean.
- **Always defer details as long as you can.** When working at the big-picture level, resist the pull of use cases, class diagrams, and implementation decisions. Stay at the feature and use-case-diagram level until the big picture is clear.

---

## ⚠️ Common Mistakes

### ❌ Mistake 1: Jumping straight into use cases when you don't even know what the system does yet

Don't start writing detailed use cases when all you have is a vision statement. You'll get lost in details before you understand the big picture. Start with features and a use case diagram first.

### ❌ Mistake 2: Showing the customer class diagrams

A class diagram is developer language. Gary doesn't know what `InstrumentSpec` or `Map<String, Object>` means. Give the customer a feature list in their own domain language, and they'll tell you immediately if it matches what they want.

### ❌ Mistake 3: Building things that aren't your job

Domain analysis protects you here. The game designer's graphics module is NOT part of the framework. Tony the game player says "no graphics package = game will suck" — but Tony isn't your customer, Gary is. Know who your customer is and build for them.

### ❌ Mistake 4: Getting hung up on whether something is a "feature" or a "requirement"

It doesn't matter. Both terms exist to help you capture what the system needs to do. Don't let terminology arguments slow you down. Pick one or use both, and get on with the design.

### ❌ Mistake 5: Thinking actors must be humans

An actor is any external entity that interacts with the system. In Gary's framework, *the game itself* is an actor — it uses the framework during gameplay to manage turns, movement, and the board. Missing non-human actors leads to incomplete use case diagrams and missing functionality.

### ❌ Mistake 6: Making a module for every single concept

Don't create a `Terrain` module with one class, or a `Tile` module with two. Fold small, tightly related concepts into the module that already manages them (Terrain and Tiles go inside `Board`). A module with one class defeats the purpose of modularization.

---

## ❓ There's No Dumb Questions

**Q: What's the difference between a use case and a use case diagram?**

A: A **use case** is a detailed, step-by-step description of how an actor interacts with a system to accomplish a goal. A **use case diagram** is just a picture that shows which use cases exist and which actors are involved — no steps, no detail. The diagram is the big picture; the use case is the implementation detail underneath it.

---

**Q: When should I write use cases vs. draw a use case diagram?**

A: When you need to stay at the big-picture level (like early in the design of a large system), a use case diagram is better — it doesn't pull you into detail prematurely. Once you know *what* the system needs to do at a high level, then you can write actual use cases for each oval in the diagram.

---

**Q: Do I need to use formal UML for the use case diagram?**

A: No. The notation (box = system, oval = use case, stick figure = actor) is helpful and widely understood, but the book doesn't stress formality here. What matters is that the diagram accurately represents the system boundary, the actors, and the use cases. Keep it simple.

---

**Q: How do I know how many modules to break the system into?**

A: There's no formula. The guidelines are: each module should have a focused, well-defined responsibility; no module should be responsible for everything; no module should have only one class (that's not really a module). Make sure all features and use cases map to at least one module. Expect your modular breakdown to change as you learn more.

---

**Q: What if my system doesn't look like MVC? Do I need a design pattern?**

A: No. Design patterns are the last step — they're optional and situational. They're useful when they fit naturally, but you should never force a pattern onto a design. The book explicitly says: design patterns come *after* you've applied basic OO principles and the structure has stabilized. If no pattern fits, that's fine.

---

**Q: What exactly is "domain analysis"? Is it a formal process?**

A: It doesn't have to be. The formal definition is "identifying, collecting, organizing, and representing the relevant information of a domain based on domain experts and existing systems." In practice for this chapter, it just means: describe your system in terms that both you and your customer understand, using the vocabulary of the problem domain (units, terrain, tiles, board) rather than the vocabulary of implementation (classes, maps, arrays, methods).

---

## 📚 Key Terminology

| Term | Definition |
|---|---|
| **Feature** | A high-level description of something a system needs to do, usually expressed in the customer's language; one feature may generate several requirements |
| **Commonality** | What a new system shares with systems or things you already understand; helps you figure out what the system *is like* |
| **Variability** | What makes a system different from other things; helps you figure out what the system *is not like* and where flexibility is needed |
| **Use case diagram** | A UML diagram showing the system boundary, actors (external entities), and use cases (system behaviors) — the big-picture blueprint of a system |
| **System boundary** | The box in a use case diagram; everything inside is what you build, everything outside uses your system |
| **Actor** | Any external entity (person or system) that interacts with your system but is not part of it |
| **Domain analysis** | Describing a system in the language of the problem domain — terms the customer understands — rather than in implementation language |
| **Module** | A logical grouping of related functionality in a large system; each module handles one focused area and can be worked on somewhat independently |
| **MVC (Model-View-Controller)** | A design pattern that separates data (model), display (view), and control logic (controller); emerged naturally in the Gary's Games framework structure |
| **Design pattern** | A repeatable solution to a commonly occurring design problem; patterns go into your brain first and then get applied to your code — they're a last step of design, not a first |
| **Feature list** | A simple list of high-level things the system must do, expressed in the customer's language; used to ensure the use case diagram is complete |
| **Vision statement** | A customer-provided high-level description of what they want to build; it's a starting point, not a requirements document — you need a lot more information before you can design |
| **Divide and conquer** | The strategy of breaking a big problem into smaller, more manageable pieces and then solving each piece using existing OOA&D knowledge |