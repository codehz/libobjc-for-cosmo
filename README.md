# GNU Objective-C Runtime for Cosmopolitan Libc

Allow you to use objc feature in Cosmopolitan Libc.

Only support legacy gcc's objective-c runtime for now.

## Prerequisite

1. You need cosmocc SDK from https://cosmo.zip/pub/cosmocc, it currently use the 3.1.3 version
2. You also need my patched version of the superconfigure (https://github.com/codehz/superconfigure) just download the aarch64-gcc.zip and x86_64-gcc.zip and unzip into the cosmocc sdk (overwrite)

## Usage
Put objc folder in release.zip to your include path
And put libobjc.o and .aarch64/libobjc.o into your library path

Use command `cosmocc -fobjc-exceptions -I<path-to-libobjc-inc> -L<path-to-libobjc-lib> -lobjc <source>.c -o <target>` to build

## Available features

| Feature    | State        |
| ---------: | :----------- |
| GC         | ❌ Not enabled |
| Exceptions | ✅ Yes, require -fobjc-exceptions options, it will use SJLJ model of exceptions |

## Why are you even want to create that? Is it even useful?

Just because I can, and it is fun to play legacy stuff like objc 1.0 with Cosmopolitan Libc

## License

Since it is copied from gcc, it follows GCC's license (GPLv3) with GCC Runtime Library Exception.