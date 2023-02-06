+++
date = 2023-02-06
description = "Development Blog of Pankti Programming Language a bengali programming language written in golang which runs on Windows, Mac, Linux, Android and Web."
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

Pankti Programming language, the language I am building is slow, terribly slow. I couldn't catch that earlier because I was naive and my laptop is damn too powerful to have any problem with high memory or cpu usage. To calculate the 30th fibonacci it takes around 12 seconds.

The slowness doesn't come from high resource consumption or poor code but mostly from the evaluation algorithm.

I was following along the book Writing An Interpreter In Go to build the interpreter for Pankti. But the language  has grown up be a totally different language now than the language mentioned in the book, the Syntax is changed, some underlying technics have also changed.

Though I made many performance related optimization but they're not enough.

I am done implementing a Compiler and Virtual Machine following along with the guide of the book Writing A Compiler In Go .

Though It's complete and have spent around a whole week, but I am stuck in a duality whether Go is the correct language for this project or should I move to better languages with more spoon fed speed maybe Rust?

But I also have two major concerns about rewriting the whole codebase in Rust.

Will the integration with Android will be as easy Go?
Most importantly, Will I enjoy working on it once it is rewritten?

With current go implementation the android integration is very easy. I just compile the codebase with gomobile to create  .aar  file and push it to maven central for easy importing it as dependency on the android studio project. Though I haven't done any in depth research for Android Integration with Rust, I suspect it may not be as easy as the my current workflow.

I know rust, I'm not a total stranger to how Rust works. I have made multiple projects with Rust, I even made an lispy esoteric language with Rust[^1] and I know pretty well enough that it can be pain in the a.. sometimes.

Anyway I took the leap of faith and started working on the rust implementation. Lexer is complete, I finished it last night and today I'm going to start working on the parser.

I am going to keep the implementation as simple as possible and will try to include no external dependencies for the base language. Ofcourse I have to use a library for the default "ide" and the turtle graphics I am wanting to include.

First I am going to write the whole thing as simply as I can without thinking much about optimization or speed, then I am going to gradually include optimizations.

My vision for this programming language is to keep it simple and small. It should not be seen as a competitor for other languages instead I would like to work it as bridge to make the path easy for users to switch to other languages when necessary.

 

[^1]: Mewl, program in cats' language; A just-for-fun language