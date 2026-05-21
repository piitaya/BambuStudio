#!/bin/sh
# Bump every cmake_minimum_required(VERSION X) <3.5 to VERSION 3.5 so the
# project configures under CMake 4.x. Run from the wxWidgets source root.
# Portable across BSD sed (macOS) and GNU sed via the -i.bak idiom.

set -e

find . -name CMakeLists.txt -print0 | xargs -0 sed -i.bak -E \
    's/cmake_minimum_required[[:space:]]*\([[:space:]]*VERSION[[:space:]]+[0-3]\.[0-4][^)]*\)/cmake_minimum_required(VERSION 3.5)/g'

# Clean up .bak files sed leaves behind.
find . -name 'CMakeLists.txt.bak' -delete

exit 0
