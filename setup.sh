#!/bin/sh -e
if which mint >/dev/null; then
    echo "Install packages"
    echo "===== Install packages ======="
    mint bootstrap

    echo "===== Generate xcodeproj ====="
    mint run yonaskolb/xcodegen xcodegen generate
else
    echo "error: Mint not installed."
    exit 1
fi
