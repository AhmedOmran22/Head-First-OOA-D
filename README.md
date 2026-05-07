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
└── README.md
```

## Chapters

| Chapter | Title | Core Concept | Summary |
|---------|-------|--------------|---------|
| 1 | Well-Designed Apps Rock | Encapsulation & Delegation | [chapter1.md](chapter1/summery/chapter1.md) |
| 2 | Gathering Requirements | Use Cases & Requirements Lists | [chapter2.md](chapter2/summary/chapter2.md) |
| 3 | Requirements Change | Change, Cohesion & OCP | [chapter3.md](chapter3/summary/chapter3.md) |
| 4 | Analysis | Textual Analysis & Real-World Design | [chapter4.md](chapter4/summary/chapter4.md) |

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
```
