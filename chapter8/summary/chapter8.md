# 📖 Head First OOA&D — Chapter 8 Summary

## *Design Principles: Originality is Overrated*

> **Goal of this chapter:** Stop reinventing the wheel. Smart developers have already solved the problems you're facing — and they've written down their solutions as **design principles**. This chapter introduces four essential principles — **OCP**, **DRY**, **SRP**, and **LSP** — that make your code more maintainable, flexible, and extensible. It also teaches you three powerful alternatives to inheritance: **delegation**, **composition**, and **aggregation**.

---

## 🗺️ Chapter Overview

Chapter 8 is a pure design principles chapter — no new project, no new customer. It takes all the code you've already written (dog door, Rick's instruments, Gary's game framework) and shows you the formal principles behind why the good designs worked and why the bad ones didn't.

The chapter covers:

1. **OCP** — Open-Closed Principle
2. **DRY** — Don't Repeat Yourself
3. **SRP** — Single Responsibility Principle
4. **LSP** — Liskov Substitution Principle
5. **Beyond inheritance** — Delegation, Composition, Aggregation

> **A design principle** is a basic tool or technique that can be applied to designing or writing code to make that code more maintainable, flexible, or extensible.

---

## 🔒 Principle #1: The Open-Closed Principle (OCP)

> **Open-Closed Principle:** Classes should be **open for extension**, and **closed for modification**.

This is the first and most important principle in the chapter. It sounds contradictory at first — how can something be both open AND closed? — but it makes perfect sense once you understand what each word means:

- **Closed for modification** → once a class is working, you don't touch it. You don't change its code. Nobody else changes its code. That working behavior is locked down.
- **Open for extension** → even though you can't change the class, you CAN subclass it and override methods to add new behavior. The class is extensible without being modifiable.

### OCP in Rick's `InstrumentSpec` (Chapter 5 revisited)

You already used OCP without realizing it:

```
InstrumentSpec (abstract base class)
│
│  matches(InstrumentSpec): boolean  ← CLOSED for modification.
│  This method is defined once and doesn't change.
│
├── GuitarSpec
│    matches(GuitarSpec): boolean    ← OPEN for extension.
│    Overrides matches() with guitar-specific logic.
│
└── MandolinSpec
     matches(MandolinSpec): boolean  ← OPEN for extension.
     Overrides matches() with mandolin-specific logic.
```

`InstrumentSpec.matches()` is closed — nobody touches it. But `GuitarSpec` and `MandolinSpec` extend `InstrumentSpec` and override `matches()` to add instrument-specific behavior. That's OCP in action.

### OCP step by step

**Step 1:** Code the method in the base class and **close** it for modification.

```dart
// InstrumentSpec — CLOSED
abstract class InstrumentSpec {
  final Map<String, Object> properties;
  InstrumentSpec(this.properties);

  bool matches(InstrumentSpec other) {
    // This base implementation doesn't change
    for (var key in other.properties.keys) {
      if (properties[key] != other.properties[key]) return false;
    }
    return true;
  }
}
```

**Step 2:** When you need different behavior for a specific case, **extend** the class and override the method.

```dart
// GuitarSpec — OPEN for extension
class GuitarSpec extends InstrumentSpec {
  final int numStrings;
  GuitarSpec(Map<String, Object> props, this.numStrings) : super(props);

  @override
  bool matches(GuitarSpec other) {
    if (!super.matches(other)) return false;
    return numStrings == other.numStrings;
  }
}
```

> **The OCP is about flexibility — it goes beyond just inheritance.** Anytime you write working code, you want that code to *stay working*. The OCP lets you extend your working code, without changing that code.

---

## 🔁 Principle #2: The Don't Repeat Yourself Principle (DRY)

> **Don't Repeat Yourself:** Avoid duplicate code by abstracting out things that are common and placing those things in a **single location**.

This is the principle you used in Chapter 2 with the dog door. The timer code that automatically closes the door appeared in TWO places:

```
Remote.java           BarkRecognizer.java
pressButton()    AND  recognize()
  │                     │
  └── Timer code         └── Same timer code!  ← VIOLATION of DRY
```

The fix: pull the timer code into `DogDoor.open()` — ONE place for ONE behavior.

```dart
// BEFORE (DRY violation): Same logic in two places
class Remote {
  void pressButton() {
    door.open();
    // timer code to close door after 5 seconds
    Future.delayed(Duration(seconds: 5), () => door.close());
  }
}

class BarkRecognizer {
  void recognize(String bark) {
    door.open();
    // Same timer code duplicated here!
    Future.delayed(Duration(seconds: 5), () => door.close());
  }
}

// AFTER (DRY applied): Timer code in ONE place only
class DogDoor {
  void open() {
    print("The dog door opens.");
    isOpen = true;
    // Timer lives here — one place, one responsibility
    Future.delayed(Duration(seconds: 5), () => close());
  }
}
```

### DRY is about more than just code

DRY is NOT just about avoiding copy-paste. It's about having each piece of **information and behavior** in your system in a **single, sensible place**.

> **DRY is about having each piece of information and behavior in your system in a single, sensible place.**

This means DRY applies to your **requirements** too, not just your code:
- A requirement should be implemented **once**
- Use cases shouldn't overlap with each other
- Features shouldn't be duplicated in the feature list

**Applying DRY to Todd and Gina's dog door requirements (version 3.0):**

Requirements #6 and #9 both dealt with obstacle detection — one focused on something inside the house getting too close, the other on a blockage outside. Same basic functionality, duplicated. DRY says combine them:

```
OLD (duplicated):
  #6. Alert owner when something inside is too close to open the door
  #9. Make a noise if the door cannot open because of a blockage outside.

NEW (DRY-compliant, combined):
  The door alerts the owner if there is an obstacle inside or outside 
  of the house that stops the door from operating.
```

Similarly, requirements #8 and #11 both dealt with the alarm system. Combined:
```
  When the door opens, the house alarm will disarm, and when the door 
  closes, the alarm will re-arm (if the alarm system is turned on).
```

---

## 🎯 Principle #3: The Single Responsibility Principle (SRP)

> **Single Responsibility Principle:** Every object in your system should have a **single responsibility**, and all the object's services should be focused on carrying out that single responsibility.

You've already seen this principle — it's the same as saying a class should have **only one reason to change**. If a class has multiple reasons to change, it has multiple responsibilities, and it needs to be split up.

### The SRP analysis test

To check if a class follows the SRP, fill in this sentence for every method:

> **"The [ClassName] [methodName] itself."**

If the sentence makes sense, the method belongs on that class. If it sounds wrong, the method probably belongs somewhere else.

**Applying SRP analysis to the `Automobile` class:**

```
Automobile                    | Follows SRP? | Why
------------------------------|--------------|--------------------------------
start()                       | ✅ YES        | The Automobile starts itself.
stop()                        | ✅ YES        | The Automobile stops itself.
changeTires(Tire[])           | ❌ NO         | A Mechanic changes tires.
drive()                       | ❌ NO         | A Driver drives the automobile.
wash()                        | ❌ NO         | A CarWash washes automobiles.
checkOil()                    | ❌ NO         | A Mechanic checks oil.
getOil(): int                 | ✅ YES        | The Automobile gets its own oil.
```

**Refactored design:**

```
┌─────────────────┐    ┌───────────────────────────────┐
│   Automobile    │    │ Driver                        │
│ start()         │    │ drive(Automobile)             │
│ stop()          │    └───────────────────────────────┘
│ getOil(): int   │    ┌───────────────────────────────┐
└─────────────────┘    │ CarWash                       │
                       │ wash(Automobile)              │
                       └───────────────────────────────┘
                       ┌───────────────────────────────┐
                       │ Mechanic                      │
                       │ changeTires(Automobile, Tire[]│
                       │ checkOil(Automobile)          │
                       └───────────────────────────────┘
```

Each class now has one responsibility. If the rules for tire-changing change, you only update `Mechanic`. If washing rules change, only `CarWash`. The `Automobile` class never needs to change for those reasons.

### SRP = Cohesion

> **Cohesion** is actually just another name for the SRP. If you're writing highly cohesive software, then you're correctly applying the SRP.

When all of a class's methods are focused on doing one thing well, the class is highly cohesive, and it has a single responsibility.

### SRP in Gary's Game Framework

The `Unit` class from Chapter 7 is a good SRP example. Instead of having game-specific property methods scattered across subclasses, all property-related functionality lives in ONE place — the `Unit` class itself. The `Unit` handles its single responsibility: storing and providing access to a unit's type and properties.

---

## 🔄 Principle #4: The Liskov Substitution Principle (LSP)

> **Liskov Substitution Principle:** Subtypes must be **substitutable** for their base types.

This principle is all about **well-designed inheritance**. When you subclass something, your subclass must be usable anywhere the base class is used — without breaking anything or causing confusion.

> **The LSP is all about well-designed inheritance. When you inherit from a base class, you must be able to substitute your subclass for that base class without things going terribly wrong. Otherwise, you've used inheritance incorrectly!**

### The 3DBoard problem — a case study in LSP violation

A game designer wanted a 3D board (for a World War II air battle game). They subclassed `Board` and created `3DBoard`:

```
Board
├── getTile(int x, int y): Tile
├── addUnit(Unit, int x, int y)
├── removeUnit(Unit, int x, int y)
├── removeUnits(int x, int y)
└── getUnits(int x, int y): List

         ↑ extends
         │
3DBoard
├── (inherits all Board methods — 2D versions)
├── getTile(int x, int y, int z): Tile    ← new 3D version
├── addUnit(Unit, int x, int y, int z)    ← new 3D version
├── removeUnit(Unit, int x, int y, int z) ← new 3D version
├── removeUnits(int x, int y, int z)      ← new 3D version
└── getUnits(int x, int y, int z): List   ← new 3D version
```

**The problem:** `3DBoard` inherits ALL the 2D methods from `Board`, but those 2D methods don't make sense on a 3D board. What does `getUnits(4, 5)` even mean on a `3DBoard`? Nobody knows.

```dart
// This compiles fine — 3DBoard IS-A Board after all:
Board board = ThreeDBoard();

// But this makes no sense:
List<Unit> units = board.getUnits(8, 4);
// What does (8, 4) mean on a 3D board???
```

> **The 3DBoard class is NOT substitutable for Board, because none of the methods on Board work correctly in a 3D environment. Calling a method like getUnits(2, 5) doesn't make sense for 3DBoard. So this design violates the LSP.**

**Violating LSP creates confusing code.** When someone opens the `3DBoard` class for the first time, they see TWO versions of every method — the inherited 2D ones and the new 3D ones. They don't know which to use. That confusion is the direct result of bad inheritance.

---

## 🛠️ Beyond Inheritance: Three Alternatives

The LSP violation with `3DBoard` leads to the most important insight in the chapter: **inheritance is just one option**. There are three alternatives that let you reuse behavior without subclassing:

### 1. Delegation

> **Delegation** is when you hand over the responsibility for a particular task to another class or method.

Use delegation when you want to **use** another class's functionality exactly as-is, without changing it.

**Solving the 3DBoard problem with delegation:**

Instead of inheriting from `Board`, `3DBoard` stores an array of `Board` objects and delegates to them:

```dart
class ThreeDBoard {
  final List<Board> boards;  // an array of 2D boards, one per Z-level
  final int zSize;

  ThreeDBoard(int width, int height, this.zSize)
      : boards = List.generate(zSize, (_) => Board(width, height));

  Tile getTile(int x, int y, int z) {
    return boards[z - 1].getTile(x, y);  // delegate to the right Board
  }

  void addUnit(Unit unit, int x, int y, int z) {
    boards[z - 1].addUnit(unit, x, y);  // delegate
  }
}
```

`3DBoard` uses `Board`'s functionality via delegation — it doesn't inherit it. Now there's no confusion, no inherited 2D methods that don't make sense, and no LSP violation.

> **If you need to use functionality in another class, but you don't want to change that functionality, consider using delegation instead of inheritance.**

```
3DBoard ────────────────────────────► Board
        "boards" (association, not inheritance)
        delegates to board instances
```

### 2. Composition

> **Composition** allows you to use behavior from a family of other classes, and to **change that behavior at runtime**.

Use composition when you need to **choose from a family of behaviors** — not just one fixed behavior. The composing class *owns* the composed object; when the composing object is destroyed, the composed object goes with it.

**Unit + Weapon — a composition example:**

Different games need different weapon behaviors. A `Weapon` interface defines `attack()`, and multiple implementations provide different behaviors (`Sword`, `Gun`, `Club`):

```dart
abstract class Weapon {
  void attack();
}

class Sword implements Weapon {
  @override
  void attack() => print("Sword attack!");
}

class Gun implements Weapon {
  @override
  void attack() => print("Gun fires!");
}

class Club implements Weapon {
  @override
  void attack() => print("Club smash!");
}
```

The `Unit` class is **composed** with a `Weapon`:

```dart
class Unit {
  final String type;
  final Map<String, Object> properties;

  Unit(this.type) : properties = {};

  // Composition: Unit OWNS its Weapon
  // When the Unit is destroyed, the Weapon goes with it
  void setProperty(String name, Object value) => properties[name] = value;
  Object? getProperty(String name) => properties[name];
}

// Usage:
final pirate = Unit("pirate");
pirate.setProperty("weapon", Sword());  // Unit is composed with Sword

// Later: swap weapon at runtime (can't do this with inheritance!)
pirate.setProperty("weapon", Gun());
```

In UML, composition uses a **filled diamond** (◆) — it means the parent owns the child:

```
Unit ◆──────────────► Weapon (interface)
                            ▲    ▲    ▲
                         Sword  Gun  Club
```

> **In composition, the object composed of other behaviors OWNS those behaviors. When the object is destroyed, so are all of its behaviors. The behaviors in a composition do not exist outside of the composition itself.**

### 3. Aggregation

> **Aggregation** is when one class is used as part of another class, but **still exists outside of that other class**.

Aggregation is composition without the ownership. The parts can survive even if the whole is destroyed.

**`Instrument` + `InstrumentSpec` from Chapter 5 — aggregation:**

```
Instrument ◇──── spec ──────────► InstrumentSpec
```

`InstrumentSpec` is *used as part of* `Instrument`, but it can also exist on its own (like when a customer supplies a search spec without an actual instrument). The open diamond (◇) means aggregation — no ownership.

In the `Unit`/`Weapon` case, if cowboys (a new game type) can SHARE weapons and weapons should outlive individual cowboys, you'd use aggregation instead of composition.

> **The easiest way to figure out composition vs. aggregation:** Ask yourself — *does the object whose behavior I want to use exist outside of the object that uses its behavior?*
> - If **no** → composition (it only exists as part of the owner)
> - If **yes** → aggregation (it can live independently)

### Summary: Inheritance vs. the Three Alternatives

| Technique | Use When | Ownership | LSP-safe? |
|---|---|---|---|
| **Inheritance** | Subtype IS truly substitutable for base type | Inherits, doesn't own | Must verify |
| **Delegation** | You want to USE another class's behavior as-is, without changing it | None — just calls | Yes |
| **Composition** | You want to choose from a family of behaviors, and the composed object only makes sense as part of the owner | Owner OWNS composed | Yes |
| **Aggregation** | You want composition-like flexibility, but the composed object exists independently of the owner | None — object lives on its own | Yes |

> **If you favor delegation, composition, and aggregation over inheritance, your software will usually be more flexible, and easier to maintain, extend, and reuse.**

---

## 🧰 OOA&D Toolbox — Chapter 8 Additions

```
OO Principles (now complete):
┌────────────────────────────────────────────────────────────────┐
│ • Encapsulate what varies.                                    │
│ • Code to an interface rather than to an implementation.      │
│ • Each class in your application should have only one         │
│   reason to change. (SRP)                                     │
│ • Classes are about behavior and functionality.               │
│ • Classes should be open for extension, but closed for        │
│   modification. (OCP)                                         │
│ • Avoid duplicate code by abstracting out things that are     │
│   common and placing them in a single location. (DRY)         │
│ • Every object should have a single responsibility, and all   │
│   its services should be focused on that one thing. (SRP)     │
│ • Subtypes must be substitutable for their base types. (LSP)  │
└────────────────────────────────────────────────────────────────┘
```

---

## ✅ Key Takeaways

- **OCP: open for extension, closed for modification.** Once a class is working and tested, don't touch it. Instead, extend it via subclassing or other mechanisms. The OCP is about protecting working code while still allowing new behavior to be added.
- **OCP goes beyond inheritance.** Encapsulation + abstraction is also OCP in action. Private methods are "closed" — only public methods that invoke them can extend the behavior. The key is: extend, don't modify.
- **DRY: one piece of information, one place.** DRY is NOT just "don't copy-paste code." It's about making sure every feature, requirement, and behavior lives in exactly one sensible place in your system. Applying DRY to requirements means combining duplicate requirements into one.
- **SRP: one responsibility, one reason to change.** Every object should do one thing well. If you can't summarize a class's purpose in one sentence, it probably has too many responsibilities. The SRP test ("The [Class] [method] itself") is a fast way to spot violations.
- **Cohesion = SRP.** High cohesion means a class does one focused thing. That's the SRP. They're the same concept, described differently.
- **LSP: if your subclass can't substitute for its base class, you're using inheritance wrong.** The most common sign of an LSP violation: the subclass inherits a bunch of methods that don't make sense on the subclass, or that need to behave completely differently. When you see this, stop using inheritance.
- **Delegation, composition, and aggregation are all alternatives to inheritance** — and often better ones. They let you reuse behavior without creating broken inheritance hierarchies.
- **Use delegation when you want to use another class's behavior exactly as-is.** No ownership, no inheritance — just call the methods of the other class.
- **Use composition when you want to choose from a family of behaviors and the composed object only exists inside the owner.** Destruction of the owner destroys the composed object too.
- **Use aggregation when you want composition's flexibility but the composed object should outlive the owner.** The aggregated object exists independently.
- **These principles work best together, not separately.** OCP + SRP make your classes easier to extend. DRY makes your requirements and code easier to maintain. LSP keeps your inheritance trees from becoming disasters. Use them all.

---

## ⚠️ Common Mistakes

### ❌ Mistake 1: Confusing "open for extension" with "modify the base class"

The OCP says extend — don't modify. If you find yourself going back into a class that's already working and adding new code, ask yourself: could I instead subclass this and override the relevant method? If yes, that's the OCP-compliant approach.

### ❌ Mistake 2: Thinking DRY only means "no copy-paste"

DRY is much bigger than copy-paste avoidance. Two methods in two classes that implement the same requirement are a DRY violation — even if the code looks slightly different. The question is: is this piece of knowledge or behavior implemented in ONE sensible place, or spread across multiple?

### ❌ Mistake 3: Making every class tiny to "follow SRP"

The SRP doesn't mean classes should be as small as possible. It means each class should have ONE clearly-defined responsibility — but that responsibility can encompass many methods. The `Board` class has many methods, all focused on managing the game board. That's one responsibility done well, not many responsibilities.

### ❌ Mistake 4: Assuming subclasses always follow the LSP

Just because the compiler lets you write `Board board = ThreeDBoard()` doesn't mean `ThreeDBoard` actually substitutes correctly for `Board`. The compiler only checks types, not behavior. You have to apply the LSP yourself: can every method on `Board` be called on `ThreeDBoard` with the same meaning and expectations? If not, inheritance is wrong.

### ❌ Mistake 5: Using composition when aggregation is needed (and vice versa)

Joel's mistake in the Five-Minute Mystery: he used **composition** for the `Unit/Weapon` relationship in a cowboy game, but cowboys could SHARE weapons. Since the weapons (lasso, revolver) exist independently of any individual cowboy, he should have used **aggregation**. Composition destroys the weapon when the cowboy is destroyed — but the weapon should survive. Always ask: does the object whose behavior I'm using exist independently?

### ❌ Mistake 6: Inheritance-first thinking

Inheritance is often the first tool developers reach for when they need to reuse behavior. But inheritance comes with the LSP constraint — your subclass MUST be substitutable. Before you inherit, ask: is this a true IS-A relationship? If not, check delegation, composition, or aggregation first.

---

## ❓ There's No Dumb Questions

**Q: Is the OCP just another form of encapsulation?**

A: It's a combination of encapsulation AND abstraction. You find the behavior that stays the same, abstract it into a base class, and lock it down from modification. Then encapsulate the behavior that changes (the varying parts) into subclasses. So OCP uses encapsulation as a mechanism, but it's really about protecting working code while enabling extensibility.

---

**Q: SRP sounds a lot like DRY. Aren't both about a class doing one thing?**

A: They're related but different. DRY is about putting a piece of functionality in ONE place — not duplicating it. SRP is about making sure a class does ONE thing — not mixing responsibilities. In practice, applying SRP often helps you apply DRY (and vice versa), because a class with a single responsibility rarely needs to duplicate behavior from another class.

---

**Q: Does the LSP mean subclassing is bad?**

A: No — subclassing is a key part of OO programming. The LSP just tells you *when* to subclass. If your subclass truly IS-A version of the base type and can substitute for it in all situations, inheritance is fine and correct. The LSP is a quality check, not a prohibition. When you violate the LSP, that's the signal to consider delegation, composition, or aggregation instead.

---

**Q: What's the difference between delegation and composition in UML?**

A: In UML, delegation uses a plain association arrow (→). Composition uses a **filled diamond** (◆→). Aggregation uses an **open diamond** (◇→). But in practice, you often don't need to memorize the symbols — what matters is understanding the ownership semantics: composition = owner destroys the part; aggregation = part lives independently.

---

**Q: When should I prefer aggregation over composition?**

A: Ask: *does the object I'm using need to exist outside of my object?* If multiple objects share the same instance (like multiple cowboys sharing the same lasso), or if the used object should survive past the life of the using object, use aggregation. If the used object is completely owned by and meaningless outside of the using object (like a `Sword` that belongs exclusively to one `Unit` and has no identity outside that unit), use composition.

---

## 📚 Key Terminology

| Term | Definition |
|---|---|
| **Design principle** | A basic tool or technique for designing/writing code to make it more maintainable, flexible, or extensible |
| **OCP (Open-Closed Principle)** | Classes should be open for extension and closed for modification — extend behavior via subclassing, not by modifying working code |
| **DRY (Don't Repeat Yourself)** | Every piece of information and behavior in a system should exist in a single, sensible place — applies to code AND requirements |
| **SRP (Single Responsibility Principle)** | Every object should have one responsibility; all its methods should focus on carrying out that single responsibility |
| **Cohesion** | Another name for the SRP; how focused a class is on doing one well-defined thing |
| **LSP (Liskov Substitution Principle)** | Subtypes must be substitutable for their base types; if your subclass can't be used wherever the base class is expected, you've misused inheritance |
| **SRP analysis** | A technique for testing SRP compliance: write "The [Class] [method] itself" — if the sentence makes no sense, the method belongs elsewhere |
| **Delegation** | Handing off responsibility for a task to another class; used when you want to USE another class's behavior without changing or inheriting it |
| **Composition** | Assembling behavior from a family of classes; the composing class OWNS the composed objects — when the owner is destroyed, so are the parts |
| **Aggregation** | Like composition, but the used objects exist independently of the using object and are not destroyed when it is |
| **Inheritance** | A subclass IS-A version of its base type and substitutes for it correctly; use only when the LSP is satisfied |
| **Association** | A general relationship between classes; delegation is represented as a plain association in UML |
| **Filled diamond (◆)** | UML notation for composition — the owner "contains" the part, which doesn't exist outside it |
| **Open diamond (◇)** | UML notation for aggregation — the "part" exists independently of the "whole" |