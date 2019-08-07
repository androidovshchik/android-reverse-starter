# android-reverse-starter
> Useful tools for reverse out of the box (Linux compatible)

## Requirements
* JDK 8
* Currently on Linux 32bit: zipalign must be set in `PATH`

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

### Config file
Don't lost to define location of Android SDK

```
{
  "uber_apk_signer_version": "1.0.0",
  "apktool_version": "2.4.0",
  "jadx_version": "1.0.0",
  "ANDROID_HOME": "/path/to/android/sdk"
}
```

### First setup or upgrade
```
    $ sh init.sh
```

## Decompile

### Decompile all apk and move to `_original` folder
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

### Sign last apk
```
    $ sh sign.sh


        -a,--apks <file/folder>           Can be a single apk or a folder containing multiple apks. These are used
                                          as source for zipalining/signing/verifying. It is also possible to
                                          provide multiple locations space seperated (can be mixed file folder):
                                          '/apk /apks2 my.apk'. Folder will be checked non-recursively.
           --allowResign                  If this flag is set, the tool will not show error on signed apks, but
                                          will sign them with the new certificate (therefore removing the old
                                          one).
           --debug                        Prints additional info for debugging.
           --dryRun                       Check what apks would be processed without actually doing anything.
        -h,--help                         Prints help docs.
           --ks <keystore>                The keystore file. If this isn't provided, will try to sign with a debug
                                          keystore. The debug keystore will be searched in the same dir as
                                          execution and 'user_home/.android' folder. If it is not found there a
                                          built-in keystore will be used for convenience. It is possible to pass
                                          one or multiple keystores. The syntax for multiple params is
                                          '<index>=<keystore>' for example: '1=keystore.jks'. Must match the
                                          parameters of --ksAlias.
           --ksAlias <alias>              The alias of the used key in the keystore. Must be provided if --ks is
                                          provided. It is possible to pass one or multiple aliases for multiple
                                          keystore configs. The syntax for multiple params is '<index>=<alias>'
                                          for example: '1=my-alias'. Must match the parameters of --ks.
           --ksDebug <keystore>           Same as --ks parameter but with a debug keystore. With this option the
                                          default keystore alias and passwords are used and any arguments relating
                                          to these parameter are ignored.
           --ksKeyPass <password>         The password for the key. If this is not provided, caller will get a
                                          user prompt to enter it. It is possible to pass one or multiple
                                          passwords for multiple keystore configs. The syntax for multiple params
                                          is '<index>=<password>'. Must match the parameters of --ks.
           --ksPass <password>            The password for the keystore. If this is not provided, caller will get
                                          a user prompt to enter it. It is possible to pass one or multiple
                                          passwords for multiple keystore configs. The syntax for multiple params
                                          is '<index>=<password>'. Must match the parameters of --ks.
        -o,--out <path>                   Where the aligned/signed apks will be copied to. Must be a folder. Will
                                          create, if it does not exist.
           --overwrite                    Will overwrite/delete the apks in-place
           --skipZipAlign                 Skips zipAlign process. Also affects verify.
        -v,--version                      Prints current version.
           --verbose                      Prints more output, especially useful for sign verify.
           --verifySha256 <cert-sha256>   Provide one or multiple sha256 in string hex representation (ignoring
                                          case) to let the tool check it against hashes of the APK's certificate
                                          and use it in the verify process. All given hashes must be present in
                                          the signature to verify e.g. if 2 hashes are given the apk must have 2
                                          signatures with exact these hashes (providing only one hash, even if it
                                          matches one cert, will fail).
        -y,--onlyVerify                   If this is passed, the signature and alignment is only verified.
           --zipAlignPath <path>          Pass your own zipalign executable. If this is omitted the built-in
                                          version is used (available for win, mac and linux)
```

### Install last apk
```
    $ sh install.sh
```

### Launch last apk
```
    $ sh launch.sh
```

### Compile, sign as debug, install and launch last apk
```
    $ sh b.sh
```