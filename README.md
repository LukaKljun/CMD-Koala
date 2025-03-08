# Koala Quest v7

A text-based adventure game built in Batch (CMD) where you play as a koala searching for eucalyptus leaves to survive. Explore a small world, manage your hunger and life stats, and use items to unlock paths to victory!

## Features
- **Original Story:** A koala’s quest for food in a forest environment (PG-13).
- **Locations:** 5 unique locations (Forest, River, Clearing, Beach, Eucalyptus Tree) with descriptions stored in external `.bat` files.
- **Inventory System:** Items (leaves, sticks, stone, shell) are stored in `Inventory.txt` and can be taken or used.
- **Survival Mechanics:** Hunger decreases with each move; if it hits 0, life decreases, leading to game over.
- **Dynamic Exits:** Use items like sticks or stones to permanently unlock new paths (e.g., Clearing to Eucalyptus Tree).
- **Modular Design:** Location and item logic is split into separate `.bat` files for easy expansion.
- **Win Condition:** Eat eucalyptus leaves at the Eucalyptus Tree to restore hunger to 100 and win.

## Requirements
- Windows operating system (CMD support).
- No additional software needed—just run `main.bat`!

## Installation
1. Download or clone this repository to your computer.
2. Extract the `KoalaQuest` folder if zipped.
3. Ensure the folder structure remains intact (see below).

### Folder Structure
