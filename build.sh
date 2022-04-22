#!/bin/bash
# Usage: ./build.sh <TARGET>
#        For TARGET in [clem, musl], the musl target is built.
#        For all other targets, the default glibc target is built.
set -e

TARGET="${1,,}"
echo $TARGET
if [ "$TARGET" = "clem" ] || [ "$TARGET" = "musl" ]; then
  echo "Building musl target..."
  # add the target once to the toolchain with: `rustup target add x86_64-unknown-linux-musl`
  cargo build --release --target x86_64-unknown-linux-musl
  cp target/x86_64-unknown-linux-musl/release/plate-inspector bin/plate-inspector-musl

else
  echo "Building default target..."
  cargo build --release
  cp target/release/plate-inspector bin/
fi
