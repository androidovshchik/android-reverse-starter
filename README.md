## android-reverse-starter
> Useful tools for reverse out of the box (Linux compatible)

### Setup
```
    $ sh install.sh
```

### Decompile apk to smali code
```
    $ sh dsmali.sh [path/to/apk] [optional args]
        -f,--force              Force delete destination directory.
        -p,--frame-path <dir>   Uses framework files located in <dir>.
        -r,--no-res             Do not decode resources.
        -s,--no-src             Do not decode sources.
        -t,--frame-tag <tag>    Uses framework files tagged by <tag>.
```

### Compile apk from smali code
```
    $ sh bsmali.sh [path/to/folder] [optional args]
        -f,--force-all          Skip changes detection and build all files.
        -p,--frame-path <dir>   Uses framework files located in <dir>.
```
