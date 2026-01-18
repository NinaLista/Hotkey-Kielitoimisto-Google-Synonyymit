# Quickly select text to Kielitoimisto/Google/Synonyymit-search for translators and writers
Lightweight hotkeys for Windows PC: search selected text (deafult: Pause → Kielitoimiston sanakirja, ScrollLock → Google search,  Alt+w → Synonyymit.fi)

Tämä Windows PC AutoHotkey v2 -skripti mahdollistaa tekstinkäsittelyohjelmasta valitun tekstin nopean haun valituista sanakirjoista ja hakukoneista pikanäppäimillä. Välilehtiä ei avaudu turhaan.

# 🔍 AutoHotkey lookup hotkeys with single-tab reuse

This **AutoHotkey v2** script lets you look up selected text in online dictionaries and search engines using hotkeys, while **reusing one browser tab per site** instead of opening a new tab every time.

## ✨ Features

- 🔄 Replaces the searched word in the same tab on each use   
- 🌍 Proper UTF-8 URL encoding (works with non-ASCII languages)  
- 📋 Clipboard-safe (restores clipboard contents)  
- ⚡ Fast, lightweight, no background activity  
- 📝 Designed for workflows involving at least **Microsoft Word** & **SDL Trados Studio** (tested).

The script opens the site on first use and then updates the address bar on subsequent lookups, keeping browser clutter to a minimum and making repeated dictionary or search queries seamless.

Built for **AutoHotkey v2**.

## ⌨️ Shortcut keys

- **Pause**  
  📘 Looks up the selected text in **Kielitoimiston sanakirja**  
  (reuses the same tab)

- **Scroll Lock**  
  🔎 Searches the selected text on **Google**  
  (reuses the same tab)

- **Alt + W**  
  📖 Looks up the selected text on **Synonyymit.fi**  
  (reuses the same tab)

## 🧩 Requirements

- 🪟 Windows  
- ⚙️ [AutoHotkey v2](https://www.autohotkey.com/)

## ▶️ Usage

1. If you don't have AHK, install **AutoHotkey v2** from https://www.autohotkey.com/
2. Download this script and save it locally as a `.ahk` file.
3. Before working on your text, double-click the ahk. file to run it (an AutoHotkey icon will appear in the system tray).
4. Select a word or text in your application (for example Word or Trados).
5. Press one of the defined shortcut keys:
   - **Pause** → Kielitoimiston sanakirja
   - **Scroll Lock** → Google search
   - **Alt + W** → Synonyymit.fi
6. The browser opens the site on first use. On subsequent uses, the same browser tab is reused and the search word is replaced.

To stop the script, right-click the AutoHotkey tray icon and choose **Exit**.

Check whether your PC/softwares/keyboard allows using these keys. If not, edit the keys as you wish.

## ℹ️ Notes

- 🔒 The script is fully local. Network requests are only made by your browser when loading the target websites.
- 🌐 UTF-8 URL encoding ensures reliable lookups with Finnish and other non-ASCII text.
