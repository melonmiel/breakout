# Breakout

## Development

```
dragonruby .
```

### Sounds

Convert audio file to compatible wav file

```
ffmpeg -y -i <input file> -f wav -acodec pcm_s16le -ar 44100 -ac 1 <output file>
```
