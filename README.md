# ESX Police Bulletproof Vest Script

This is a simple ESX-compatible script that allows police officers to use a bulletproof vest item to gain armor with a short animation and progress bar.

## Features
- Only available to players with the `police` job.
- Requires the item `policebulletproof` in the inventory.
- Includes a 5-second animation and progress bar before applying the armor.
- Blocks input during animation for realism.
- Notifications for errors and successful usage.

## Requirements / Dependencies
- [ESX Legacy](https://github.com/esx-framework/esx_core)
- `esx_addoninventory` (or similar item inventory system)
- A progress bar resource like `progressBars`
- A notification system (event: `notifications`)

## Usage
- Players can use the item from their inventory.
- Or use the command: `/policewesten`
- Optional keybinding is registered for keyboard access.

## Author
**Kilian**

Feel free to modify and expand the script for your server's needs.
