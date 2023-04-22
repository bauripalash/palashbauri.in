+++
date = 2023-04-22
description = "Development Blog 6 of Pankti Programming Language a Bengali programming language which runs on Windows, Mac, Linux, Android, and Web."
images = ["https://b.og.palashbauri.in/api/og?date=2023-04-22T04:38:14Z&title=Devlog%20%236%20-%20Pankti%20Language"]
kws = ["Programming", "c" ,"rust", "golang", "programming-language", "bengali"]
lastmod = 2023-04-22
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Devlog #6 - Pankti Language"
+++

It's been quite some time, and as usual, I'm inconsistent, well I was busy, very busy rewriting Pankti Interpreter.

I have already mentioned in the last few posts that my programming language Pankti is being rewritten from scratch, previously it was Tree 🌳 Walker Interpreter but it now has a compiler and a virtual machine. The compiler generates some gibberish integers (Opcodes, Instructions) and the vm does some specific tasks based on those integers, fundamentally it is a very simple thing. Unfortunately, those fat academic books made us total fools by making us believe that writing interpreters and compilers are not the job of 🤹 mere humans. 

But some people have written some nice books to make it easier for us to learn the magical art of writing interpreters and compilers such as Robert Nystrom's [Crafting Interpreters](https://craftinginterpreters.com/), Thorsten Ball's [Writing An Interpreter In Go](https://interpreterbook.com/) & [Writing A Compiler In Go](https://compilerbook.com/) and many more.

It's been always my goal in life to create a Bengali programming language since the day I touched a compiler. When I was 12 years old, my parents bought me a computer, and since then I have been trying to put together a programming language. At that time I had very limited time for 2G internet[^1], so I had to pull as many reading resources as I could within 24 hours or so. I read about parsers,  parser generators, lexer aka. scanners, compiler compiler, bootstrapping, and many more. Parser Generators seemed "a way" of reaching my goal; first I tried Bison & Flex but those were too complicated for me 'cause at that time I was just beginning to learn programming. 

> By the way, Did I ever mention C++ was my first programming language

Then I looked up other parser generators, I found [ANTLR (Java)](https://www.antlr.org/), [Ply (Python)](https://github.com/dabeaz/ply) and [Gold Parser](http://www.goldparser.org/).

Using Ply and Gold Parser I reached much closer to my goal than ever before.

Years passed, and I got busy in high school. It is not like I have not done anything about building my own language, I built [MewMew](https://github.com/bauripalash/mewmew) an esoteric programming language that let's you program in cats' language, which was written in ANTLR4 and C++.

In the lockdown, I made multiple prototypes at least 6 excluding small single experiments on lexer or parsers; I made most of my attempts in Rust. But as I progressed through the prototypes, Rust's borrow checkers & compiler made my life a living hell, I got huge help from the Rust community which in my opinion is the friendliest of all the programming communities I ever interacted with; unfortunately, my field of interest was so niche that I was struggling to get optimal solutions, so I started replacing some safe components with unsafe rust, gradually making the whole projects unsafe rust. As a result, the codebase got too complicated and ultimately it became "unfun" to work on the project.

At that time I was reading the book Crafting Interpreters and started rewriting the project in C with guidance from the book. I started having fun again and I almost finished the project. 

The most difficult part of the whole project is Bengali support, programming language like Rust, and Go supports Unicode very well but C is bare bones, I had to write big chunks of helper codes to handle Bengali[^2] Unicode characters properly but I believe I have kept the code simple yet functional.

In the beginning, I used `wchar` to handle Unicode characters but shifted to use [`char32_t`](https://en.cppreference.com/w/c/string/multibyte/char32_t) present in C11 standards. I use UTF-32 internally for everything thus keeping the code simpler but making it consume a little more memory than it would if UTF-8 was used; though I use UTF-32, in some parts of the code characters are converted to UTF-8 back and forth extensively. Actually, to use UTF-8 I don't have to change most logics instead of using custom char32_t specific counterparts of standard `char` specific functions. But the problem I will face is in the Lexer (Scanner), it's not like I didn't try using UTF-8, but its variable length creates extra headaches to correctly detect Bengali alphabet characters, given a single character like `0xE0` I have to check the next character and the character after that to correctly assume the 3 `char`s are a single Bengali character, it's too much work and will complicate the lexing process too much.

I want and will keep the code as simple and dumb as possible, I am aware that in the process I will lose some speed and create some memory bugs, but the code must stay simple, magic-less, and close to the metal.

If in the future I must reimplement the interpreter in other languages, my first choices will be Zig or D.

---
[^1]: Read more about my experience here - <https://palashbauri.in/internet-with-my-eyes/>
[^2]: Bengali Alphabet - [wikipedia](https://en.m.wikipedia.org/wiki/Bengali_alphabet)