# Dockerised CS:GO Client

- uses https://gitlab.com/Mr_Goldberg/goldberg_emulator to avoid the need for steam
- adds `LD_PRELOAD` for `gameoverlayrenderer.so` (otherwise the game crashes)

## Build

```
docker build -t csgo .
```

## Run

```
docker run --rm -it \
    --name csgo \
    --shm-size 256M \
    -p 5800:5800 -p 5900:5900 \
    -v csgo:/csgo -v /home/mark/games/SteamLibrary/steamapps/common/Counter-Strike\ Global\ Offensive/:/opt/csgo:ro \
    -e USER_ID=1000 -e GROUP_ID=984 -e GAMEROOT=/opt/csgo \
    csgo
```

## Acknowledgements

This is heavily based on https://github.com/mikenye/docker-steam
