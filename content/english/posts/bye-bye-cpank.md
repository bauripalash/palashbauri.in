+++
date = 2023-06-11
description = "CPank is going to get deprecated"
images = ["https://b.og.palashbauri.in/api/og?date=2023-06-11T04%3A25%3A55.889Z&title=Bye%20Bye%20CPank%3B%20Welcome%20NeoPank&gh=bauripalash&blog=Adventure%20of%20Palash%20Bauri"]
kws = ["programming", "c" ,"interpreter", "windows", "programming-language", "bengali", "cross-compile"]
lastmod = 2023-06-11
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Bye Bye CPank Welcome NeoPank"
+++

### Beginning

I have been working on writing an "almost perfect" and "correctly working" interpreter for at least two years, and *where I am now?*; **More or less where I started**.

There were two major factors in play for this situation,

First, I never should have done more than a single attempt to implement pankti in Rust.

The second is, Trying to achieve full Windows compatibility with C and Unicode.

### Rust
No hate for Rust, it is a great language, I have done numerous projects with Rust, but developing an interpreter or compiler is a whole new territory. 

The fine-grained control of memory with raw pointers is very unnatural in the eyes of Rust, but the project demands it, thus I basically started writing C-Style unsafe Rust with very unpleasant syntax.

I should have stopped at the first attempt. Instead, I tried again and again at least I created 4-5 fully featured Pankti implementations, with bugs lurking around everywhere.

I have experienced that most of the time spent with the Rust variant of pankti is writing code to please the Rust compiler. 

Maybe I am a bad programmer, or it could be that don't understand rust.

### C, Unicode on Windows
On every forum, every programming subreddit, IRC, or discord channel you will find frustrated programmers who hate Windows. Windows is the "brokenest" piece of software I have ever witnessed.

You see, on Linux or even all *nix have almost, if not fully perfect Unicode system.  Utf-8, UTF-16, UTF-32, you get all working systems, but on Windows only thing you get is 90's wide chars,

The early prototypes of cpank were made with `wchar_t` but UTF-16 is a mess, I am not gonna explain the problems I faced with UTF-16, do a quick Google search, and all the bad things you will find about UTF-16 happened with my project.

The C implementation, aka. `Cpank` is a fully working piece of program on Linux but as you enter the Windows territory, things start to go haywire.

Windows uses UTF-16 internally, and there are all these messes with nonstandard APIs and functions; the code began getting complicated with all the windows specific tweaks I had to write.



### Depreciation
For the last couple of days, a single question was devouring my mind, should I switch to another "modern" language, at last, I decided, Yes, why not!

As I told previously,  I will use either `D` or `Zig`, this time I went with Zig.

The Zig language is very small, just like C, yet is modern and fully featured. 

> I don't know if people understand, Rust is not a C alternative, it doesn't even fall in the C territory, it's more of a C++ alternative.

As soon as `neopank` (the new pankti implementation written in Zig) is complete, `cpank` will get deprecated.

A snapshot will be made of the latest state of `cpank` and shifted into a separate repository for "historical" purposes, and the neopank repository will be merged into the main `pankti` repository

As of now, Jun 10, 2023, the lexer is complete, and work on the compiler and VM is going on at a decent pace.


### License change

Was GNU GPL 3 the right choice for cpank? I always wondered, it's true I don't want it to be misused in a way that people have to face any "inconvenience", this world is corrupted, humanity is on its last breath, people can make some slight changes and sell it, companies who have lots of money can advertise their version and persuade people to buy a piece of program which is, in reality free, if that happens, my work will be hidden beneath search result full of advertisements. That's why I went for a strong copyleft license.

But what if someone decides to incorporate pankti in a program that is already a full-fledged software on its own, what if a startup or a not-so-evil company wants to use pankti as a scripting language for their new game engine or spreadsheet program, with GPL wouldn't be able to unless they plan to open source their own software.

What if the government wants to use pankti as a learning tool via their own learning platform, as per law they'd be required to open source their program, which they may not like.

In my view, these are a few exceptions I'll let pass, but GPL won't let me do that, that's why I have decided to license neopank under Mozilla Public License 2.0 and as the cpank is going to be removed from the tree, I should not have any problem with doing so.

Let's hope for the best, and prepare for the worst.