# Dockerised CS:GO Client

- uses https://gitlab.com/Mr_Goldberg/goldberg_emulator to avoid the need for steam
- adds `LD_PRELOAD` for `gameoverlayrenderer.so` (otherwise the game crashes)


## Build

```
docker build -t csgo .
```


## Run

```
CSGO_DIR=/home/mark/games/SteamLibrary/steamapps/common/Counter-Strike\ Global\ Offensive/
docker run --rm -it \
    --name csgo \
    --shm-size 256M \
    -p 5800:5800 -p 5900:5900 \
    -v csgo:/csgo -v $CSGO_DIR:/opt/csgo:ro \
    -e USER_ID=1000 -e GROUP_ID=984 -e GAMEROOT=/opt/csgo \
    csgo
```

Then go to http://localhost:5800/


## Screenshots

![image](https://user-images.githubusercontent.com/5138316/170975992-2730f6e0-a0b3-4dc1-9f21-539a26550282.png)

![image](https://user-images.githubusercontent.com/5138316/170976522-9feb845c-fb27-447e-a7de-01e25b878396.png)


## Acknowledgements

This is heavily based on https://github.com/mikenye/docker-steam


## License

The contents of this repository are licensed under the MIT license.
However, CS:GO and the contents of any built docker image are subject to licenses from third parties, including Valve.
No affiliation with Valve.
