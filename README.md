# Dynamic Tech Multiplier (Ages Balance)

A standalone pacing modifier for **Factorio 2.1+** and the **Space Age expansion** that dynamically scales technology research costs based on game milestones. 

Instead of a flat, tedious multiplier that bogs down the early game, this mod leaves the primitive era untouched and aggressively spikes costs right when major logistical milestones are unlocked. The meta-goal is simple: **force players to stop relying on small spaghetti setups and mechanically incentivize scaling up factory infrastructure.**

---

## 📅 The Architectural Progression (The Ages)

The mod scans the active technology tree at loading time and dynamically categorizes every node into one of three production eras:

*   **🧪 The Primitive Age (1x Multiplier Default):** Early-game technologies requiring only Automation (Red) and Logistic (Green) science. This preserves a smooth, fast start so setting up basic power, ammo automation, and simple belt networks doesn't feel like a chore.
*   **🚂 The Rail Age (8x Multiplier Default):** Triggers the absolute second you unlock **Chemical (Blue) Science** or **Railways**. Attempting to progress through this era with basic belt lines will take hours. Players are heavily incentivized to build extensive train networks and high-throughput localized resource outposts to smash the bottleneck.
*   **🚀 The Space/Interstellar Age (25x Multiplier Default):** Triggers upon unlocking **Space (White) Science** or any specialized planetary science pack (*Metallurgic, Electromagnetic, Agricultural, Cryogenic*). This turns late-game exploration and infinite research fields into true planetary mega-factory goals.

---

## ⚙️ In-Game Customization

Don't like the default scaling? You can fully customize your progression difficulty directly from the Factorio main menu (**Settings ➔ Mod Settings ➔ Startup** tab). 

The mod features robust, clamped numeric sliders for fine-tuning your game pace:
*   **Primitive Age Multiplier:** `1x` to `100x` (Default: `1`)
*   **Rail Age Multiplier:** `5x` to `100x` (Default: `8`)
*   **Space Age Multiplier:** `10x` to `1,000x` (Default: `25`)

*Note: Because technology parameters are evaluated as game prototypes during the loading screen, changing these sliders will prompt a swift, automated reload of the game.*

---

## 🔌 Compatibility & Open Source Philosophy

*   **Mod Compatibility:** Built dynamically using `data-final-fixes.lua`. The script scans ingredient keys rather than hardcoded names. This means it is **100% compatible** with other planet expansion mods, custom machinery overhauls, or new science packs—automatically vacuuming them into the correct Age categories.
*   **License:** Distributed under the **MIT License**. You are completely free to inspect, copy, tweak, bundle, or modify the code scripts for your own projects. Community-driven updates and forks are warmly welcomed!

---

## 🤖 AI Co-Developed Project

This mod was built as an open-source collaboration between its author and an AI assistant. The core goal was to engineer a clean, elegant, and performance-friendly data-scanning algorithm utilizing the Factorio prototype engine. 
By leveraging AI code generation and refinement cycles, the project successfully implements dynamic dependency matching and native mod-setting sliders without introducing runtime script bloat. 
If you encounter any logic edge cases or unexpected mod interactions, feel free to open an issue on the repository page!


