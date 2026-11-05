# MacBookPro14,1 / Parrot OS roadmap

## 0. Preserve macOS
- Make a complete, restorable external backup, including personal data.
- Verify recovery before approving any internal SSD erasure.

## 1. Read-only hardware discovery (current)
- Boot Parrot Linux live media, run `scripts/audit-macbook.sh`.
- Record kernel/distro, drivers and battery status.
- Create a compatibility matrix: keyboard, trackpad, wireless, Bluetooth, speakers, mic, webcam, display, USB-C, sensors, suspend.

## 2. Internal SSD installation
- Write an exact device/EFI/recovery plan and obtain approval.
- Install official Parrot and verify successful independent boot.

## 3. Device support
- Prefer upstream kernel drivers and official supported distro packages.
- Investigate missing functions based on exact hardware IDs.
- Review any third-party kernel patch for provenance, version compatibility and rollback.

## 4. Power and input optimizations
- Benchmark baseline power drain, battery health, temperature and RAM usage.
- Choose a single supported power manager; avoid conflicts.
- Tune libinput and desktop gestures; verify keyboard behavior.
- Review thermal controls without disabling safety mechanisms.
- Measure each reversible change.

## 5. Stability and security workstation
- Test repeated suspend/wake and device recovery after wake.
- Document reproducible updates, backups and rollbacks.
- Configure security tools for authorized testing only.

## Release criteria
Stable daily-driver hardware, documented workarounds, no known boot/data-loss regressions, and evidence for performance claims.
