+++
date = 2022-11-10T04:38:14Z
description = "Development Blog 2 of Pankti Programming Language a bengali programming language written in golang which runs on Windows, Mac, Linux, Android and Web."
images = ["https://b.og.palashbauri.in/api/og?date=2022-11-10T04:38:14Z&title=Devlog%20%232%20-%20Pankti%20Language"]
kws = ["Programming", "Android", "golang", "programming-language", "bengali"]
lastmod = 2022-11-10T04:38:14Z
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "programming"]
title = "Devlog #2 - Pankti Language"
+++



While I was writing the Interpreter for Pankti Programming Language, I never planned on developing a GUI Ide/Repl. But I was naive, a non-English-based programming language must have a GUI Frontend because Consoles/Terminals doesn't handle Unicode properly. 

Even a minimal Hello World program will not work properly, as when it'll write to Standard Output, the text will not be rendered correctly. Though some terminal emulators handle Bengali Unicode characters perfectly fine such as KDE's Konsole, most don't.

That's why I needed a GUI frontend. When I started working on that, I experimented with many Go GUI frameworks such as [Fyne](https://github.com/fyne-io/fyne), and [Gioui](https://gioui.org) but they don't have good Unicode input/output support. The stable version of Fyne can't render Bengali Unicode characters for both input and output [[ open issues]](https://github.com/fyne-io/fyne/issues?q=is%3Aissue+is%3Aopen+Unicode). Gioui seemed very promising at first, but though it can display Bengali characters fine, apparently it doesn't take iBus inputs [[discussions]](https://lists.sr.ht/~eliasnaur/gio/%3C2267845.ElGaqSPkdT%40bauri%3E). Without iBus, it's 'almost' impossible to write Bengali on Linux-based distros. Though there's an alternative, [fctix](https://wiki.archlinux.org/title/fcitx), there's no stable Bengali input method. Currently, the best Bengali module for iBus is [OpenBanglaKeyboard](https://github.com/OpenBangla/OpenBangla-Keyboard). They also provide a fctix module which it's not very stable. 

I could've used Gioui for writing GUI for non-Linux OSes but it would've been a very tedious job to maintain multiple codebases for multiple platforms. 

I settled on using IUP go binding. IUP is a great library and very easy to cross-compile. Milan Nikolic made this awesome library iup-go which made the whole GUI development process very easy for me. Huge thanks to them. 

As I mentioned earlier, I kinda made a mistake by not leaving a way to modify the target output; every `print` statement prints to stdout, and as a result, GUI users won't see their desired output. 

Fortunately, I have made the whole code as modular as possible, and I can pass a parameter to the evaluator function to treat the print statements as a returnable expression and redirect the output to the GUI instead of stdout. It should work, I hope at least, if not, I have a few other hacks in my mind.

So as of now, I have two different code repositories for this Pankti project - `pankti` the base code, and `Pankti-Android`, the android app/frontend.

Currently, I'm mostly working on the Android frontend. UI is done, and basic functionality works fine. But I'm having problems with Save and Open File functionality, I haven't been able to find a good resource on how to make that work with Jetpack compose, and now will all that mess of Scoped Storage, App specific storage, Media Storage, I'm getting more and more confused.

Yesterday, I fixed the issue where if you execute/run code in the Editor and switch to Result view and switch back to the editor, your code will be gone. With Cache storage, I was able to fix that easily.

I wanted to design the system in such a way that the temporary file created by the Editor would be available to the user via a fixed location on storage such as maybe a directory but guides on the internet seem to discourage that functionality as this would require *Manage all files* permission. The only feasible alternative to this seems Scoped Storage.

---

Readers might be wondering why suddenly I became very consistent in writing blog posts here, the reason is I read Simon Willison’s post [What to blog about](https://simonwillison.net/2022/Nov/6/what-to-blog-about/) and decided to follow their suggestion.
