#!/bin/bash

export LD_PRELOAD="$CSGO_LD_PRELOAD:$LD_PRELOAD"
export LD_LIBRARY_PATH="$GOLDBERG_LIBRARY_PATH":"${GAMEROOT}"/bin:"${GAMEROOT}"/bin/linux64:"$LD_LIBRARY_PATH"

GAMEEXE=csgo_linux64

ulimit -n 2048

# enable nVidia threaded optimizations
#export __GL_THREADED_OPTIMIZATIONS=1
# enable Mesa threaded shader compiles
#export multithread_glsl_compiler=1

# and launch the game
cd "$GAMEROOT"

exec "${GAMEROOT}/${GAMEEXE}" "$@"
