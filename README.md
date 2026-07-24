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
├── chapter7/
│   ├── summary/
│   │   └── chapter7.md        ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── board.dart
│   │   ├── tile.dart
│   │   └── unit.dart
│   └── main.dart              ← Runnable entry point (Board Scenario)
├── chapter8/
│   ├── summary/
│   │   └── chapter8.md        ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── instrument_spec.dart, guitar_spec.dart   (OCP)
│   │   ├── dog_door.dart                            (DRY)
│   │   ├── automobile.dart, driver.dart, car_wash.dart, mechanic.dart, tire.dart  (SRP)
│   │   ├── board.dart, tile.dart, three_d_board.dart  (LSP + delegation)
│   │   ├── unit.dart, weapon.dart                   (composition)
│   │   └── instrument.dart                          (aggregation)
│   └── main.dart              ← Runnable entry point (principle demos)
├── chapter9/
│   ├── summary/
│   │   └── chapter9.md        ← Full chapter summary with Q&A
│   ├── classes/
│   │   ├── unit.dart          (completed Unit + programming by contract)
│   │   ├── unit_group.dart    (armies, Map<int, Unit>)
│   │   ├── weapon.dart        (stub — only what the feature needs)
│   │   ├── unit_tester.dart       (test cases 1–4)
│   │   └── unit_group_tester.dart (test cases 10–15)
│   └── main.dart              ← Runnable entry point (runs all test cases)
├── chapter10/
│   ├── summary/
│   │   └── chapter10.md       ← Full chapter summary with Q&A
│   ├── data/
│   │   └── ObjectvilleSubway.txt   ← The subway network input file
│   ├── classes/
│   │   ├── station.dart, connection.dart, subway.dart  (Subway module)
│   │   ├── subway_loader.dart                          (Loader module)
│   │   ├── subway_printer.dart                         (Printer module)
│   │   └── load_tester.dart, subway_tester.dart        (Test module)
│   └── main.dart              ← Runnable entry point (RouteFinder)
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
| 7 | Architecture | The 3 Qs, Reducing Risk & Scenarios | [chapter7.md](chapter7/summary/chapter7.md) |
| 8 | Design Principles | OCP, DRY, SRP, LSP & Alternatives to Inheritance | [chapter8.md](chapter8/summary/chapter8.md) |
| 9 | Iterating and Testing | Test Cases, Feature Driven Dev & Programming by Contract | [chapter9.md](chapter9/summary/chapter9.md) |
| 10 | The OOA&D Lifecycle | Putting It All Together — the Objectville RouteFinder | [chapter10.md](chapter10/summary/chapter10.md) |

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

**Chapter 7 — Architecture**
- **Architecture** = your design structure — the most important parts of the app and the relationships between them; it turns a chaotic pile of features and diagrams into a well-ordered application
- **The 3 Qs** find what's *architecturally significant*: Q1 — is it part of the **essence** of the system? Q2 — what does it **mean** (is it unclear)? Q3 — how do I **do** it (is it hard/new)? Any one flag is enough
- **Architecture is about reducing RISK** — you tackle significant features first not because they're "important" but because they carry the most risk; it doesn't matter which one you start with, only that you're always reducing risk
- **Scenarios** are lightweight, single-path use cases — the Board Scenario revealed a missing `removeUnit()` requirement before the customer ever saw the work
- **Commonality runs deeper than property names** — tanks, soldiers, and airplanes share no field names, but all have a *type* and a set of name/value pairs; `Unit` models that with a `Map<String, Object>` (same pattern as Chapter 5 Part 2)
- **Focus on one feature at a time and build on what you have** — `Board` delegates unit ops to `Tile`, and `Unit` started as a bare stub until its key feature came up

**Chapter 8 — Design Principles: Originality is Overrated**
- **A design principle** is a reusable tool/technique that makes code more maintainable, flexible, or extensible — smart developers already solved these problems, so don't reinvent the wheel
- **OCP (Open-Closed)** — classes are **open for extension, closed for modification**; lock down working code and extend it by subclassing/overriding (`InstrumentSpec.matches()` stays closed, `GuitarSpec` overrides it)
- **DRY (Don't Repeat Yourself)** — every piece of information and behavior lives in **one sensible place**; applies to requirements too, not just code (the dog-door timer belongs only in `DogDoor.open()`)
- **SRP (Single Responsibility)** — one responsibility, one reason to change; use the test *"The [Class] [method]s itself"* to move `drive()`/`wash()`/`changeTires()` off `Automobile` and onto `Driver`/`CarWash`/`Mechanic`. Cohesion = SRP
- **LSP (Liskov Substitution)** — subtypes must be substitutable for their base types; `ThreeDBoard extends Board` violates LSP because 2D `(x, y)` methods are meaningless in 3D
- **Beyond inheritance** — prefer **delegation** (use another class's behavior as-is: `ThreeDBoard` holds Boards), **composition** (own a family of behaviors, swap at runtime: `Unit` ◆ `Weapon`), and **aggregation** (composition without ownership, the part lives on: `Instrument` ◇ `InstrumentSpec`)

**Chapter 9 — Iterating and Testing: The Software is Still for the Customer**
- **The customer wants running code, not diagrams** — all the principles in the world don't matter if you never ship something that works
- **Two ways to iterate deeper**: **feature driven** (take one feature to completion — faster to show the customer, good for many disconnected features) and **use case driven** (implement one scenario end to end — better for complex, process-heavy flows). Most real projects mix both, plus test driven
- **Write tests first** — knowing your tests tells you exactly what code to write. A good test case has **5 parts**: ID/name, one specific thing tested, input, expected output, and starting state; keep each test **atomic**
- **Test incorrect usage too** — non-existent properties and empty states catch bugs before the customer does
- **Design decisions are tradeoffs** — commonality (typed `id`/`name`/`weapons` fields, better discoverability, but risks DRY violations) vs. encapsulation (everything in the Map, maximum flexibility, but loses explicit structure). The chapter picks commonality for `Unit`
- **Programming by contract vs. defensive programming** — contract trusts competent callers and throws unchecked exceptions on violation; defensive distrusts callers and does exhaustive checks. The choice is driven by your *customer*, not your preference
- **Lazy initialization matters at scale** — with thousands of units, don't allocate an empty List/Map for each one (`??=` in Dart)
- **Iteration is fractal** — you iterate between features, between behaviors within a feature, and between design options; reevaluate earlier decisions and avoid **analysis paralysis**

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

# Run Chapter 7 example (Gary's Game System Framework — Board Scenario)
dart run chapter7/main.dart

# Run Chapter 8 example (OCP, DRY, SRP, LSP + delegation/composition/aggregation demos)
dart run chapter8/main.dart

# Run Chapter 9 example (runs the Unit + UnitGroup test cases)
dart run chapter9/main.dart
```
