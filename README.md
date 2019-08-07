# android-reverse-starter
> Useful tools for reverse out of the box (Linux compatible)

## Setup

### Extra dependencies
- wget
- jq
- unzip

On Debian
```
    $ apt-get install -y wget jq unzip
```

On Fedora
```
    $ dnf install -y wget jq unzip
```

### First setup or upgrade from config
```
    $ sh init.sh
```

## Decompile

### Decompile all apk full
```
    $ sh d.sh
```

### Decompile all apk to smali code via Apktool
```
    $ sh dsmali.sh [optional args]
        -f,--force              Force delete destination directory.
        -o,--output <dir>       The name of folder that gets written. Default is apk.out
        -p,--frame-path <dir>   Uses framework files located in <dir>.
        -r,--no-res             Do not decode resources.
        -s,--no-src             Do not decode sources.
        -t,--frame-tag <tag>    Uses framework files tagged by <tag>.
```

### Decompile all apk to java code via JADX
```
    $ sh djadx.sh [optional args]
        -d, --output-dir                    - output directory
        -ds, --output-dir-src               - output directory for sources
        -dr, --output-dir-res               - output directory for resources
        -j, --threads-count                 - processing threads count
        -r, --no-res                        - do not decode resources
        -s, --no-src                        - do not decompile source code
        --single-class                      - decompile a single class
        --output-format                     - can be 'java' or 'json' (default: java)
        -e, --export-gradle                 - save as android gradle project
        --show-bad-code                     - show inconsistent code (incorrectly decompiled)
        --no-imports                        - disable use of imports, always write entire package name
        --no-debug-info                     - disable debug info
        --no-inline-anonymous               - disable anonymous classes inline
        --no-replace-consts                 - don't replace constant value with matching constant field
        --escape-unicode                    - escape non latin characters in strings (with \u)
        --respect-bytecode-access-modifiers - don't change original access modifiers
        --deobf                             - activate deobfuscation
        --deobf-min                         - min length of name, renamed if shorter (default: 3)
        --deobf-max                         - max length of name, renamed if longer (default: 64)
        --deobf-rewrite-cfg                 - force to save deobfuscation map
        --deobf-use-sourcename              - use source file name as class name alias
        --rename-flags                      - what to rename, comma-separated, 'case' for system case sensitivity, 'valid' for java identifiers, 'printable' characters, 'none' or 'all'
        --fs-case-sensitive                 - treat filesystem as case sensitive, false by default
        --cfg                               - save methods control flow graph to dot file
        --raw-cfg                           - save methods control flow graph (use raw instructions)
        -f, --fallback                      - make simple dump (using goto instead of 'if', 'for', etc)
        -v, --verbose                       - verbose output
        --version                           - print jadx version
        -h, --help                          - print this help
```

## Compile

### Compile last apk from smali code via Apktool
```
    $ sh bsmali.sh [optional args]
        -f,--force-all          Skip changes detection and build all files.
        -o,--output <dir>       The name of apk that gets written. Default is dist/name.apk
        -p,--frame-path <dir>   Uses framework files located in <dir>.
```

### Sign last apk from smali code via Apktool
```
    $ sh sign.sh [optional args]
        -f,--force-all          Skip changes detection and build all files.
        -o,--output <dir>       The name of apk that gets written. Default is dist/name.apk
        -p,--frame-path <dir>   Uses framework files located in <dir>.
```

### Install last apk from smali code via Apktool
```
    $ sh install.sh [optional args]
        -f,--force-all          Skip changes detection and build all files.
        -o,--output <dir>       The name of apk that gets written. Default is dist/name.apk
        -p,--frame-path <dir>   Uses framework files located in <dir>.
```

### Launch last apk from smali code via Apktool
```
    $ sh launch.sh [optional args]
        -f,--force-all          Skip changes detection and build all files.
        -o,--output <dir>       The name of apk that gets written. Default is dist/name.apk
        -p,--frame-path <dir>   Uses framework files located in <dir>.
```

### Compile, sign as debug, install and launch last apk
```
    $ sh b.sh
```