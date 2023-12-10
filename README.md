### Prepares video for streaming by dividing it into segments (Transport Stream) and producing a playlist file.

Automatically creates an `input-playlist.txt` file and fills it with the paths to the videos you want to stream

```console
sudo bash make-input-file.sh ./input
```

Creates the `./results` directory, writes segments to it and creates the `./results/playlist.m3u8` file, which is needed for streaming

```console
sudo bash make-playlist.sh ./input/input-playlist.txt
```

Combines `make-input-file.sh` with `make-playlist.sh`.

```console
sudo bash prepair-stream.sh ./input
```

Globally installs the `make-playlist` and `make-input-file` commands.

```console
sudo bash install.sh
```
