+++
date = 2023-05-29
description = "using zig as build system for Pankti Programming Language a Bengali programming language which runs on Windows, Mac, Linux, Android, and Web."
images = ["https://b.og.palashbauri.in/api/og?date=2023-05-29T04%3A23%3A45.381Z&title=Zig%20as%20build%20system%20for%20Cpank&gh=bauripalash&blog=Adventure%20of%20Palash%20Bauri"]
kws = ["programming", "c" ,"zig", "windows", "programming-language", "bengali", "cross-compile"]
lastmod = 2023-06-03
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Zig as build system for Cpank"
+++


Cpank[^1] the reference implementation of Pankti Programming Language, written in C, is growing in size day by day, and the complications of building it in both Windows and Linux are becoming a huge pain.

The core interpreter is pretty small compared to other heavy-weight interpreters but the biggest problem was the GUI editor.

Pankti is a language targeted at the Bengali Language, though it has first-class support for English, scripts are supposed to be written in Bengali, and though customizable output and errors will be in Bengali script. Mostly all Terminal emulators have broken support for displaying complicated unicode characters thus users will mostly see messed up output from Cpank. A GUI with Unicode support can bring huge user experience improvements, users will see correctly rendered Bengali characters.

Modern programming language such as Rust, Go, etc. has their own built-in platform independent build system, you just run `go build` or `cargo build`, and boom 💥 a few seconds later you get a self-contained executable. But for C, things are not that simple, you don't get a built-in build system, you must use some external tools such as *GNU Make*, *Cmake*, *Meson* etc. The closest to cross-platform build systems you can get are cmake and meson (and a few others). Building the core interpreter is very simple, if you want you can just write a single-line terminal command and within two or three seconds, you get a single executable. But GUI is hard!

I have tried quite a few pure C GUI frameworks, but I chose to settle with IUP[^2], it's simple and lightweight. Though not that complicated to build, it requires some conditionals to be built for both Windows and Linux.

> IUP has experimental support for MacOS, but the good thing is I am not targeting MacOS, 'cause I don't own a Mac machine, so I can't actually test nor make Mac specific tweaks in the core interpreter. The interpreter may run without any tweaks, but I have no way to know it.

A few weeks ago, I was prototyping a turtle graphics system with [Raylib](https://www.raylib.com/), when I noticed Raylib is using [Zig](https://ziglang.org/) build system. I have been keeping track of Zig development for the last few months and was aware of the Zig build system but never really tried it out. Finally, I decided to give it a try, and surprisingly enough *it just works*, not only that I can even cross-compile to Windows without leaving Linux. 

Building the GUI variant become as easy as building the core since commit [d70137d](https://github.com/bauripalash/pankti/commit/d70137df395f5b7040be3973b860a9df7720badb), I have been using zig as my default build system. On Windows complicated build system became child's play. The conditional steps I mentioned above got covered within a few lines of code. The best thing about Zig's build system is that it includes a full-fledged Clang compiler inside it, thus building on Windows got a lot easier as we no longer need setup a complicated C setup, I believe in future potential contributors of cpank will appreciate the current setup

When in my last [devlog #6](https://palashbauri.in/devlog-pankti-6/) I said about using zig, I didn't think I would use it so soon. Take a look at the current state of my `build.zig`[^3], it might help you should you decide to use zig as you build system.,

### Update: Jun 3, 2023
Well, Zig is creating a mess on Windows. Unfortunately, My tests were passing, and I thought "It's alive", but the celebration was very premature.

The basic fundamental functionality of cpank is not working if compiled with zig cc on Windows, the executable is unable to parse pankti scripts written in Bengali.

But interestingly enough, when I dug deeper into the Zig source code, I found out that the problem is not with Zig cc but with the clang itself. I discussed it with Zig folks, but the problem has nothing to do with Zig. 

The core cli tool is not that much of a problem, it can be easily built with gcc or msvc but I'm struggling with GUI.

Hah.. 
I am tired as well as frustrated.

---

[^1]: [bauripalash/pankti](https://github.com/bauripalash/pankti)

[^2]: [IUP Portable User Interface](https://www.tecgraf.puc-rio.br/iup/)

[^3]: main branch - [latest commit](https://github.com/bauripalash/pankti/blob/main/build.zig) 
