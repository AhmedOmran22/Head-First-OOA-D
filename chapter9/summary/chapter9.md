# 📖 Head First OOA&D — Chapter 9 Summary

## *Iterating and Testing: The Software is Still for the Customer*

> **Goal of this chapter:** Stop building things that only look good on diagrams — build things Gary can actually see running. Learn two approaches to iterating deeper into your application (**feature driven development** and **use case driven development**), discover how to write and structure **test cases**, understand **programming by contract** vs **defensive programming**, and complete the `Unit` class for Gary's Game System Framework with working, tested code.

---

## 🗺️ Chapter Overview

Chapter 9 is the reality check chapter. All your tools, principles, and diagrams are worthless if you never ship working code that makes the customer happy. Gary is impatient — he wants to see something running, not more lists and arrows.

The chapter has five major threads:

1. **Two approaches to iterating deeper** — feature driven vs. use case driven development
2. **Writing and structuring test cases** — what makes a good test
3. **Building the `Unit` class completely** — properties, commonality/variability tradeoffs, two competing designs
4. **Programming by contract vs. defensive programming** — two philosophies for handling errors
5. **Unit groups (`UnitGroup`)** — the final piece of the Unit feature

---

## 🔁 Iterating Deeper: Two Approaches

After the big-picture work of Chapters 6–7, you have modules and key features but no finished code. The question is: how do you iterate from "big picture" to "working application"?

> **You write great software iteratively. Work on the big picture, and then iterate over pieces of the app until it's complete.**

There are two basic approaches:

### Feature Driven Development

> **Feature driven development** is when you pick a specific feature in your app, and plan, analyze, and develop that feature to completion.

- You work from the **feature list**
- One feature at a time, knocked off completely before moving to the next
- Works well when you have many disconnected features
- More granular — features are often small
- Lets you show the customer working code faster
- Very functionality-driven; you won't forget any features

### Use Case Driven Development

> **Use case driven development** is when you pick a scenario through a use case, and write code to support that complete scenario through the use case.

- You work from the **use case diagram**
- One scenario at a time, completing all scenarios in one use case before moving to the next
- Works well when the system has lots of processes and complex flows
- More "big picture" — a single scenario often involves a lot of functionality
- Very user-centric; you code for all the different ways a user can use the system
- Good for transactional systems where the system is largely defined by lengthy processes

### Comparison

| | Feature Driven | Use Case Driven |
|---|---|---|
| Focus | Feature list | Use case diagram |
| Granularity | Small, specific | Big, process-oriented |
| Good for | Many disconnected features | Complex flows and processes |
| Speed to show customer | Faster (smaller chunks) | Slower (larger chunks) |
| Risk of missing features | Low | Possible |

> **Both approaches are driven by good requirements. Because requirements come from the customer, both approaches focus on delivering what the customer wants.**

Both can be used on the same project at different stages. Most good software development mixes all three approaches: use case driven, feature driven, and test driven.

---

## 🎯 Choosing Feature Driven for Gary's System

Since Gary is losing patience and wants to see results quickly, the team picks **feature driven development** and starts with **feature #3** from the list — "The framework supports multiple types of troops or units that are game-specific" — because:

1. They already have a class diagram for `Unit` from Chapter 7
2. Most other features depend on the `Unit` class
3. It builds on work already done

Going back to the vision statement reveals Gary expects units to:
1. Have properties that game designers can add
2. Be able to move from one tile to another
3. Be grouped together into armies

This chapter tackles all three, starting with properties.

---

## 🧪 Writing Test Scenarios First

Before writing a single line of code, the chapter introduces a critical discipline: **write your tests first** (this is the core of **test driven development**).

Gary doesn't care about class diagrams — he wants to see code running. Test scenarios let you show him that.

A **test scenario** (in this context — not to be confused with use case scenarios) is a simple description of expected program output that proves the code works:

```
%java UnitTester
Testing the Unit class...
...Created a new unit
...Set "type" to "infantry"
...Set "hitPoints" to 25
...Getting unit type: "infantry"
...Getting unit hitPoints: 25

Test complete.
```

The three test scenarios for the `Unit` class's properties feature:

**Scenario 1** — Setting and getting property values
```
...Created a new unit
...Set "type" to "infantry"
...Set "hitPoints" to 25
...Getting unit type: "infantry"
...Getting unit hitPoints: 25
```

**Scenario 2** — Changing an existing property value
```
...Created a new unit
...Set "hitPoints" to 25
...Set "hitPoints" to 15
...Getting unit hitPoints: 15
```

**Scenario 3** — Getting a non-existent property value
```
...Created a new unit
...Set "hitPoints" to 25
...Getting unit strength: [no value]
...Getting unit hitPoints: 25
```

> **You should test your software for every possible usage you can think of. Be creative!**
>
> **Don't forget to test for incorrect usage of the software, too. You'll catch errors early, and make your customers very happy.**

---

## 📋 Anatomy of a Good Test Case

The chapter formalizes what makes a complete test case. Every good test has **5 components**:

**1. An ID and a name**
Use descriptive names — `testProperty()` not `test1()`. The ID lets you list tests numerically; the name tells you what's being tested.

**2. One specific thing that it tests**
Each test case is *atomic* — it focuses on exactly one piece of functionality. This lets you isolate exactly what broke when a test fails.

**3. An input you supply**
The value or set of values the test uses as test data to execute the functionality.

**4. An output you expect**
What the program should produce given that input. You compare actual output to expected output to determine pass/fail.

**5. A starting state**
Any setup needed before the test runs — create an object, pre-set some values, open a connection, etc.

**The four test cases for Unit properties:**

| ID | What we're testing | Input | Expected Output | Starting State |
|---|---|---|---|---|
| 1 | Setting/Getting a common property (type) | "type", "infantry" | "type", "infantry" | Existing Unit object |
| 2 | Setting/Getting a unit-specific property | "hitPoints", 25 | "hitPoints", 25 | Existing Unit object |
| 3 | Changing an existing property's value | "hitPoints", 15 | "hitPoints", 15 | Unit with hitPoints set to 25 |
| 4 | Getting a non-existent property's value | N/A | "strength", no value | Unit without strength value |

> **Test driven development focuses on getting the behavior of your classes right.**

---

## ⚖️ The Commonality/Encapsulation Tradeoff

Before writing `Unit`, a crucial design debate plays out. The team realizes the current class diagram (from Chapter 7) only addressed game-specific properties via the `Map`. But the vision statement implies common properties too: `id`, `name`, `weapons`.

**Two competing solutions emerge:**

### Solution #1 — Emphasizing Commonality (Sam's approach)

Pull the common properties out of the Map into their own typed fields and methods:

```dart
class Unit {
  final String type;
  final int id;           // ← common, so it gets its own field
  String name;            // ← common, own field
  List<Weapon> weapons;   // ← common, own field
  final Map<String, Object> properties; // unit-specific go here

  Unit(this.id) : type = "";

  int getId() => id;
  void setName(String name) => this.name = name;
  String getName() => name;
  void addWeapon(Weapon weapon) { ... }
  List<Weapon> getWeapons() => weapons;
  void setProperty(String name, Object value) { ... }
  Object? getProperty(String name) { ... }
}
```

**Pros:** Game designers can directly access `id`, `name`, `weapons` — no need to go through `getProperty()` for common stuff. Clearly communicates which properties are standard for all units.

**Cons (DRY violation):** Now there are TWO ways to access properties — via `getId()`, `getName()`, `getWeapons()`, AND via `getProperty()`. That's likely to create duplicate code. Also, property names like `id` and `name` are now hardcoded into the class, so if Gary's clients want to use different naming conventions, it's a maintenance problem.

### Solution #2 — Emphasizing Encapsulation (Randy's approach)

Keep EVERYTHING in the Map, including common properties:

```dart
class Unit {
  // type moved INTO the properties Map
  final Map<String, Object> properties;

  Unit() : properties = {};

  void setProperty(String name, Object value) { ... }
  Object? getProperty(String name) { ... }
}
```

**Pros:** Maximum flexibility — the class itself never changes. If Gary's clients want to rename "id" to "unitId", the `Unit` class doesn't need to change. Truly encapsulates all property details.

**Cons:** Loses commonality — nothing in the class signals that `type`, `id`, `name`, and `weapons` are intended to be standard. Also, `getProperty()` returns `Object`, so caller code has to do a lot of casting at runtime.

### The verdict

The chapter picks **Sam's commonality-focused solution** for Gary's framework, because knowing that `type`, `id`, `name`, and `weapons` are standard for all units is valuable information that should be explicit in the class.

> **Good software is built iteratively. Analyze, design, and then iterate again, working on smaller and smaller parts of your app.**
>
> **Each time you iterate, reevaluate your design decisions, and don't be afraid to CHANGE something if it makes sense for your design.**

---

## 💻 The Final Unit Class

```dart
// package headfirst.gsf.unit
class Unit {
  final String _type;
  final int _id;          // set in constructor, no setId() needed
  String? _name;
  List<Weapon>? _weapons;   // lazy initialized to save memory
  Map<String, Object>? _properties; // lazy initialized

  Unit(this._id) : _type = "";

  int getId() => _id;
  String getType() => _type;
  void setType(String type) { /* ... */ }

  void setName(String name) => _name = name;
  String? getName() => _name;

  void addWeapon(Weapon weapon) {
    _weapons ??= [];
    _weapons!.add(weapon);
  }
  List<Weapon>? getWeapons() => _weapons;

  void setProperty(String property, Object value) {
    _properties ??= {};
    _properties![property] = value;
  }

  // Contract: throws RuntimeException if property doesn't exist
  Object getProperty(String property) {
    if (_properties == null) {
      throw Exception("No properties for this Unit.");
    }
    final value = _properties![property];
    if (value == null) {
      throw Exception("Request for non-existent property.");
    }
    return value;
  }
}
```

**Key implementation decisions:**
- `id` is set in the constructor — no `setId()` needed, so no setter method
- `weapons` and `properties` are **lazily initialized** (`??=`) — only created when first needed. With potentially thousands of units, allocating empty Lists and Maps for every single unit wastes memory
- The `Weapon` class starts as an empty stub — just enough to make `Unit` compile and test, without over-engineering

---

## 📜 Programming by Contract vs. Defensive Programming

After the test scenarios reveal that `getProperty()` for a non-existent property returns null, a new customer (Sue, who manages a team of game developers) says: *"Just throw an exception if someone asks for a non-existent property. We'll write our code correctly."*

This introduces one of the most important practical concepts in the chapter:

### Programming by Contract

> **When you program by contract, you and your software's users are agreeing that your software will behave in a certain way.**

In **programming by contract**, the class defines a **contract** — what it will do under certain conditions — and trusts that the caller will use it correctly:

- **Original contract:** "I'll return null if you ask for a property that doesn't exist. You handle it."
- **New contract (after Sue's request):** "I'll throw a `RuntimeException` if you ask for a non-existent property. Don't ask for things that don't exist."

Why `RuntimeException` (unchecked)? Because Sue's clients don't want to wrap every `getProperty()` call in a `try/catch`. The contract says they're competent programmers who won't ask for non-existent properties.

```dart
// Updated getProperty() — now programming by contract
Object getProperty(String property) {
  if (_properties == null) {
    throw Exception("No properties for this Unit.");  // RuntimeException equiv
  }
  final value = _properties![property];
  if (value == null) {
    throw Exception("Request for non-existent property.");
  }
  return value;
}
```

**When to use:** When your users are competent programmers who understand the contract and will abide by it. Produces cleaner, shorter code on both sides. Better performance (no defensive checks everywhere).

### Defensive Programming

> **Defensive programming** doesn't trust other software, and does extensive error and data checking to ensure the other software doesn't give you bad or unsafe information.

In **defensive programming**, the class assumes the worst and protects itself (and the caller):

```dart
// Defensive version — caller gets a checked exception, forced to handle it
Object getPropertyDefensive(String property) throws IllegalAccessException {
  if (_properties == null) {
    throw IllegalAccessException("What are you doing? No properties!");
  }
  final value = _properties![property];
  if (value == null) {
    throw IllegalAccessException("You're screwing up! No property value.");
  }
  return value;
}
```

Caller code using the defensive version has to handle the exception explicitly:

```dart
// Defensive caller code — lots of null checks and try/catch
String? name = unit.getName();
if (name != null && name.length > 0) {
  print("Unit name: $name");
}

Object? value = unit.getProperty("hitPoints");
if (value != null) {
  try {
    int hitPoints = value as int;
    // use hitPoints
  } catch (e) {
    // handle cast error
  }
}
```

**When to use:** When you don't trust that callers will use your code correctly. More protective but produces verbose code and extra overhead on every call.

### Key Distinction

> **When you are programming by contract, you're working with client code to agree on how you'll handle problem situations.**
>
> **When you're programming defensively, you're making sure the client gets a "safe" response, no matter what the client wants to have happen.**

The choice is usually determined by your customer/client's requirements — not by your own preference.

---

## 🔄 Updating Tests When the Contract Changes

When the contract changes (from returning null to throwing an exception), the test cases change too. **Test #4** (getting a non-existent property) had to be rewritten:

**Before (null-returning contract):**
```dart
// Expected output: "strength: [no value]"
Object? value = unit.getProperty("strength");
// just check if null
```

**After (exception-throwing contract):**
```dart
// Expected behavior: exception is thrown
void test4(Unit unit, String propertyName) {
  print("\nTesting getting a non-existent property's value.");
  try {
    Object value = unit.getProperty(propertyName);
    // If we get here, NO exception was thrown — test failed
    print("Test failed.");
  } catch (RuntimeException e) {
    // Exception was thrown — that's what we expected — test passed
    print("Test passed.");
    return;
  }
}
```

---

## 🏗️ Unit Movement and Unit Groups

After completing unit properties, the chapter briefly addresses the remaining two pieces of Unit functionality:

### Unit Movement

From Chapter 7's analysis: movement is completely different for every game. The commonality analysis showed that what's common is the *structure* of movement (a check and a calculation), but the *algorithm* is entirely game-specific. The conclusion from Chapter 7 stands:

> **Movement is up to the game designers.** The framework documents this and moves on. Game designers will handle their own movement algorithms.

This is an example of good architecture: **not building what isn't your job to build**.

### Unit Groups (`UnitGroup`)

Units need to be groupable into armies. The solution uses a `Map<int, Unit>` — the unit's `id` as the key, the `Unit` object as the value:

```dart
class UnitGroup {
  final Map<int, Unit> _units = {};

  // Construct from a list
  UnitGroup(List<Unit> unitList) {
    for (final unit in unitList) {
      _units[unit.getId()] = unit;
    }
  }

  UnitGroup.empty();

  void addUnit(Unit unit) => _units[unit.getId()] = unit;

  void removeUnitById(int id) => _units.remove(id);
  void removeUnit(Unit unit) => removeUnitById(unit.getId());

  Unit? getUnit(int id) => _units[id] as Unit?;

  List<Unit> getUnits() => _units.values.toList();
}
```

**Why a Map?** Storing units by ID lets you retrieve and remove them in O(1) by ID — much more efficient than searching a List. Using the unit's `id` as the map key also enforces the no-duplicates rule naturally.

**Test cases for `UnitGroup` (IDs 10–15):**

| ID | What we're testing | Input | Expected Output | Starting State |
|---|---|---|---|---|
| 10 | Creating a UnitGroup from a list | List of units | Same list of units | No existing UnitGroup |
| 11 | Adding a unit to a group | Unit with ID 100 | Unit with ID 100 | Empty UnitGroup |
| 12 | Getting a unit by its ID | 100 | Unit with ID 100 | UnitGroup with no entries |
| 13 | Getting all the units in a group | N/A | List matching initial list | UnitGroup with a known list |
| 14 | Removing a unit by ID | 100 | List with no unit with ID 100 | Empty UnitGroup |
| 15 | Removing a unit by Unit instance | Unit with ID 100 | List with no unit with ID 100 | Empty UnitGroup |

---

## 🔧 Iterating Further — Breaking Features Down

The chapter ends with an important insight: iteration is fractal. You don't just iterate at the feature level — you iterate within each feature too.

```
Big Problem (Gary's Game System Framework)
     ↓
Features (7 features from the feature list)
     ↓
Behaviors within a feature:
   Unit feature
   ├── Properties    ← done in this chapter
   ├── Movement      ← game designer's responsibility
   └── Groups        ← done in this chapter
```

> **Break your apps up into smaller chunks of functionality. You're taking each problem, breaking it up using use cases or features, and then solving a part of the problem, over and over.**

And each time you go deeper:
- Apply analysis again at the lower level
- Make design decisions (like the commonality vs. encapsulation debate for `Unit`)
- **Reevaluate earlier decisions** — they might need to change as you learn more
- Never be afraid to change a design if it makes sense

> **Avoid analysis paralysis.** It's always better to start down one path, even if you're not 100% sure it's the right one, and get some work done — than to not make a choice at all.

---

## ✅ Key Takeaways

- **You still write software for the customer.** All the tools, principles, and diagrams in the world don't matter if you never ship something that works and makes the customer happy. Customers want to see running code, not use case diagrams.
- **Feature driven and use case driven are both valid approaches.** Feature driven is faster for granular work; use case driven is better for complex transactional systems. Most good software uses both, plus test driven development, at different stages.
- **Write tests before writing code.** Knowing your tests lets you figure out exactly what code you need to write. The test cases describe the behavior you're building.
- **A good test case has 5 parts:** ID and name, one specific thing to test, input, expected output, and starting state. Keep each test focused on exactly one piece of functionality.
- **Test for incorrect usage too.** Edge cases, non-existent properties, empty states — these catch bugs before the customer does.
- **Design decisions are always tradeoffs.** Commonality gives better discoverability and performance; encapsulation gives better flexibility and resistance to change. Neither is always right. Reevaluate as you iterate.
- **Lazy initialization matters at scale.** With thousands of `Unit` objects, initializing empty `List` and `Map` for every unit wastes memory. Only create them when actually needed (`??=` in Dart).
- **Programming by contract vs. defensive programming is a customer-driven choice.** If your users are competent developers who understand the contract, program by contract. If you don't trust them (or they've told you to protect against misuse), program defensively. You don't usually decide this yourself.
- **Iteration is fractal.** You iterate at the application level (between features), at the feature level (between behaviors), and at the behavior level (between design options). Analysis and design happen at every level.
- **Movement being "different for every game" is a correct design decision.** When commonality analysis reveals more differences than similarities, the right answer is often to not provide a generic solution in the framework and leave it to the game designer.

---

## ⚠️ Common Mistakes

### ❌ Mistake 1: Showing the customer diagrams instead of running code

Gary doesn't care about your class diagrams. Running code — even simple test output — convinces the customer progress is happening far more than any number of UML diagrams. Show working code as early and often as possible.

### ❌ Mistake 2: Writing tests after the code

If you write code first, you unconsciously shape the tests to match what you built, not what the customer actually needs. Write tests (or at least test scenarios) first — they define the expected behavior before implementation biases your thinking.

### ❌ Mistake 3: Making tests that test too many things at once

One test, one piece of functionality. If your test for `setProperty()` also tests `getProperty()` AND `removeProperty()` AND null handling, when it fails you don't know which piece broke. Keep tests atomic.

### ❌ Mistake 4: Ignoring the tradeoffs in design decisions

Sam's commonality solution has DRY violations. Randy's encapsulation solution loses explicit common properties. Picking one without acknowledging the downsides leads to surprises later. Always consciously weigh what you're gaining and giving up.

### ❌ Mistake 5: Analysis paralysis

When you can't decide between two reasonable design choices, pick one and iterate. You'll find out if it's wrong when you go deeper, and changing a design decision early is cheap. Spending endless hours debating is more expensive than just starting.

### ❌ Mistake 6: Thinking "programming by contract" means "no error handling"

Programming by contract still throws exceptions — it just throws unchecked `RuntimeException`s instead of checked exceptions, and it trusts the caller to use the code correctly. It's not sloppy code; it's code with a clear, explicit contract.

---

## ❓ There's No Dumb Questions

**Q: So are we doing test driven development, or feature driven development?**

A: Both. Most good software development mixes approaches. You might start with a use case (use case driven), then pick a small feature within that use case to work on (feature driven), then write tests to figure out how to implement that feature (test driven). The labels aren't mutually exclusive — use whichever combination makes sense at each stage.

---

**Q: When should I use programming by contract vs. defensive programming?**

A: This is usually determined by your customers and the types of users that will be using the software. If your customers are experienced developers who understand the API and have told you to assume they'll use it correctly (like Sue's team), program by contract — cleaner code, better performance. If you're building software used by less experienced programmers, or if the consequences of misuse are severe, consider defensive programming. In practice, most frameworks use programming by contract for their core APIs and defensive programming at the entry points where external/user data comes in.

---

**Q: Isn't a scenario the same as a use case scenario?**

A: No — there are two different uses of the word "scenario" in this book. A use case scenario (from Chapters 2–3) is one path through a use case, including alternate paths. A test scenario (this chapter) is a simple, informal description of how a class or method should behave when executed, used to prove the code works. The test scenario is much simpler and less formal than a use case scenario.

---

**Q: Why is `UnitGroup` a separate class and not just a `List<Unit>` in the game code?**

A: Because a `List<Unit>` doesn't have the behavior we need — getting and removing units by ID. Wrapping a `Map<int, Unit>` in a `UnitGroup` class gives us O(1) lookup and removal by ID, and puts the "unit grouping" responsibility in one cohesive class (SRP). It's also open for extension (OCP) — if the framework needs to add new group behaviors later, `UnitGroup` is the right place to put them without affecting `Unit`.

---

## 📚 Key Terminology

| Term | Definition |
|---|---|
| **Feature driven development** | An iterative approach where you pick one feature and develop it completely before moving to the next |
| **Use case driven development** | An iterative approach where you pick one scenario through a use case and implement it completely |
| **Test driven development** | Writing test cases (or test scenarios) first, then writing code that passes those tests |
| **Test case** | A specific, atomic test with 5 parts: ID/name, what's being tested, input, expected output, starting state |
| **Test scenario** | An informal description of expected program output that proves the code works, without the full formality of a test case |
| **Programming by contract** | A programming style where the class defines a contract for its behavior, trusting callers to use it correctly; unchecked exceptions signal contract violations |
| **Defensive programming** | A programming style that doesn't trust callers, does extensive checks, and returns "safe" responses (null, empty objects, checked exceptions) even in error cases |
| **Lazy initialization** | Creating an object only when it's first needed, rather than in the constructor; saves memory when many instances may never need that object |
| **Analysis paralysis** | Getting stuck debating design decisions instead of making a choice and building something; always worse than picking a direction and iterating |
| **`UnitGroup`** | A class that groups `Unit` objects together (armies), using a `Map<int, Unit>` to enable O(1) lookup and removal by unit ID |
| **Atomic test** | A test that focuses on exactly one piece of functionality — if it fails, you know exactly what's broken |
| **Contract** | The agreement between a class and its callers about what the class will do under specific conditions |