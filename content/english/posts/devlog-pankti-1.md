+++
date = 2022-11-07T04:41:57Z
description = "Development Blog of Pankti Programming Language a Bengali programming language written in golang which runs on Windows, Mac, Linux, Android, and Web."
images = ["https://b.og.palashbauri.in/api/og?title=Devlog%20%231%20-%20Pankti%20Language&blog=Adventure%20of%20Palash%20Bauri&date=2022-11-07T04:41:57Z&gh=bauripalash"]
kws = ["Programming", "Android", "golang", "programming-language", "Bengali"]
lastmod = 2022-11-10T04:38:14Z
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Devlog #1 - Pankti Language"

+++

For more than a month I'm working on a Bengali programming language called  [*Pankti*](https://github.com/bauripalash/pankti), I'll write about that in more detail later.

Its interpreter is written in Go, I chose to use Go because I always try to get out of my comfort zone; previously I have worked with Rust, C++, and many others and I am now very comfortable with those so I decided to learn something new that's why I chose to use Go.

Apparently, it was a very good choice I made, because it is very easy to cross-compile, and develop bindings for Android and iOS via [Gomobile](https://github.com/golang/go/wiki/Mobile) and it is also very easy to create Web assembly bindings. Now without any fancy major rewrite of the base code, I can make *Pankti* work on smartphones and the web.

It is very safe to say that I am a noob in Android Development still for about a week I have been able to make a prototype. I am using Jetpack Compose for UI and Gomobile to generate bindings for the base 'Go' code. As I don't know anything about android development and kotlin I was having a hard time but I am trying to understand it more.

For example, I can not figure out how to  get the value of TextField which is in another function. Like this semi-pseudocode ->

```kotlin {linenos=table, hl_lines=[2,8] }
fun CodeInputBox(){
    inputBoxA = TextField()
}

fun View(){
    CodeInputBox()
    button = Button()
    button.onclick = print value of inputBoxA
}

```

Like normal functions, I can not make the     function with TextField return something because of its composable nature(???).

I am still trying to figure it out. For now, I have put everything in a single function, and when the TextField value changes it modifies a variable inside that function scope so that the button and others in that function scope can easily access its value. Yeah, I know it is a hacky solution but at least it works as of now 😬.

> Update [UTC 6:50 AM  ]: I gained more modularity and fixed above mentioned issue via this commit [15a5b8e](https://github.com/bauripalash/Pankti-Android/commit/15a5b8e1e884c350d4eab3cba9aba55054a72f95#diff-094f6d5578d500a7a7d17385294dce25319e305cb00c42f6c0d32277083ad744)

Apart from that there are some more issues with the base code, such as the most of internal errors of the interpreter doesn't get to the frontend (both android and default GUI Repl), and the print statement doesn't print anything to the GUI "output box". Actually, I designed the whole interpreter with CLI in mind which is why these problems exist in the first place.

You can check out the Android App source code here <https://github.com/bauripalash/Pankti-Android>. I am also planning to make the gomobile compiled `.jar` and `.aar` files available as directly downloadable so that any potential Android Dev contributor can work on the android source code without needing to install go or generate the bindings by themselves. Though I am not sure if it will work. 

Now, let's talk about the Web/WASM binding. I am working on that right now but I am having a problem where the Go program is stopping way early without giving UI the chance to interpret the given source code. I'll find a way to fix it, I always do.

There's another ⚠️ issue. Not only me, but almost every Go developer is facing this issue; seems like Windows Defender and many more Antivirus for the Windows OS don't like Go programs. AVs think every go program including a simple Hello World is malware; even worse some AVs including Windows Defender delete Go programs without asking any permission from the User (It can be configured not to do so???).

I tested it on my system, and It Is Real! To overcome that I have one simple solution in mind, structure the base code as API and build  a wrapper/Driver with another Language such as Rust. It would work I guess, but I'm gonna have problems with the IUP-based GUI interface of the Default Repl.  Another solution could be to sign the executable with a certificate or something, for example when You install some programs on windows and Windows ask for install authorization it shows a " Developer: Bla Bla Inc."; will it work? I really don't have any idea.

I have come this far, and have written this huge codebase, and I am not gonna let some buggy software stop me. Dear Billy and Microsoft fix your broken and hilariously costly programs!

