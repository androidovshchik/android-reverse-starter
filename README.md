## android-reverse-starter
> Useful tools for reverse out of the box (Linux compatible)

### Dependencies
- wget
- jq

### Setup
```
    $ sh install.sh
```

### Decompile apk to smali code
```
    $ sh dsmali.sh [optional args]
        -f,--force              Force delete destination directory.
        -p,--frame-path <dir>   Uses framework files located in <dir>.
        -r,--no-res             Do not decode resources.
        -s,--no-src             Do not decode sources.
        -t,--frame-tag <tag>    Uses framework files tagged by <tag>.
```

### Decompile apk to java code via jadx
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
```

### Compile apk from smali code
```
    $ sh bsmali.sh [optional args]
        -f,--force-all          Skip changes detection and build all files.
        -p,--frame-path <dir>   Uses framework files located in <dir>.
```
