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
└── README.md
```

## Chapters

| Chapter | Title | Core Concept | Summary |
|---------|-------|--------------|---------|
| 1 | Well-Designed Apps Rock | Encapsulation & Delegation | [chapter1.md](chapter1/summery/chapter1.md) |

## The 3-Step Framework (from Chapter 1)

Every chapter builds on this foundation:

```
1. Make it WORK   → satisfy the customer's actual requirements
       ↓
2. Make it FLEXIBLE → apply OO principles (encapsulation, delegation)
       ↓
3. Make it MAINTAINABLE → strive for reusable, loosely-coupled design
```

## Key OO Concepts Covered So Far

- **Encapsulation** — group what belongs together; isolate what changes from what doesn't
- **Delegation** — let objects hand off responsibilities to specialists
- **Enums over strings** — type-safe and value-safe; eliminates an entire class of bugs
- **Single Responsibility Principle** — one class, one reason to change

## Running the Code

Requires the [Dart SDK](https://dart.dev/get-dart).

```bash
# Run Chapter 1 example
dart run chapter1/main.dart
```
