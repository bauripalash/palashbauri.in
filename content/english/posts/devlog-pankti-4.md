+++
date = 2023-02-06
description = "Development Blog of Pankti Programming Language a Bengali programming language written in golang which runs on Windows, Mac, Linux, Android, and Web."
images = ["https://b.og.palashbauri.in/api/og?date=2023-02-06T04:38:14Z&title=Devlog%20%234%20-%20Pankti%20Language"]
kws = ["Programming", "rust", "golang", "programming-language", "bengali"]
lastmod = 2023-02-06
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Devlog #4 - Pankti Language"
+++


Pankti Programming language, the language I am building is slow, terribly slow. I couldn't catch that earlier because I was naive and my laptop is damn too powerful to have any problem with high memory or CPU usage. To calculate the 30th Fibonacci it takes around 12 seconds.

The slowness doesn't come from high resource consumption or poor code but mostly from the evaluation algorithm.

I was following along with the book [Writing An Interpreter In Go](https://interpreterbook.com/) to build the interpreter for Pankti. But the language has grown up to be a different language now than the language mentioned in the book, the Syntax is changed, and some underlying technics have also changed.

Though I made many performance-related optimizations they're not enough.

I am done implementing a Compiler and Virtual Machine following along with the guide of the book [Writing A Compiler In Go](https://compilerbook.com).

Though It's complete and I have spent around a whole week I am stuck in a duality on whether Go is the correct language for this project or if should I move to better languages with more spoon fed speed maybe Rust?

But I also have two major concerns about rewriting the whole codebase in Rust.

1. Will the integration with Android will be as easy as Go?
2. Most importantly, Will I enjoy working on it once it is rewritten?

With the current go implementation, android integration is very easy. I just compile the codebase with gomobile to create a `.aar` file and push it to maven central for easy importing it as a dependency on the android studio project. Though I haven't done any in-depth research on Android Integration with Rust, I suspect it may not be as easy as my current workflow.

I know rust, I'm not a total stranger to how Rust works. I have made multiple projects with Rust, I even made a lispy esoteric language with Rust[^1] and I know pretty well enough that it can be a pain in the a.. sometimes.

Anyway, I took the leap of faith and started working on the rust implementation. Lexer is complete, I finished it last night and today I'm going to start working on the parser.

I am going to keep the implementation as simple as possible and will try to include no external dependencies for the base language. Of course, I have to use a library for the default "ide" and the turtle graphics I am wanting to include.

First I am going to write the whole thing as simply as I can without thinking much about optimization or speed, then I am going to gradually include optimizations.

My vision for this programming language is to keep it simple and small. It should not be seen as a competitor for other languages instead I would like to work it as a bridge to make the path easy for users to switch to other languages when necessary.

---
[^1]: [Mewl, program in cats' language; A just-for-fun language](https://github.com/bauripalash/mewl)