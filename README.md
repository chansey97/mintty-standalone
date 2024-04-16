# mintty-standalone
A standalone mintty minimal installation for Windows Console CLI (e.g. CMD, Windows PowerShell) without msys2 or cygwin.

## Motivation

On Windows, input/output Unicode in a console is tricky. The legacy console (conhost.exe) is buggy and no one want to use it. Nowadays, we have Windows Terminal, but it requires Windows 10 (build 19041) or later.

There have been several workarounds at the moment, e.g. ConEmu, ConsoleZ, etc, but they can't show Color Emoji on Windows 7.

Color Emoji requires Color Font (aka Chromatic font) support. Unfortunately it is a new feature from Windows 8.1. Any program on Windows 7 that uses GDI/Uniscribe/DirectWrite to render font directly will never show Color Emojis, even though you have selected correct Font (COLR/CPAL).

However, some programs are exceptions, such as Firefox, Telegram, etc. They use their own methods for rendering Color Font.

Mintty is another such example. It renders Color Emoji as graphics, so Color Font is not necessary.

**A Screen recording:**

https://github.com/chansey97/mintty-standalone/assets/4015056/8fe6df31-b7a1-40cd-b354-85270f318d0d

P.s. The approach also supports [FarManager](https://www.farmanager.com/), I didn't show it in the demo though. Being able to display Color Emoji make console apps look nicer. Might be more apps you can find?

**So how to achieve that? There are 3 ways currently.**

1. Use my standalone mintty minimal installation from https://github.com/chansey97/mintty-standalone
   * Copy `mintty-3.7.0` to `C:/green/mintty/`.
   * Double click `mintty-standalone-winpty-65001-cmd.cmd` , it should open a mintty window with CMD.
   * If you'd like to run Power Shell, please make sure Windows Power Shell v5.1 has been installed (see  https://learn.microsoft.com/en-us/previous-versions/powershell/scripting/windows-powershell/wmf/setup/install-configure?view=powershell-7.1#wmf-51-prerequisites-for-windows-server-2008-r2-sp1-and-windows-7-sp1), then double click  `mintty-standalone-winpty-65001-powershell5.cmd`.
2. Create the standalone mintty minimal installation from upstream by yourself
   * Create `mintty-3.7.0` folder in `C:/green/mintty`.
   * Download https://repo.msys2.org/distrib/msys2-x86\_64-latest.tar.xz .
   * Copy the corresponding mintty files to `C:/green/mintty/mintty-3.7.0` (compare [the directory structure](https://github.com/chansey97/mintty-standalone/tree/main/mintty-3.7.0)).
   * Download https://github.com/rprichard/winpty/releases/download/0.4.3/winpty-0.4.3-msys2-2.7.0-x64.tar.gz .
   * Copy the corresponding winpty files to`C:/green/mintty/mintty-3.7.0`  (compare [directory structure](https://github.com/chansey97/mintty-standalone/tree/main/mintty-3.7.0)).
   * Create `minttyrc` in  `C:\green\mintty\mintty-3.7.0\etc` and config as your need. (See [minttyrc](https://github.com/chansey97/mintty-standalone/blob/main/mintty-3.7.0/etc/minttyrc), [integrated fonts](https://github.com/chansey97/mintty-standalone/tree/main/mintty-3.7.0/usr/share/mintty/fonts), [mintty-tips](https://github.com/mintty/mintty/wiki/Tips#providing-and-selecting-fonts)).
   * Create emoji graphics. You can copy from [mine](https://github.com/chansey97/mintty-standalone/tree/main/mintty-3.7.0/usr/share/mintty/emojis/zoom) directly or follow the [tips](https://github.com/mintty/mintty/wiki/Tips#providing-and-selecting-fonts) from to create them by yourself.
   * Double click `mintty-standalone-winpty-65001-cmd.cmd` or `mintty-standalone-winpty-65001-powershell5.cmd`.
3. Use msys2 with mintty + winpty
   * You will get additional bash and zsh functionality. The drawback is not as lightweight as the standalone installation above. Also some apps might have path style problem.

Hope this post can help those who encounter issues with Unicode, Font and Emoji in the Windows 7 Console.

https://new.reddit.com/r/windows7/comments/1c53yz6/color_emoji_in_windows_7_terminal_support_cmd/


