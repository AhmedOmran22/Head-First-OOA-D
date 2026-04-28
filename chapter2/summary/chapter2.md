# 📖 Head First OOA&D — Chapter 2 Summary
## *Gathering Requirements: Give Them What They Want*

> **Goal of this chapter:** Learn how to gather the right requirements from customers, write use cases that capture what the system must do, and turn those use cases into working, tested code.

---

## 🗺️ Chapter Overview

### What is this chapter about?

Chapter 2 introduces you to **requirements gathering** — the art of figuring out what a system *actually needs to do* before you write a single line of code. The chapter follows a new scenario: **Doug's Dog Doors**, a startup that makes smart automated dog doors. Your first clients are **Todd and Gina**, who want a button-controlled door for their dog Fido that automatically closes after a few seconds.

The chapter teaches you to go from a vague customer wish → a requirements list → a use case → working code.

### Why it matters in real-world development

Skipping requirements is one of the most common reasons software fails. The first version of Todd and Gina's door worked — but it let rabbits into the kitchen, because nobody thought through *how the door would actually be used*. Writing proper use cases forces you to think beyond the happy path and plan for the real world.

---

## 🐕 The Story: Doug's Dog Doors

You've just been hired as the lead programmer at **Doug's Dog Doors**. Your first customers, Todd and Gina, want a remote-controlled dog door:

- Fido barks every night, waking them up
- They want to press one button to open the door
- The door should close automatically after a few seconds
- The opening must be at least 12" tall so Fido doesn't have to lean

**Version 1 of the door:** You quickly wrote a `DogDoor` class and a `Remote` class. It worked — but when Gina tested it, a rabbit got into the kitchen. The door had been left open because nobody pressed the button again to close it.

> 💡 **The lesson:** Code that *technically works* isn't enough. You need to understand **exactly how the system will be used** — including what can go wrong.

---

## 🔍 What is a Requirement?

A requirement is a **specific thing your system has to do** to work correctly.

> **Scholar's Corner definition:** A requirement is a singular need detailing what a particular product or service should be or do.

Key points about requirements:
- They are **testable** — you can verify that each one is satisfied
- The **customer decides** when a system works correctly
- If you leave out a requirement, the system isn't working correctly — even if the code compiles

### The System Boundary

**"System"** means everything your software controls. For Todd and Gina, the system is the dog door AND the remote control. Things outside the system — like Todd, Gina, and Fido — are **actors** who interact with it.

---

## 📋 The Requirements List

After listening carefully to Todd and Gina, you write down a simple requirements list:

**Todd and Gina's Dog Door v2.0 — Requirements List:**

1. The dog door opening must be at least **12" tall**
2. A button on the remote control **opens the door if closed, and closes it if open**
3. Once opened, the door should **automatically close** after a few seconds

> 💡 **The best way to get good requirements is to understand what the system is supposed to do** — not just what the customer tells you verbally.

### What the Door Does (Step-by-Step Flow)

Writing down exactly what happens when the system runs reveals gaps in your requirements. This list became the foundation of the use case:

1. Fido barks to be let out
2. Todd or Gina hears Fido barking
3. Todd or Gina presses the button on the remote control
4. The dog door opens
5. Fido goes outside
6. Fido does his business
7. Fido goes back inside
8. The door shuts automatically

---

## 🎯 Use Cases — The Core of This Chapter

### What is a Use Case?

A use case describes **what your system does** to accomplish **a particular customer goal**.

> **Scholar's Corner definition:** A use case is a technique for capturing the potential requirements of a new system or software change. Each use case provides one or more scenarios that convey how the system should interact with the end user or another system to achieve a specific goal.

Think of it this way:
- One use case = **one goal**
- If Todd and Gina want to track how many times Fido goes out *and* let Fido outside — those are **two different goals → two different use cases**

### The 3 Parts Every Use Case Must Have

| Part | Description | Dog Door Example |
|---|---|---|
| **Clear Value** 🏆 | The use case must help the customer achieve a meaningful goal | Fido goes outside without waking Todd and Gina |
| **Start and Stop** 🚦 | A definite beginning and ending condition | Starts when Fido barks; stops when Fido is back inside and the door is closed |
| **External Initiator** 🐕 | Something **outside** the system kicks it off | Fido (outside the system) starts the whole process by barking |

---

## 📐 Use Case Modeling

### Use Case 1 — Todd and Gina's Dog Door (Main Use Case)

---

**Use Case:** Let Fido Outside

**Actor(s):** Fido (primary external initiator), Todd or Gina (secondary — responds to Fido)

**Goal:** Fido goes outside to do his business and gets back inside, without Todd or Gina getting out of bed

---

**Main Success Scenario:**

1. Fido barks to be let out *(External — Fido)*
2. Todd or Gina hears Fido barking *(External — Human)*
3. Todd or Gina presses the button on the remote control *(External — Human)*
4. The dog door opens *(System)*
5. Fido goes outside *(External — Fido)*
6. Fido does his business *(External — Fido)*
7. Fido goes back inside *(External — Fido)*
8. The door shuts automatically *(System)*

---

**Alternative Path (Step 6 — door closes before Fido returns):**

- **6.1** The door shuts automatically *(System)*
- **6.2** Fido barks to be let back inside *(External — Fido)*
- **6.3** Todd or Gina hears Fido barking again *(External — Human)*
- **6.4** Todd or Gina presses the button on the remote control *(External — Human)*
- **6.5** The dog door opens again *(System)*
- → Continue at step 7

---

**System vs External Breakdown:**

| Step | Who/What Does It | Type |
|---|---|---|
| Step 1 | Fido | External (animal) |
| Step 2 | Todd or Gina | External (human) |
| Step 3 | Todd or Gina | External (human) |
| Step 4 | Dog door | **System** |
| Step 5 | Fido | External (animal) |
| Step 6 | Fido | External (animal) |
| Step 7 | Fido | External (animal) |
| Step 8 | Dog door (timer) | **System** |

---

### Use Case 2 — Holly and Bruce's Dog Door

---

**Use Case:** Let Bruce Outside Automatically

**Actor(s):** Bruce (primary external initiator), Holly (secondary — owns the system)

**Goal:** Bruce gets outside to use the bathroom and comes back in, without Holly having to listen for scratching or open/close the door manually

---

**Main Success Scenario:**

1. Bruce scratches at the dog door *(External — Bruce)*
2. The dog door opens *(System)*
3. Bruce goes outside *(External — Bruce)*
4. The dog door closes after a preset time *(System)*
5. Bruce does his business *(External — Bruce)*
6. Bruce scratches at the door again *(External — Bruce)*
7. The dog door opens again *(System)*
8. Bruce comes back inside *(External — Bruce)*
9. The dog door closes automatically *(System — STOP condition)*

---

**Alternative Path:**

- If Bruce scratches at the door but stays inside (or stays outside), he can scratch again to re-open it from inside or outside

---

**System vs External Breakdown:**

| Step | Who/What Does It | Type |
|---|---|---|
| Step 1 | Bruce | External (animal) |
| Step 2 | Door sensor + door | **System** |
| Steps 3, 5, 6, 8 | Bruce | External (animal) |
| Steps 4, 7, 9 | Dog door (timer) | **System** |

---

### Use Case 3 — Kristen and Bitsie's Dog Door

---

**Use Case:** Lock the Dog Door and Windows

**Actor(s):** Kristen (primary external initiator), Bitsie (the dog, kept inside)

**Goal:** Kristen locks the house to prevent Bitsie from escaping

---

**Main Success Scenario:**

1. Kristen enters a code on a keypad *(External — Kristen)*
2. The dog door and all windows in the house lock *(System — STOP condition)*

---

**Requirements derived from this use case:**

1. The keypad must accept a 4-digit code
2. The keypad must be able to lock the dog door
3. The keypad must also control window locks

---

### Use Case 4 — John and Tex's Dog Door (Structured Format)

---

**Use Case:** Tex Uses the Bathroom Without Tracking Mud

**Primary Actor:** Tex (the dog)

**Secondary Actor:** John (the owner)

**Preconditions:** The dog door is open for Tex to go outside

**Goal:** Tex uses the bathroom and comes back inside, without tracking mud into the house

---

**Main Path:**

1. Tex goes outside *(External — Tex)*
2. The dog door closes automatically *(System)*
3. Tex does his business *(External — Tex)*
4. John presses a button *(External — John)*
5. The dog door opens *(System)*
6. Tex comes back inside *(External — Tex)*
7. The door closes automatically *(System — STOP condition)*

**Extensions (Alternate Path at Step 3):**

- **3.1** Tex gets muddy
- **3.2** John cleans Tex up

---

## 🔗 Checking Requirements Against Use Cases

Once you have both a requirements list and a use case, **cross-check them**. Go through every step of the use case and ask: "Which requirement handles this step?"

**Example mapping for Todd and Gina:**

| Use Case Step | Requirement Number |
|---|---|
| 1. Fido barks | N/A (external, system doesn't control it) |
| 2. Todd/Gina hears | N/A (external) |
| 3. Button pressed | Req #2 |
| 4. Door opens | Req #1 (door must be big enough) |
| 5. Fido goes outside | N/A |
| 6. Fido does his business | N/A |
| 6.1 Door shuts automatically | Req #3 |
| 6.4 Button pressed again | Req #2 |
| 6.5 Door opens again | Req #2 |
| 7. Fido goes back inside | N/A |
| 8. Door shuts automatically | Req #3 |

> ✅ If every step in the use case is covered by a requirement, your requirements list is complete. If any step has no requirement — **add one**.

---

## 💻 Dart Code Examples

### The DogDoor Class

```dart
/// Represents the smart dog door hardware interface.
/// This class is responsible for ONE thing: controlling door state.
class DogDoor {
  bool _isOpen = false;

  /// Opens the door and prints a confirmation
  void open() {
    print('The dog door opens.');
    _isOpen = true;
  }

  /// Closes the door and prints a confirmation
  void close() {
    print('The dog door closes.');
    _isOpen = false;
  }

  /// Returns the current state — true if open, false if closed
  bool get isOpen => _isOpen;
}
```

---

### The Remote Class (with Auto-Close Timer)

```dart
import 'dart:async';

/// Remote control — delegates door state to DogDoor,
/// and starts an auto-close timer after opening the door.
///
/// This class DELEGATES the open/close responsibility to DogDoor.
/// Remote doesn't manage door state — it just tells the door what to do.
class Remote {
  final DogDoor _door;

  Remote(this._door);

  /// Pressing the button toggles the door.
  /// If door is open → close it.
  /// If door is closed → open it and start the auto-close timer.
  void pressButton() {
    print('Pressing the remote control button...');

    if (_door.isOpen) {
      // Door is already open — close it immediately
      _door.close();
    } else {
      // Door is closed — open it and schedule auto-close
      _door.open();
      _scheduleAutoClose();
    }
  }

  /// Starts a 5-second timer. When it fires, the door closes
  /// automatically — satisfying Requirement #3.
  void _scheduleAutoClose() {
    Timer(const Duration(seconds: 5), () {
      if (_door.isOpen) {
        print('\n[Auto-close timer fired]');
        _door.close();
      }
    });
  }
}
```

---

### Simulating the Main Path (Use Case in Code)

```dart
Future<void> main() async {
  // Set up the system
  final door = DogDoor();
  final remote = Remote(door);

  // Step 1-3: Fido barks, Gina hears, presses remote
  print('Fido barks to go outside...');
  remote.pressButton(); // Door opens + timer starts

  // Step 5-6: Fido goes outside and does his business
  print('\nFido has gone outside...');
  print('Fido is doing his business...');

  // Step 7: Fido comes back inside (door closes automatically via timer)
  // Wait for auto-close to fire (simulating the 5 seconds)
  await Future.delayed(const Duration(seconds: 6));

  print('\nFido is back inside. Door is closed: ${!door.isOpen}');
}

// Output:
// Fido barks to go outside...
// Pressing the remote control button...
// The dog door opens.
// Fido has gone outside...
// Fido is doing his business...
// [Auto-close timer fired]
// The dog door closes.
// Fido is back inside. Door is closed: true
```

---

### Simulating the Alternate Path (Fido Gets Stuck Outside)

```dart
Future<void> simulateAlternatePath() async {
  final door = DogDoor();
  final remote = Remote(door);

  // Main path: Fido goes out
  print('Fido barks to go outside...');
  remote.pressButton(); // Opens door, timer starts

  print('\nFido has gone outside...');
  print('Fido is doing his business...');

  // Alternate path begins: door closes before Fido is back
  await Future.delayed(const Duration(seconds: 6));
  // Door auto-closes — but Fido is still outside!

  print('\n...but Fido is stuck outside!');
  print('Fido starts barking again...');
  print('Gina grabs the remote control.');

  // Step 6.4: Gina presses button again to let Fido back in
  remote.pressButton(); // Opens door again

  // Step 7: Fido walks inside
  print('\nFido is back inside!');

  // Timer will close the door again automatically
  await Future.delayed(const Duration(seconds: 6));
  print('Door is closed again. Door is open: ${door.isOpen}');
}
```

---

### Modeling Use Cases as Classes (Advanced)

```dart
/// Represents an actor — something outside the system that interacts with it.
/// Actors can be people, animals, or external systems.
abstract class Actor {
  final String name;
  Actor(this.name);

  // Each actor performs actions
  void performAction(String action) {
    print('[$name] $action');
  }
}

/// External initiator — the one who kicks off the use case
class Dog extends Actor {
  Dog(String name) : super(name);

  void bark() => performAction('Woof! Woof! (barks to go outside)');
  void goOutside() => performAction('goes outside');
  void doHisBusiness() => performAction('does his business');
  void returnInside() => performAction('returns inside');
}

class Owner extends Actor {
  final Remote remote;

  Owner(String name, this.remote) : super(name);

  void hearBarking() => performAction('hears the barking');
  void pressRemote() {
    performAction('presses the remote control button');
    remote.pressButton();
  }
}

/// Simulate the full use case
Future<void> runUseCase() async {
  final door = DogDoor();
  final remote = Remote(door);
  final fido = Dog('Fido');
  final gina = Owner('Gina', remote);

  print('=== Use Case: Let Fido Outside ===\n');

  fido.bark();           // Step 1 — External initiator
  gina.hearBarking();    // Step 2 — External
  gina.pressRemote();    // Step 3 + 4 — External + System (door opens)
  fido.goOutside();      // Step 5 — External
  fido.doHisBusiness();  // Step 6 — External
  fido.returnInside();   // Step 7 — External

  // Step 8 — System (auto-close fires)
  await Future.delayed(const Duration(seconds: 6));
  print('\n=== Use case complete: Fido is inside, door is closed ===');
}
```

---

## 🌍 Real-World Analogy

Think of a **use case like a movie script**:

- The **actors** in a movie are outside the camera — they're not the camera (the system)
- The **script** (use case) describes exactly what should happen from start to finish
- The **happy path** (main success scenario) is when the scene goes exactly as planned
- The **alternate paths** are when something unexpected happens — the actor forgets their line, or it starts raining — and you need a plan for how the scene continues

Just like a good director plans for what goes wrong on set, a good developer plans for what goes wrong in the system.

---

## ✅ Key Takeaways

- **Gather requirements before writing code.** A requirements list ensures your system does what the customer actually wants.
- **Listen to the customer — then go beyond what they say.** Customers often forget to mention things they assume will "just work."
- **A use case focuses on ONE goal.** One use case = one thing the system helps a customer accomplish.
- **Every use case has 3 parts:** Clear value, start and stop conditions, and an external initiator.
- **The main path is the happy path** — when everything goes right. But the real world almost never follows the happy path.
- **Alternate paths are not failures** — they're part of the same use case. They all work toward the same customer goal.
- **Cross-check requirements against use cases.** Every step in the use case should be covered by at least one requirement.
- **Use cases reveal missing requirements.** Writing the step-by-step flow exposes things neither you nor the customer thought of.
- **Your system must work in the real world.** Plan and test for when things go wrong — not just when they go right.
- **Use cases are not code.** They're written in plain language so customers, bosses, and developers can all understand them.

---

## ⚠️ Common Mistakes & Misunderstandings

### ❌ Mistake 1: Writing requirements from your head, not from the customer
Many developers write requirements based on what *they* think the system should do. Always start by listening to the customer and translating their words into testable requirements.

### ❌ Mistake 2: Only planning for the happy path
The first dog door *worked on the happy path* — but failed in real use when Gina didn't press the button again. Always ask: "What can go wrong? What does the system need to handle?"

### ❌ Mistake 3: Confusing actors with the system
Todd, Gina, and Fido are **actors** — they're outside the system. The dog door and remote control are **inside the system**. A use case describes how external actors interact with the system, not how the system talks to itself.

### ❌ Mistake 4: Writing too much detail in a use case
Use cases should use simple, everyday language. If you're writing code-level details like class names or method calls, you've gone too far. Use cases are for *what*, not *how*.

### ❌ Mistake 5: One use case per feature instead of per goal
A use case is about accomplishing a **goal**, not about using a feature. If Gina wants to open the door *and* track how many times Fido goes out — those are two different goals = two different use cases.

### ❌ Mistake 6: Thinking a use case diagram is the same as a use case
A use case *diagram* is a visual overview of all use cases and actors. A use case itself is the detailed step-by-step text. Don't confuse the two.

### ❌ Mistake 7: Writing requirements that are impossible to test
Every requirement must be testable. "The door should work well" is not a requirement. "The door must close automatically within 5 seconds of opening" is a requirement.

---

## ❓ There's No Dumb Questions

**Q: What is the difference between a scenario and a use case?**

A: A **scenario** is one specific path through a use case — either the main path or an alternate path. A **use case** is the complete picture: the goal, all the possible scenarios combined, and who initiates the whole process. One use case can contain multiple scenarios.

---

**Q: Are actors always users?**

A: No. An actor is anything *outside the system* that interacts with it. In the dog door example, Fido (a dog) is the external initiator — the most important actor. An actor could also be another system, a timer, a sensor, or any external force that triggers the use case.

---

**Q: Should I include implementation details in a use case?**

A: No. Use cases describe *what* the system does, not *how* it does it. Mentioning specific classes, databases, or algorithms makes use cases less useful — nobody but developers can understand them. Write in plain language that your customer could read and confirm.

---

**Q: Does every system need a use case before writing code?**

A: For any system that interacts with users or the real world — yes. Use cases help you discover missing requirements *before* you write code, which is much cheaper than discovering them after. Even a quick, informal use case is better than none.

---

**Q: What's the difference between the main path and an alternate path?**

A: The **main path** (also called the "happy path") is what happens when everything goes exactly as expected. An **alternate path** is when something deviates from the plan — but the customer's goal can still be achieved by handling the situation. Alternate paths are part of the same use case because they lead to the same goal.

---

**Q: How many use cases does a system need?**

A: One per major customer goal. If your system does one thing (like let Fido outside), you probably need one use case. If your system has 15 different features for different user goals, you might have 15+ use cases. Each distinct goal = its own use case.

---

**Q: Is a use case the same as a user story?**

A: They're similar in spirit but different in format. A user story ("As a dog owner, I want a door that opens automatically so that I don't have to get out of bed") captures the *why*. A use case captures the *step-by-step what* — all the interactions between actors and the system. Use cases are more detailed.

---

**Q: What if the customer doesn't know what they want?**

A: That's normal — and it's exactly why use cases are so powerful. By writing down the step-by-step flow of how the system will be used, you ask the customer questions they never thought to answer. Todd and Gina never mentioned automatic door closing — you figured it out by thinking through what happens after the door opens.

---

## 📚 Key Terminology

| Term | Definition |
|---|---|
| **Requirement** | A specific, testable thing the system must do to work correctly |
| **Use Case** | A description of what a system does to accomplish a particular customer goal, including all possible scenarios |
| **Scenario** | One specific path through a use case — either the main path or an alternate path |
| **Main Success Scenario** | The step-by-step flow when everything goes according to plan — also called the "happy path" |
| **Alternate Path** | Steps that handle a deviation from the main path — the goal is still the same, just reached differently |
| **Actor** | Anything *outside* the system that interacts with it — a person, an animal, or another system |
| **External Initiator** | The actor that starts the use case — always outside the system boundary |
| **System Boundary** | The line between what your software controls (inside) and everything else (outside). The system includes the dog door and remote; it excludes Fido, Todd, and Gina |
| **Clear Value** | The meaningful benefit a use case delivers to the customer — the *why* the use case exists |
| **Start Condition** | The event that kicks off the use case — usually caused by the external initiator |
| **Stop Condition** | The state that signals the use case is complete — usually the last step of the main path |
| **Happy Path** | Another name for the Main Success Scenario — when everything goes exactly as planned |
| **Requirements List** | A simple, numbered list of all the things your system must do to be considered working correctly |

---

## 🏁 Chapter Summary

Chapter 2 is about building the right thing before you build it. The central lesson:

> The best way to get good requirements is to understand what a system is supposed to do — and that means thinking beyond what the customer explicitly tells you.

By the end of the chapter, the dog door was transformed from a simple two-class program that let rabbits in, into a well-specified, requirements-driven system that:

- ✅ Has a clear **requirements list** derived from customer conversations
- ✅ Has a fully written **use case** that describes the main path and alternate paths
- ✅ **Cross-checks** requirements against the use case to ensure nothing is missing
- ✅ Has code that implements the auto-close timer (satisfying Requirement #3)
- ✅ Has been tested on **both the main path and the alternate path**
- ✅ Delivers **satisfied customers** — Todd and Gina sleep through the night 🎉

That's requirements gathering. That's how you give customers what they actually want. 🐕