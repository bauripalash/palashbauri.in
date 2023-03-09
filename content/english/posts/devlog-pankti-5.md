+++
date = 2023-03-09
description = "Development Blog of Pankti Programming Language a Bengali programming language which runs on Windows, Mac, Linux, Android, and Web."
images = ["https://b.og.palashbauri.in/api/og?date=2023-03-09T04:38:14Z&title=Devlog%20%235%20-%20Pankti%20Language"]
kws = ["Programming", "c" ,"rust", "golang", "programming-language", "bengali"]
lastmod = 2023-03-09
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Devlog #5 - Pankti Language"
+++

Hello folks 👋 
It's been more than a month since I wrote in the English blog here.

I've been busy. I am working hard on rewriting the Panki Interpreter. 

![code code code](https://media.tenor.com/VpZ2Nf5gdRYAAAAd/pc-banging.gif ";;;;")

I am currently on the fifth iteration of rewriting from scratch. 

0. The original Tree walking interpreter written in Go.
1. The bytecode compiler and vm written in Go.
2. 1 (👆) written in Rust.
3. Rewrite from Scratch with guidance from Crafting Interpreters (lox)
4. Rewrite major parts of 3 (👆) from almost scratch because I made some huge blunders 🦧 which I am embarrassed to mention here.
5. (Currently) Rewriting from Scratch in C.

I must say Rust ones were the most difficult to implement and kinda the slowest ones.

I started rewriting in Rust because I thought it would make improving and maintaining the codebases easy and error-free, well I was right but the cost of the decision was that the code base code was huge and ludicrously slow. I don't think it's fair to put all the blame for slowness on Rust itself, but it certainly is sometimes to blame.

![🦀](https://media.tenor.com/djaLJiqAxzIAAAAd/rust-lang-ferris.gif "🦀")

Look, I like rust. It's great but I don't think you can write a really fast interpreter without playing with unsafe rust.

Then Why Did I choose C?
The first argument I would like to present is that C is simple and easy 🤯. 
Second, it's freakishly fast.
Third, I like playing with pointers.

I know I will introduce many bugs and maybe some memory leaks here and there but it will be a really good learning opportunity for me to use C in a real-world program.

Plus, C can be called from other languages such as Go, and Rust which will make it easy for me to write some portable GUI editor for the interpreter.

Before starting with C, I was afraid it would be really difficult to handle Bengali unicode characters but apparently, it's not that hard nowadays thanks to `wchar` and suckless's [libgrapheme](https://libs.suckless.org/libgrapheme/) is also handy if I need it later