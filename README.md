# Granny Legacy Coins Spoofer

## **Working as of June 2026**

A batch‑based utility that modifies the saved coin value in *Granny: Legacy* to **9999**.  
It automatically locates the correct registry entry under `HKEY_CURRENT_USER` and applies the required binary data, all with colour‑coded status feedback (green = success, red = failure).

## Features

- **Automatic detection** – finds any `Coins_*` value inside the game’s registry key. No need to hard‑code a specific identifier.
- **Single‑click operation** – just run the `.bat` file; it handles everything.
- **Administrator elevation** – requests admin rights automatically if not already elevated (UAC prompt).
- **Clear output** – green text for successful steps, red for errors, so you always know what’s happening.
- **No game restart required** – the value is written directly to the registry, but a restart of the game is recommended for the change to be reflected.

## Requirements

- Windows operating system (Windows 10/11)

## How to use

1. Close the game (optional).
2. Download or copy the `GrannyLegacyCoinSpoofer.bat` file from this repository.
3. Right‑click the file and select **Run as administrator**, or simply double‑click it – the script will request elevation on its own.
4. Follow the on‑screen messages:
   - Green text indicates everything went well.
   - Red text tells you if a problem occurred (e.g., registry key not found).
5. Once you see `Operation completed`, restart *Granny: Legacy* – your coins will now be `9999`.

## How it works (technical)

The script uses PowerShell to:
- Open `HKCU\Software\Omega Mega Gigal Intel\Granny: Legacy` for writing.
- Search for all value names starting with `Coins_`.
- Replace each matching value’s binary data with the byte sequence `00 00 00 00 80 87 C3 40` (the double‑precision floating‑point representation of 9999.0).

All modifications are performed without altering any other registry keys.

## Disclaimer

This tool is provided for **educational purposes only**.  
Use it at your own risk. The author is not responsible for any account penalties, data loss, or damages caused by this software.
