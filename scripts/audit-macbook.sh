#!/usr/bin/env bash
# Read-only inventory. Linux on target MacBook only. Writes no files.
set -u
section() { printf '\n===== %s =====\n' "$1"; }
run() { if command -v "$1" >/dev/null 2>&1; then "$@" 2>&1 || true; else echo "Unavailable: $1"; fi; }
section "Linux / kernel"
run uname -srmo
if [[ -r /etc/os-release ]]; then grep -E '^(PRETTY_NAME|VERSION_ID)=' /etc/os-release || true; fi
section "Mac model"
for f in /sys/class/dmi/id/product_name /sys/class/dmi/id/product_version /sys/class/dmi/id/sys_vendor; do
  [[ -r "$f" ]] && { printf '%s: ' "${f##*/}"; cat "$f"; }
done
section "CPU and RAM"
run lscpu
run free -h
section "PCI hardware and active drivers"
run lspci -nnk
section "Keyboard and trackpad"
if command -v libinput >/dev/null 2>&1; then
  run libinput list-devices
elif [[ -r /proc/bus/input/devices ]]; then
  grep -E '^(N: Name|H: Handlers)' /proc/bus/input/devices || true
fi
section "Power manager status"
for svc in tlp.service power-profiles-daemon.service tuned.service; do
  if command -v systemctl >/dev/null 2>&1; then
    printf '%s: ' "$svc"
    systemctl is-active "$svc" 2>/dev/null || true
  fi
done
section "Battery (no serial numbers)"
shopt -s nullglob
for bat in /sys/class/power_supply/BAT*; do
  echo "Battery: ${bat##*/}"
  for field in status capacity cycle_count energy_full energy_full_design charge_full charge_full_design power_now current_now voltage_now; do
    if [[ -r "$bat/$field" ]]; then printf '%s: ' "$field"; cat "$bat/$field"; fi
  done
done
section "Audio"
if [[ -r /proc/asound/cards ]]; then cat /proc/asound/cards; else echo "No ALSA card listing"; fi
section "Relevant modules"
if command -v lsmod >/dev/null 2>&1; then
  lsmod | grep -Ei 'applespi|apple_ib|bcm|brcm|hid_apple|snd|i915|applesmc|btusb' || true
fi
section "Privacy reminder"
echo "Review output before sharing: PCI devices and other diagnostics can contain identifiers."
echo "No files were modified or uploaded."
