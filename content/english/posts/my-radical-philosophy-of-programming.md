+++
date = 2023-06-04
description = "My radical philosophy of programming"
images = ["https://b.og.palashbauri.in/api/og?date=2023-06-04T05%3A50%3A12.591Z&title=My%20radical%20philosophy%20of%20programming&gh=bauripalash&blog=Adventure%20of%20Palash%20Bauri"]
kws = ["programming", "c" ,"philosophy", "windows", "programming-language", "bengali", "cross-compile"]
lastmod = 2023-06-04
showtoc = false
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["philosophy", "programming"]
title = "My radical philosophy of programming"
+++

Since the initial covid lockdown, I have been working on Pankti Programming Language. Initially, it was written in Go, then I rewrote it in Rust, and it got too much complicated. Then I settled on C, though I am having some problems as I mentioned in my previous post[^1].

Over time I developed some strict philosophy around the development which I follow radically:

### 1. A program must do its job correctly.

No matter the input or host platform the program must generate the same output, if it fails it must produce error messages which enough information so that users can report the issue in-depth. Edge cases should be handled perfectly.
This point along with number 2 is the topmost priority.

### 2. The source code of the program must be simple to understand no matter the language used.

Use simpler algorithms. Write smaller functions. Does not matter if the program is slow or has memory leaks, if the program works correctly nothing matters anymore.

### 3. The source code should be modular

instead of writing huge chunks of code in a single file, break the file into smaller chunks, such as if needed the code can be used in future projects without big changes.

### 4. The code should be cross-platform. 

Whereas possible Don't use nonstandard or platform-dependent code. 

### 5. The code must be well commented.

such as that you don't even need to look up the programming language or library documentation every 5 seconds.

### 6. The programmer must write notes 

More like a log of what has been done till now and what will be done.

### 7. The program should be well optimized
unless it makes the code hard to understand even with good comments.

### 8. Avoid sharp characters

Characters like angled brackets <...> should be avoided as far as possible, it really hurts the eyes to skim through the code.

---

[^1]: [Zig as build system for Cpank](https://palashbauri.in/zig-as-build-system-for-cpank/)