# Package

version       = "1.0"
author        = "Earl Kennedy"
description   = "Converts 2D linear graph coordinates to pixels on screen"
license       = "MIT"

srcDir        = "src"

skipDirs      = @["test"]

# Dependencies

requires "nim >= 0.17.2"

#task test, "Test graph functionality"
#    exec "nim c --d:debug --lineDir:on --debuginfo --run src/test/test.nim"
