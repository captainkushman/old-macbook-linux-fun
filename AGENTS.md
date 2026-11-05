# Codex operating instructions

## Mission
Make Parrot OS the primary, internal-SSD operating system for a 2017 13-inch MacBook Pro without Touch Bar, model MacBookPro14,1 (A1708), while retaining a **verified, restorable macOS backup** on an external disk. Optimize for reliability first, then battery life, input devices, audio, Wi-Fi, sleep, thermals and responsiveness.

## Safety contract
- Never run or suggest destructive disk commands (partitioning, formatting, wiping, EFI edits) without a user-approved, device-specific installation plan and independently verified backup.
- Never assume the drive layout or that a backup exists. Treat all storage as valuable.
- Default to read-only diagnostics. Ask approval before installing packages, changing services, editing system configurations, adding firmware or kernel modules, or modifying boot settings.
- Never run remote shell scripts directly from URLs. Verify exact hardware IDs and assess package/repository provenance.
- Use official Debian/Parrot packages and upstream kernel drivers first. Third-party patches require explicit review, a rollback plan, and confirmation of kernel compatibility.
- Do not disable security controls, thermal protections, or signature verification to make an optimization work.
- Prefer reversible scripts with dry-run, backups, clear logs, validation, and rollback instructions.
- Check for conflicting power managers before enabling any (TLP, power-profiles-daemon, tuned).
- Do not publish personal identifiers: usernames, home paths, MAC addresses, serial numbers, public IPs, SSIDs or full command output without review.
- Don't assert battery life or performance gains without measured before/after evidence.

## Workflow
1. Review the read-only diagnostics script and execute only with the owner's approval on the target MacBook, after booting Linux.
2. Record redacted hardware identifiers, kernel, distro, driver status, battery health and suspend behavior.
3. Produce a compatibility matrix with **works / partial / broken / untested** for each component.
4. Implement one reversible change per branch/PR; document what was tested and how to undo it.
5. Benchmark battery drain, idle memory, temperatures and resume reliability before and after tuning.

## Notes
This repository is configuration and research, not a replacement Linux distribution. Keep upstream updates available. Do not assume that solutions for Touch Bar/T2 MacBooks apply to MacBookPro14,1.
