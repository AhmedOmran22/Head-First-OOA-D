# Head First OOA&D — Study Notes & Code

Personal study repo for **Head First Object-Oriented Analysis & Design** (Brett McLaughlin, Gary Pollice, Dave West). Each chapter gets a summary and working Dart code examples.

## Why Dart?

The book uses Java. This repo reimplements all examples in **Dart** to reinforce the concepts while practicing the language. The OO principles are identical; only the syntax differs.

## Repo Structure

```
OOA&D/
├── chapter1/
│   ├── summery/
│   │   └── chapter1.md        ← Full chapter summary with diagrams & Q&A
│   ├── classes/
│   │   ├── guitar.dart
│   │   ├── guitar_specs.dart
│   │   └── inventory.dart
│   ├── enums/
│   │   ├── builder.dart
│   │   ├── type.dart
│   │   └── wood.dart
│   └── main.dart              ← Runnable entry point
├── chapter2/
│   ├── summary/
│   │   └── chapter2.md        ← Full chapter summary with use cases & Q&A
│   ├── classes/
│   │   ├── dog_door.dart
│   │   └── remote.dart
│   └── main.dart              ← Runnable entry point
├── chapter3/
│   ├── summary/
│   │   └── chapter3.md        ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── dog_door.dart
│   │   ├── remote.dart
│   │   └── bark_recognizer.dart
│   └── main.dart              ← Runnable entry point
├── chapter4/
│   ├── summary/
│   │   └── chapter4.md        ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── bark.dart
│   │   ├── dog_door.dart
│   │   ├── bark_recognizer.dart
│   │   └── remote.dart
│   └── main.dart              ← Runnable entry point
├── chapter5p1/
│   ├── summary/
│   │   └── chapter5p1.md      ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── instrument.dart
│   │   ├── instrument_specs.dart
│   │   ├── guitar.dart
│   │   ├── guitar_specs.dart
│   │   ├── mandolin.dart
│   │   ├── mandolin_specs.dart
│   │   └── inventory.dart
│   ├── enums/
│   │   ├── builder.dart
│   │   ├── type.dart
│   │   ├── wood.dart
│   │   └── style.dart
│   └── main.dart              ← Runnable entry point
├── chapter5p2/
│   ├── summary/
│   │   └── chapter5p2.md      ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── instrument.dart
│   │   ├── instrument_spec.dart
│   │   └── inventory.dart
│   ├── enums/
│   │   ├── builder.dart
│   │   ├── type.dart
│   │   ├── wood.dart
│   │   ├── style.dart
│   │   └── instrument_type.dart
│   └── main.dart              ← Runnable entry point
├── chapter6/
│   └── summary/
│       └── chapter6.md        ← Full chapter summary with Q&A
└── README.md
```

## Chapters

| Chapter | Title | Core Concept | Summary |
|---------|-------|--------------|---------|
| 1 | Well-Designed Apps Rock | Encapsulation & Delegation | [chapter1.md](chapter1/summery/chapter1.md) |
| 2 | Gathering Requirements | Use Cases & Requirements Lists | [chapter2.md](chapter2/summary/chapter2.md) |
| 3 | Requirements Change | Change, Cohesion & OCP | [chapter3.md](chapter3/summary/chapter3.md) |
| 4 | Analysis | Textual Analysis & Real-World Design | [chapter4.md](chapter4/summary/chapter4.md) |
| 5 (Part 1) | Good Design = Flexible Software | Abstract Classes & Inheritance | [chapter5p1.md](chapter5p1/summary/chapter5p1.md) |
| 5 (Part 2) | Give Your Software a 30-Minute Workout | Cohesion, Loose Coupling & Map Properties | [chapter5p2.md](chapter5p2/summary/chapter5p2.md) |
| 6 | Solving Really Big Problems | Feature Lists, Use Case Diagrams & Domain Analysis | [chapter6.md](chapter6/summary/chapter6.md) |

## What Each Chapter Is About

**Chapter 1 — Well-Designed Apps Rock**
- Great software works for the customer, applies OO principles, and strives for a maintainable design
- Use enums instead of strings to eliminate case-mismatch bugs at compile time
- Encapsulate related properties into their own class (e.g. `GuitarSpec`) to isolate what varies
- Delegate comparison logic to the object being compared — `GuitarSpec.matches()` instead of manual field checks in `Inventory`
- When adding a new property only touches one class, your design is working

**Chapter 2 — Gathering Requirements**
- Write a requirements list before writing any code — each requirement must be testable
- A use case = one customer goal; it has a clear value, a start/stop condition, and an external initiator
- The main path is the happy path; alternate paths handle what can go wrong — both are part of the same use case
- Cross-check every use case step against your requirements list — any uncovered step needs a new requirement
- Use cases reveal requirements the customer never thought to mention

**Chapter 3 — Requirements Change**
- Requirements always change — good use cases make handling change cheap
- When requirements change: update the use case first, then requirements, then code
- A scenario is one complete path through a use case; one use case can have many scenarios
- The main path should reflect what happens most often — promote the common case out of the alternate paths
- **"Encapsulate what varies"** — isolate behavior that changes or is triggered from multiple places into the class that owns it (auto-close lives in `DogDoor`, not in `Remote` and `BarkRecognizer`)

**Chapter 4 — Analysis**
- **Analysis** = anticipating real-world problems before they hit your customers; build software that works outside the controlled test environment
- **Textual analysis**: circle every noun in your use case → candidate classes; circle every verbs → candidate methods
- Not every noun becomes a class — external actors (the dog owner), physical locations, and things already represented elsewhere don't need their own class
- Words in use cases matter: "if it's the owner's **dog** barking" vs. "if the bark matches" → completely different class designs
- A dog can bark in multiple ways — store a `List<Bark>` (the whole dog), not a single `String` (one sound)
- **Delegation shields from change**: `BarkRecognizer` delegates bark comparison to `Bark.equals()` — if comparison logic ever changes, only `Bark` changes
- Class diagrams give you the 10,000-foot view; use cases and requirements fill in the implementation details

**Chapter 5 Part 1 — Good Design = Flexible Software**
- The true test of good design is how easily it handles change — adding mandolin support revealed where Rick's guitar app cracked
- **Abstract classes** are placeholders: they define shared behavior across instrument types but cannot be instantiated directly
- Pull common fields (`builder`, `model`, `type`, `backWood`, `topWood`) into an abstract `InstrumentSpec`; subclasses only add what's unique (`numStrings`, `style`)
- **OO Principle 1 — Code to an interface, not an implementation**: write methods that take the abstract type and they work with any current or future subclass
- **OO Principle 2 — Encapsulate what varies**: isolate behavior that changes into its own class so the stable parts never need touching
- **OO Principle 3 — Single Responsibility Principle**: each class has exactly one reason to change; split any class that does too many things
- The Part 1 design still has flaws: `instanceof` checks in `addInstrument()`, separate `search()` per type, and empty subclasses — all fixed in Part 2

**Chapter 5 Part 2 — Give Your Software a 30-Minute Workout**
- **Subclasses are for different behavior, not different properties** — `Guitar` and `Mandolin` behaved identically, so they were deleted; `InstrumentType` enum replaces them
- **"Double encapsulation"**: encapsulate the spec away from the instrument, then encapsulate the properties inside the spec into a `Map<String, Object>`
- One concrete `InstrumentSpec` with a `Map` replaces all spec subclasses — adding a new property requires zero class changes
- One `search(InstrumentSpec)` method replaces all type-specific search methods — works for any instrument, including ones not yet invented
- **Cohesion = one class, one job**: `Inventory` manages the list, `Instrument` holds one instrument's data, `InstrumentSpec` holds one instrument's properties — each highly cohesive
- **High cohesion → loose coupling**: when each class does one thing, changes to one class don't cascade into others
- Good designs emerge from bad ones; never be afraid to throw away a design decision you made earlier — that's maturity, not failure

**Chapter 6 — Solving Really Big Problems**
- Big problems are just lots of small problems — every tool you've learned (requirements, use cases, OO principles) applies at any scale
- **Commonality & variability**: ask what the system is *like* (commonality) and what it is *not like* (variability) to understand a new system before you have enough info to write requirements
- **Feature lists** capture the big things the system needs to do in the customer's language; one feature typically expands into multiple requirements
- **Use case diagrams** are the blueprints — they show the system boundary, actors, and use cases at 10,000 feet without getting lost in detail; always defer detail as long as you can
- **Actors aren't always people** — any external entity that interacts with the system (including another system, like the game itself) is an actor
- **Domain analysis** keeps you speaking the customer's language; show Gary a feature list, not a class diagram
- Break the big system into **modules** — each handles one focused area; no module should be responsible for everything, and no module should have only one class
- **Design patterns are a last step** — apply OO principles first, and patterns (like MVC) often emerge naturally once the structure is clean

## Running the Code

Requires the [Dart SDK](https://dart.dev/get-dart).

```bash
# Run Chapter 1 example
dart run chapter1/main.dart

# Run Chapter 2 example
dart run chapter2/main.dart

# Run Chapter 3 example
dart run chapter3/main.dart

# Run Chapter 4 example
dart run chapter4/main.dart

# Run Chapter 5 Part 1 example
dart run chapter5p1/main.dart

# Run Chapter 5 Part 2 example
dart run chapter5p2/main.dart

# Chapter 6 — summary only, no runnable code (focuses on design-level tools: feature lists, use case diagrams, domain analysis)
```
