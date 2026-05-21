#!/bin/sh
# Rewrite every cmake_minimum_required(...) in the wxWidgets tree to
# VERSION 3.5 so the project configures cleanly under CMake 4.x.
# Run from the wxWidgets source root.
# Portable across BSD sed (macOS) and GNU sed via the -i.bak idiom.

set -e

# Patch both CMakeLists.txt and any *.cmake module file.
find . \( -name CMakeLists.txt -o -name '*.cmake' \) -print0 | xargs -0 sed -i.bak -E \
    's/cmake_minimum_required[[:space:]]*\([^)]*\)/cmake_minimum_required(VERSION 3.5)/g'

# Clean up .bak files sed leaves behind.
find . \( -name 'CMakeLists.txt.bak' -o -name '*.cmake.bak' \) -delete

exit 0
