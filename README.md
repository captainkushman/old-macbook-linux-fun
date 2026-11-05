# old-macbook-linux-fun

Hardware-specific Parrot OS setup for the **2017 MacBook Pro 13-inch, MacBookPro14,1 (A1708, no Touch Bar)**.

## Goal
Run Parrot OS as the **sole operating system on the internal SSD** after creating and verifying a **restorable macOS backup** on an external disk. Optimize battery, trackpad, keyboard, audio, Wi-Fi, Bluetooth, webcam, cooling, suspend, and responsiveness.

This project maintains reproducible configuration and tests on top of official Parrot OS. It is **not** a distribution fork.

## Current stage: read-only discovery
Nothing here installs drivers, formats disks, replaces firmware, or removes macOS.

1. Create a restorable external macOS backup and verify recovery before changing internal storage.
2. Boot Parrot live media on the MacBook and test basic input, wireless, audio and display.
3. In that Linux terminal, run `bash scripts/audit-macbook.sh`.
4. Inspect and redact diagnostic output before sharing; the script never uploads data.
5. Review `AGENTS.md` for Codex instructions and `docs/roadmap.md` for the staged implementation.

Do not run the Linux diagnostics script from macOS; it requires Linux system interfaces.
