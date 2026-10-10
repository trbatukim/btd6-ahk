# BTD6 AutoHotkey Scripts

*A (soon to be) list of [AutoHotkey](https://www.autohotkey.com/) (v2) script to be used alongside Bloons TD 6 for QOL shortcuts.*

## Requirements

- [AutoHotkey](https://www.autohotkey.com/download/) (v2) installed.

## Installation

1. Install [AutoHotkey](https://www.autohotkey.com/download/) if you do not already have it.
2. Download `SpamUpgrades.ahk` from this repository.
3. Double-click script to run (or right-click -> **Run Script**)

## Spam Upgrades

This script spams upgrades for one path at a time. You can toggle the macro using your upgrade hotkey. You will need to change the script for it to work with your own hotkeys. To customize, see [how to customize](#how-to-customize) By default its:

|Hotkey|Path|
|---|---|
|F1|Top path|
|F2|Middle path|
|F3|Bottom path|

### How to Customize

Change any mention of F1, F2, and F3 with you desired keycodes. Full list of keys can be found [here](https://www.autohotkey.com/docs/v1/KeyList.htm).

For more specification you need to change the following lines:

|Hotkey|Lines|
|---|---|
|F1|76, 83|
|F2|86, 93|
|F3|96, 103|

## License

See [LICENSE].