# 📖 Head First OOA&D — Chapter 10 Summary

## *The OOA&D Lifecycle: Putting It All Together*

> **Goal of this chapter:** Take everything you've learned across 9 chapters and weave it into **one coherent, repeatable process** — the OOA&D Project Lifecycle. Then prove it works by building a complete real-world application from scratch: the **Objectville Travel RouteFinder**, a subway routing system built start to finish, from vision statement to working code. This is the final test.

---

## 🗺️ Chapter Overview

Chapter 10 is the culmination of the entire book. It doesn't introduce fundamentally new concepts — it shows how every tool, technique, and principle you've learned fits into **a single unified process** that you can apply over and over again.

**The big project: Objectville Travel RouteFinder**

Objectville Travel hires you to build a subway routing application that:
- Stores Objectville's complete subway network (stations, connections, lines)
- Loads the network from a text file
- Finds a valid route between any two stations on any lines
- Prints out the directions in human-readable form

The chapter walks through the **entire OOA&D lifecycle** twice — once per use case — producing a fully working application by the end.

---

## 🏗️ The OOA&D Project Lifecycle

The central diagram of Chapter 10 — the complete picture of software development the OOA&D way:

```
Object-Oriented ANALYSIS (Step 1: Make sure the software does what the customer wants)
┌───────────────────────────────────────────────────────────────────────────────┐
│  Feature List  →  Use Case Diagrams  →  Break Up the Problem  →  Requirements│
│                                                                               │
│  Figure out      Nail down the big     Break into modules,     Individual    │
│  what the app    processes the app     decide order of         requirements  │
│  is supposed     performs and any      work.                   for each      │
│  to do.          external actors.                              module.       │
└───────────────────────────────────────────────────────────────────────────────┘
                                    ↓
                    ◄──── Iterative Development ────►
┌───────────────────────────────────────────────────────────────────────────────┐
│  Domain Analysis  →  Preliminary Design  →  Implementation  →  Delivery      │
│                                                                               │
│  Map use cases to    Fill in details:       Write code,         Ship it.     │
│  objects; ensure     object relationships,  test it, and        Submit       │
│  customer speaks     OO principles,         make it work.       invoices.    │
│  same language.      design patterns.       For each feature.   Get paid.    │
└───────────────────────────────────────────────────────────────────────────────┘

2. Apply basic OO principles to add flexibility.
3. Strive for a maintainable, reusable design.
```

> **Each iteration goes through the same phases.** Once an iteration is complete, if there are more use cases or features, you take the next one and start the requirements phase again. The lifecycle repeats until you're done.

---

## 📋 Phase 1: Feature List

Reading the Statement of Work from Objectville Travel, the feature list is:

| # | Feature |
|---|---|
| 1 | We have to be able to represent a subway line, and the stations along that line |
| 2 | We must be able to load multiple subway lines into the program, including overlapping lines |
| 3 | We need to be able to figure out a valid path between any two stations on any lines |
| 4 | We need to be able to print out a route between two stations as a set of directions |

> **Your feature lists are all about understanding what your software is supposed to do.**

> **Your use case diagrams let you start thinking about how your software will be used, without getting into a bunch of unnecessary details.**

---

## 📊 Phase 2: Use Case Diagram

The RouteFinder has two actors and two use cases:

```
┌──────────────────────────────────────────────────┐
│                                                  │
│           ┌──────────────────────────┐           │
○───────────│ Load network of subway   │           │
│           │ lines                    │           │
│           └──────────────────────────┘           │
│ Administrator                                    │
│                                                  │
│           ┌──────────────────────────┐           │
○───────────│ Get directions           │           │
│           └──────────────────────────┘           │
│ Travel Agent                                     │
│ (or Tourist)                                     │
└──────────────────────────────────────────────────┘
```

**Feature-to-use-case mapping:**
- Features 1 & 2 (represent subway, load lines) → "Load network of subway lines"
- Features 3 & 4 (find route, print directions) → "Get directions"

> **Important nuance:** Feature 1 (representing the subway) doesn't appear directly in any use case steps, but it's required for the use cases to function at all. Features reflect **functionality**; use cases reflect **usage**. They work together but are not the same thing.

---

## 🧩 Phase 3: Break Up the Problem (The Modules)

The RouteFinder is broken into 4 modules:

```
┌───────────────┐  ┌───────────────┐  ┌───────────────┐     ┌───────────────┐
│    Subway     │  │    Loader     │  │    Printer    │     │     Test      │
│               │  │               │  │               │     │               │
│ All code to   │  │ Loads a       │  │ Prints a      │     │ Proves the    │
│ represent     │  │ subway from   │  │ route to any  │     │ system works  │
│ stations,     │  │ a file (or    │  │ output format │     │ to the        │
│ connections,  │  │ other source) │  │ (screen, file,│     │ customer.     │
│ lines and get │  │               │  │ etc.)         │     │               │
│ directions.   │  │               │  │               │     │               │
└───────────────┘  └───────────────┘  └───────────────┘     └───────────────┘
        ↑                  ↑                  ↑
        └──────────────────┴──────────────────┘
               These three form the "black box" used
               by tourists and travel agents
```

**OO principles applied here:** Single Responsibility Principle (each module has one job) and Encapsulation (loading and printing are separate from the subway representation itself).

> The Test module is **outside** the system — it interacts with the system but isn't part of it. You always need test code to prove the system works; don't leave testing as an afterthought.

---

## 🔄 Iterating: The Development Loop

With the big picture in place, you iterate through each use case using **use case driven development**:

```
Start with Use Case 1
  ↓
Requirements: Write the full use case
  ↓
"Understand the Problem" (secret extra step!)
  ↓
Domain Analysis: Figure out candidate classes and operations
  ↓
Preliminary Design: Draw class diagram
  ↓
Implementation: Write code
  ↓
Test: Prove it works
  ↓
Iterate to Use Case 2 → repeat all phases
  ↓
Delivery
```

**The secret step — "Understand the Problem":** Sometimes you get stuck writing a use case because you don't actually understand the domain well enough yet. In this chapter, to write the "Load network of subway lines" use case, you had to first understand what a subway *is* (stations, connections, lines) and what format the input file uses. Taking this step back is not a failure — it's essential.

---

## 📝 Iteration 1: Load Network of Subway Lines

### The Use Case

```
Load network of subway lines — Use Case

1. The administrator supplies a file of stations and lines.
2. The system reads in the name of a station.
3. The system validates that the station doesn't already exist.
4. The system adds the new station to the subway.
5. The system repeats steps 2–4 until all stations are added.
6. The system reads in the name of a line to add.
7. The system reads in two stations that are connected.
8. The system validates that the stations exist.
9. The system creates a new connection between the two stations,
   going in both directions, on the current line.
10. The system repeats steps 7–9 until the line is complete.
11. The system repeats steps 6–10 until all lines are entered.
```

### Textual Analysis → Candidate Classes

Nouns from the use case become candidate classes:

| Noun | Class? |
|---|---|
| administrator | ❌ External actor |
| file | ❌ External input |
| system | ❌ This IS the system |
| station | ✅ `Station` |
| subway | ✅ `Subway` |
| line | 🤔 Represented as a String name on a Connection (no Line class needed) |
| connection | ✅ `Connection` |

Verbs from the use case become candidate operations: `addStation()`, `hasStation()`, `addConnection()`, `hasConnection()`.

### The Class Diagram

```
SubwayLoader                    Subway
loadFromFile(File): Subway ───► stations: Station[*]
                                connections: Connection[*]
                                addStation(String)
                                hasStation(String): boolean
                                addConnection(String, String, String)
                                hasConnection(String, String, String): boolean

Station                         Connection
name: String              ◄──── station1: Station
getName(): String               station2: Station
equals(Object): boolean         lineName: String
hashCode(): int                 getStation1(): Station
                                getStation2(): Station
                                getLineName(): String
```

**Key design decision: Why no `Line` class?**

The Statement of Work says we need to represent a subway and get directions between stations. Once we have directions, we can ask each `Connection` for its line name — there's no need for a `Line` class. This is a **design decision based on how the system will be used**.

> **Your design decisions should be based on how your system is used, as well as good OO principles.**

### `Station.equals()` and `hashCode()` — A Design Insight

One of the most important coding decisions: overriding `equals()` and `hashCode()` on `Station` so that two `Station` objects with the same name are considered equal, regardless of whether they're the same object in memory.

```dart
// Java equivalent in concept:
@override
bool operator ==(Object other) {
  if (other is Station) {
    return other.name.toLowerCase() == name.toLowerCase();
  }
  return false;
}

@override
int get hashCode => name.toLowerCase().hashCode;
```

Without this, code like `stations.contains(new Station("Ajax Rapids"))` wouldn't work correctly — it would check memory address equality, not name equality. This insight comes directly from **understanding the system** — we know stations will be compared by name constantly.

### Implementation: The Three Classes

**`Station`** — A named point on the subway map. Simple and focused (SRP).

**`Connection`** — Links two stations on a specific line. Immutable after creation. When you add a connection A→B, you also add B→A so subways are bidirectional.

**`Subway`** — The core class. Uses a `Map<Station, List<Station>>` (the "network") to store adjacency for fast route-finding. Key methods:

```dart
class Subway {
  final List<Station> stations = [];
  final List<Connection> connections = [];
  final Map<Station, List<Station>> network = {};  // adjacency map

  void addStation(String stationName) {
    if (!hasStation(stationName)) {
      stations.add(Station(stationName));
    }
  }

  bool hasStation(String stationName) =>
      stations.contains(Station(stationName));  // uses equals()!

  void addConnection(String s1, String s2, String lineName) {
    // add connection AND its reverse (bidirectional)
    // also update the network adjacency map
  }
}
```

**`SubwayLoader`** — Reads the text file line by line, calls `addStation()` for each station name, then `addConnection()` for each pair of connected stations per line. Respects SRP — loading is completely separate from representation.

### Protecting Clients from Implementation Details

A key architectural insight: **don't expose `Station` and `Connection` to client code if they don't need to interact with them directly**.

```
Client code           Subway class
   |                      |
   | addStation(String)   |   Station object (created internally)
   |─────────────────────►|──────────────────────────────────────►
   |                      |
   | hasStation(String)   |   Connection object (created internally)
   |─────────────────────►|──────────────────────────────────────►
```

Client code (like `SubwayLoader`) only works with Strings — names of stations and lines. The `Subway` class handles all the object creation internally. This means you can change how `Station` and `Connection` work without affecting any code that just uses the `Subway` class.

> **You should only expose clients of your code to the classes that they NEED to interact with.**

### Testing Iteration 1: `LoadTester`

```dart
// LoadTester verifies 3 stations and 3 connections from 3 different lines
SubwayLoader loader = SubwayLoader();
Subway objectville = loader.loadFromFile(File("ObjectvilleSubway.txt"));

// Test stations
bool stationsPassed = objectville.hasStation("DRY Drive") &&
    objectville.hasStation("Weather-O-Rama, Inc.") &&
    objectville.hasStation("Boards 'R' Us");

// Test connections (station1, station2, lineName)
bool connectionsPassed = objectville.hasConnection("Ajax Rapids",
    "HTML Heights", "Booch Line") && ...;
```

Test output:
```
%java LoadTester
Testing stations...
...station test passed successfully.

Testing connections...
...connections test passed successfully.
```

**Iteration 1 is done.** Time to iterate.

---

## 🔄 Iteration 2: Get Directions

After completing Iteration 1, you go back to the **requirements phase** for the next use case.

### The Use Case

```
Get directions — Use Case

1. The travel agent gives the system a starting station and ending station.
2. The system validates that the starting and ending stations both exist on the subway.
3. The system calculates a route from the starting station to the ending station.
4. The system prints out the route calculated.
```

### Updated Class Diagram

The main addition: `getDirections()` on `Subway`, and a new `SubwayPrinter` class:

```
Subway (updated)
  getDirections(String, String): List<Connection>  ← NEW

SubwayPrinter (new)
  out: PrintStream
  printDirections(List<Connection>)
```

A route is represented as a `List<Connection>` — each connection is one hop, and the connection knows which line it's on.

### Implementation: `getDirections()` — Dijkstra's Algorithm

Finding the shortest path between two stations in a graph is a classic computer science problem, solved by **Dijkstra's algorithm**. The chapter provides this as "Ready-bake Code" (pre-written code you can use directly):

```dart
// The key insight: the Subway maintains a Map<Station, List<Station>> 
// (the "network" adjacency map) which makes path-finding efficient.

List<Connection> getDirections(String startName, String endName) {
  // Validation
  if (!hasStation(startName) || !hasStation(endName)) {
    throw Exception("Stations do not exist on this subway.");
  }

  Station start = Station(startName);
  Station end = Station(endName);
  
  // BFS/Dijkstra to find shortest path
  // Uses network adjacency map to traverse connected stations
  // Records previousStations to reconstruct the path
  // Returns list of Connection objects forming the route
}
```

> **Sometimes the best code for a particular problem has already been written. Don't get hung up on writing code yourself if someone already has a working solution.**

The chapter credits a college student who helped implement a version of Dijkstra's algorithm for the subway. Good developers use existing solutions for hard, well-known problems.

### Implementation: `SubwayPrinter`

```dart
class SubwayPrinter {
  final PrintStream out;
  SubwayPrinter(OutputStream out) : out = PrintStream(out);

  void printDirections(List<Connection> route) {
    Connection first = route[0];
    String previousLine = first.getLineName();

    print("Start out at ${first.getStation1().getName()}.");
    print("Get on the $previousLine heading towards ${first.getStation2().getName()}.");

    for (int i = 1; i < route.length; i++) {
      Connection conn = route[i];
      String currentLine = conn.getLineName();
      if (currentLine == previousLine) {
        print("Continue past ${conn.getStation1().getName()}...");
      } else {
        print("When you get to ${conn.getStation1().getName()}, get off the $previousLine.");
        print("Switch over to the $currentLine, heading towards ${conn.getStation2().getName()}.");
        previousLine = currentLine;
      }
    }
    print("Get off at ${route.last.getStation2().getName()} and enjoy yourself!");
  }
}
```

### The Test: `SubwayTester`

```
%java SubwayTester "Mighty Gumball, Inc." "Choc-O-Holic, Inc."

Start out at Mighty Gumball, Inc..
Get on the Jacobson Line heading towards Servlet Springs.
When you get to Servlet Springs, get off the Jacobson Line.
Switch over to the Wirfs-Brock Line, heading towards Objectville Diner.
Continue past Objectville Diner...
When you get to Head First Lounge, get off the Wirfs-Brock Line.
Switch over to the Gamma Line, heading towards OOA&D Oval.
When you get to OOA&D Oval, get off the Gamma Line.
Switch over to the Meyer Line, heading towards CSS Center.
Continue past CSS Center...
When you get to Head First Theater, get off the Meyer Line.
Switch over to the Rumbaugh Line, heading towards Choc-O-Holic, Inc.
Get off at Choc-O-Holic, Inc. and enjoy yourself!
```

**Iteration 2 is done. The software is complete.** Deliver it.

---

## 🔍 Iteration Makes Problems Easier

A pattern you'll notice: the second iteration was **dramatically easier** than the first.

```
Iteration 1:   Worked on THREE modules (Subway + Loader + Test)
               Wrote Station, Connection, Subway, SubwayLoader
               Completed the entire loading use case

Iteration 2:   Built on everything from Iteration 1
               Only needed to add getDirections() + SubwayPrinter
               Most of the Subway module was already done
               Even tests were already in place
```

> **Once you've completed your first iteration, your successive iterations are often a lot easier, because so much of what you've already done makes those later iterations easier.**

---

## 🔄 The Constant Back-and-Forth

One of the deepest insights of Chapter 10: software development is always oscillating between **code** and **customer**:

```
"Break Up the Problem" phase     →  Focuses on CODE (modules, structure)
"Requirements" phase             →  Focuses on CUSTOMER (use cases, what they want)
"Domain Analysis" phase          →  Focuses on CUSTOMER (their language, their concepts)
"Preliminary Design" phase       →  Focuses on CODE (classes, relationships)
"Implementation" phase           →  Focuses on CODE (writing it)
Test classes                     →  Focuses on CUSTOMER (prove it works as expected)
```

> **It's your job to balance making sure the customer gets the functionality they want with making sure your code stays flexible and well-designed.**

---

## 🚀 OOA&D is About Options

The final lesson of the book: there is no single right way to solve any software problem.

> **OOA&D is about having lots of options. There is never one right way to solve a problem, so the more options you have, the better chance you'll find a good solution to every problem.**

The OOA&D lifecycle maps every tool you've learned to a phase — but almost every tool can be used at almost any phase. The most effective software developers have as many tools as possible, and can choose whichever combination works best at each stage of development.

---

## 💡 Iteration #3: Suggestions for Further Improvement

The chapter ends with suggestions for going further on the RouteFinder — applying the full lifecycle again:

1. **Make loading more extensible** — currently only loads from a `File`. Design an interface or abstract class for loading from files, InputStreams, databases, etc. (Hint: consider the Strategy pattern)

2. **Allow different output sources and formats** — currently only prints to `System.out` in one format. Design a flexible Printer module that supports verbose, compact, and XML formats, to different output targets

Both suggestions involve applying **OCP** (open for extension, closed for modification) and **SRP** (each output format in its own class) — principles from Chapter 8 that never stop being relevant.

---

## ✅ Key Takeaways

- **The OOA&D lifecycle is the whole book in one process.** Feature List → Use Case Diagrams → Break Up the Problem → Requirements → Domain Analysis → Preliminary Design → Implementation → Delivery. Iterate until done.
- **The three steps of great software apply at every iteration:** 1. Make sure it does what the customer wants. 2. Apply OO principles for flexibility. 3. Strive for maintainable, reusable design.
- **The "secret step" — understand the problem.** If you get stuck writing a use case, step back and understand the domain first. This is not failure; it's essential.
- **Textual analysis maps use case language directly to code.** Nouns → candidate classes. Verbs → candidate operations. It's the bridge between requirements and design.
- **Design decisions come from how the system will be used.** No `Line` class was needed because lines are only queried through connections. The system's behavior drove the design, not the other way around.
- **Protect clients from implementation details.** `SubwayLoader` and `SubwayTester` only work with Strings. The Subway class handles `Station` and `Connection` objects internally. Clients shouldn't be coupled to classes they don't need.
- **Override `equals()` and `hashCode()` when objects will be compared by value.** Two `Station` objects with the same name should be equal. Not doing this breaks `contains()`, sets, and maps in subtle ways.
- **Iteration 1 is always the hardest.** The work you do in Iteration 1 pays dividends in every subsequent iteration. Iteration 2 of the RouteFinder was much faster because Iteration 1 laid the groundwork.
- **Use existing solutions for hard, well-known problems.** Dijkstra's algorithm for shortest-path routing doesn't need to be reinvented. Good developers find and use existing solutions.
- **OOA&D is about options, not rules.** The more tools you have and the more comfortable you are using them at any phase, the better developer you'll be. There is no single right way.

---

## ⚠️ Common Mistakes

### ❌ Mistake 1: Skipping the "understand the problem" step

When you don't understand what a subway *is*, you can't write a good use case for loading one. If you find yourself unable to write a use case, it usually means you haven't understood the domain yet. Step back, study the problem, then return.

### ❌ Mistake 2: Treating features and use cases as the same thing

Features reflect what the system **does** (functionality). Use cases reflect how the system **is used** (interactions). A feature may not appear in any use case steps but is still required for use cases to function. Both are requirements, but they answer different questions.

### ❌ Mistake 3: Exposing too many classes to client code

`SubwayLoader` only needs to call `addStation()` and `addConnection()` on `Subway` — it never needs to create `Station` or `Connection` objects directly. If you expose those classes to `SubwayLoader`, you create unnecessary coupling. When `Station` changes, `SubwayLoader` breaks.

### ❌ Mistake 4: Forgetting to override `equals()` and `hashCode()` together

If you override `equals()`, you MUST override `hashCode()` too. Java's contract requires that objects that are `equals()` must have the same `hashCode()`. Breaking this contract causes subtle, hard-to-debug failures in hash-based collections (`HashMap`, `HashSet`).

### ❌ Mistake 5: Trying to re-implement well-known algorithms from scratch

Dijkstra's shortest path algorithm has been studied, optimized, and implemented thousands of times. Trying to write your own from scratch for a project is usually a waste of time that adds risk (bugs in your algorithm) and doesn't add value. Find a working implementation and use it.

### ❌ Mistake 6: Treating the lifecycle as a strict linear sequence

Almost every phase involves some of the others. Writing use cases reveals missing features. Writing code reveals misunderstandings in domain analysis. The lifecycle is a framework for thinking, not a waterfall. Expect to revisit earlier phases as you learn more.

---

## ❓ There's No Dumb Questions

**Q: It seems like you could put almost every OOA&D magnet on almost every lifecycle phase. Doesn't that mean the phases aren't very distinct?**

A: That's exactly right — and that's the point. Although there are basic phases in a good development cycle, you can use most OOA&D tools at almost any stage. Encapsulation applies during design AND implementation AND refactoring. Test scenarios apply during requirements AND implementation. The lifecycle tells you what to focus on at each stage; the tools you use are up to you based on what the problem needs.

---

**Q: Why do use cases sometimes involve code from multiple modules? I thought modules were supposed to keep things separate.**

A: Modules separate code by **responsibility**, not by use case. The "Get directions" use case involves the Subway module (finding the route) and the Printer module (printing it). These responsibilities are genuinely different — that's why they're in separate modules. Use cases describe the *flow of a user interaction*, which naturally spans multiple responsibilities. Think of modules as organizing your code; use cases as organizing the user's experience.

---

**Q: When should I create a `Line` class vs. just storing the line name as a String?**

A: Ask yourself how your system uses the concept. In this RouteFinder, a "line" is only ever queried as a label on a connection. Nobody needs to find all connections on a line, or add stations to a line independently. So a String name on `Connection` is sufficient — adding a `Line` class would create complexity without value. If requirements change (e.g., "show me a map of the Gamma Line"), then a `Line` class becomes necessary. Design for how the system is used today; refactor when needs change.

---

## 📚 Key Terminology

| Term | Definition |
|---|---|
| **OOA&D Project Lifecycle** | The complete repeatable process: Feature List → Use Case Diagrams → Break Up the Problem → Requirements → Domain Analysis → Preliminary Design → Implementation → Delivery — iterated until done |
| **Textual analysis** | Analyzing a use case by pulling out nouns (candidate classes) and verbs (candidate operations) to begin domain analysis and preliminary design |
| **Candidate class** | A noun from textual analysis that may become a class in the system design |
| **Candidate operation** | A verb from textual analysis that may become a method in the system design |
| **Iterative development** | Building software by completing one use case or feature at a time, then iterating to the next, cycling through all phases of the lifecycle repeatedly |
| **"Understand the Problem" step** | The secret extra step inserted between "Break Up the Problem" and "Requirements" when you realize you don't understand the domain well enough to write use cases yet |
| **Ready-bake code** | Pre-written code (for hard, well-known problems like Dijkstra's algorithm) that you can use directly rather than implementing from scratch |
| **Dijkstra's algorithm** | A well-known algorithm for finding the shortest path between two nodes in a graph; used here to find routes between subway stations |
| **Adjacency map** | A `Map<Station, List<Station>>` stored in `Subway` that maps each station to its list of directly connected neighboring stations; enables efficient route-finding |
| **Protecting clients** | Designing so that client code only interacts with the classes it genuinely needs; changes to internal classes (like `Station`) don't require changes to client code (like `SubwayLoader`) |
| **Delivery** | The final phase of the lifecycle: you're done — release your software, submit your invoices, and get paid |
| **OOA&D is about options** | The core philosophy: the more tools and techniques you have, and the more comfortable you are using them at any phase, the better chance you have of finding a good solution to any problem |