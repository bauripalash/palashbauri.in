+++
date = 2026-01-13
description = "Year 2026: Year in Review 2025"
images = ["https://b.og.palashbauri.in/api/og?title=Year%202026%3A%20Year%20in%20Review%202025&blog=Adventure%20of%20Palash%20Bauri&date=2026-01-13T13%3A38%3A42.292Z&gh=bauripalash"]
kws = ["review", "programming" ,"life", "devlog", "new-year", "opinion"]
lastmod = 2026-01-13
showtoc = false
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["life"]
title = "Year 2026: Year in Review 2025"
+++

2025 has been a difficult year for me; it is safe to say that it has been the most difficult year of my whole life. I dislike writing about my personal life on the internet, so I didn't write anything on this blog for a whole year. Even if I tried hard, some feelings will make their way into my writings. In this life, things sometimes don't go as you intended, but still you have live, you have march forward. You gotta do what you gotta do.

Anyway, let's go forward. Here are some summaries of what I did last year. The things mentioned here were completed in the last few months of 2025.

# BauriPixel

I was struggling with life; I had no motivation to do anything, just living like a machine. Every day, I open my laptop, read some top stories from Hacker News, and go to sleep. I was living like this for a certain period of time in 2025. Here and there, I made some pixel art. I usually use Aseprite for pixel art. I always build it from source, thanks to AUR.

I adore [Aseprite's](https://www.aseprite.org/) whole pixel-art-themed appearance. Other pixel art tools like [Pixelorama](https://pixelorama.org/) and [Gale](https://graphicsgale.com/us/) had a look and feel of bit too general-purpose. I understand every software has its own vision and roadmap. I was surprised to know that Pixelorama is built using the [Godot](https://godotengine.org/) game engine. Game Engines being used to build a general purpose software was quite surprising to me. My curious self looked into how Aseprite was built. Thanks to it's [source code](https://github.com/aseprite/aseprite/) being open, I looked into it. The most fascinating thing was it's algorithms. I used to believe that pixel art tools must be using some state of the art, hifi sci-fi technologies, for things like circles, rectangles, bucket fillings etc. Surprisingly it is just plain ol' math. Aseprite and Pixelorama were using almost identical algorithms for drawings. I looked into it, and it all came down to [Bresenham's Algorithm(s)](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm) and [Alois Zingl's interpretation](https://zingl.github.io/bresenham.html) of them. They were fun. But I had nothing to do with those. So I just forgot about those.

Fast forward a few weeks. When cleaning some old boxes, I found an ESP32 Microcontroller board lying around in a box full of sensors, displays, and wires. I bought them who knows when, I connected the board to my laptop, and it still had a MicroPython script uploaded to it. It was drawing a circle pixel by pixel with a few nanoseconds of delay; it looked fun. I tinkered around with the script a little and made it write out my name in animation, drawing each letter pixel by pixel. Each letter was encoded into a single number, and when the number is converted to binary, it would look something like this, if each byte is separated.

```

00000000
01111100
01000100
01000100
01111100
01000000
01000000
01000000

```

Can you see the letter? What if I replace the 0s with dots and 1s with `o`s

```

........
.ooooo..
.o...o..
.o...o..
.ooooo..
.o......
.o......
.o......

```

See, the whole letter's image is stored in a single number; it's kinda fun. Well, I didn't invent anything new; there were pre-existing fonts in this format. MicroPython itself included a font that follows a similar pattern.

But I would've been nice if I had a nice interface to design these types of fonts. Like a well-behaved programmer, I thought What if I made a GUI program for designing this type of font? It would be fun. I looked into a few GUI Frameworks which were lightweight and easy to use. I needed some very basic functions, an 8x8 grid of buttons, and a list view to display the created letters. When I click on the list view items, the buttons should change colors depending on their `bit` value, either white (0) or black (1). Let me tell you, my friend, GUI Framework/libraries are not easy. They are complicated. Tneed a massive dependency chain, and sometimes look plain ugly and janky.

Signals, Layouts - Column, Row, Horizontal Box, Vertical Box, Callbacks, and whatnot made it really not want to make a GUI program, I thought, Yeah, whatever, I would simply make a TUI Program, it is way more fun and easy.

But then it hit me! I can make a GUI app with game engines. I tried with Godot, but I couldn't get the style look just right for me. While I was looking for a lightweight GUI library that is easy to build on both Linux and Windows, I stumbled upon [Raygui](https://github.com/raysan5/raygui), a raylib-related project. It was super simple, no complex layouting, no complex signals or callbacks. I quickly made a prototype with Raygui and [Raylib](https://www.raylib.com/), and I really liked it; all the features I needed were completed within 2 days. I had some previous experience with Raylib for some simple graphical toy programs, but I never knew programming in C could be so much fun. Sometimes I even forgot I was writing a C program. Plus, some nice external libraries like [stb's](https://github.com/nothings/stb) `ds` library, and the [gb_string](https://github.com/gingerBill/gb) library made the whole process much smoother. The Journey was fun, I simply made what I needed. I named it BauriGlyphMaker.

![BauriGlyphMaker Screenshot](https://raw.githubusercontent.com/bauripalash/bauriglyphmaker/refs/heads/main/assets/screenshot_1.png)

Look at the screenshot above, doesn't it remind you of something, for example, a pixel art editor? Well, somehow I ended up making a monochrome, barebones pixel art editor program. Well, one thing led to another, the next thing I knew, I started writing a full-fledged pixel art editor following a similar internal pattern to BauriGlyphMaker. It took about a month, and I was able to build a fully working pixel art editor, well, some things like importing/exporting to spritesheet, undo/redo were still missing, but it was a working prototype. I named it [BauriPixel](https://github.com/bauripalash/bauripixel), well, first I thought I would name it BauriPixelMaker, similar to BauriGlyphMaker, but the name was already too long.

It has layers with opacity, animations with custom times for each frame, pixel-perfect drawing tools, pencil, circle, rectangle, bucket fill, and all the basic tools you would need.

![](https://raw.githubusercontent.com/bauripalash/bauripixel/main/assets/extras/banner.png)

After my exams are finished, I will keep working on it and make it a fully featured pixel art tool.

# Pankti Programming Language

If you follow my blog, you must have heard the name of Pankti. It is a programming language that lets you write programs in Bengali, Bengali Phonetic with English letters, and plain English. Frustrated with the pre-existing Bengali programming language's toy-like look and feel, I decided to write my own programming language for the Bengali Language. Iteration after iteration, I reached the current state of Pankti Programming Language, with a simple syntax structure and powerful and practical features. The current Implementation is written in Zig, the VM, Compiler, Standard Library and everything.

But Zig's current unstable status has been a real pain; every now and then, the interpreter breaks. Which is really frustrating, yes, you can say stick with a Zig stable version. But I prefer to always be on the latest stable version of any tool I use. You stumble upon a problem, you look for a solution for hours, only to find that there was a bug in the tool itself, which was fixed like 2 releases ago.

Don't get me wrong, Zig is a cool project, I have been using it for a long time for many of my personal projects, other than the pankti interpreter. But some things bother me about Zig.

#### Jump Scaring Breaking Changes: 

I understand that Zig is a new language and breaking changes are inevitable and sometimes necessary.

I would've been really happy if the Zig team did a blog post or something similar explaining the upcoming huge changes in the whole read/write system. The Odin team did a nice explanatory post explaining and announcing upcoming breaking changes for their `core:os` module. I wished the Zig team had done a similar thing.

#### Monkey Fiasco: 

In the post Migrating from GitHub to Codeberg published on November 26th of 2025, Andrew Kelly (creator of zig) explained why are they moving away from github to codeberg, but in that post he called people from Github team monkeys, If It was a personal post in personal space I never would've blinked an eye about that, I don't care what you do or say in your personal life or space. But when you represent a greater platform and people other than yourself, you must be mindful about what you say and express, because at zig blog, you're not writing for yourself; you're the voice of the whole zig ecosystem. You can't say stuff like that; that's not nice at all.

Well, I heard somewhere that he apologized or something. We are all human here, and humans make mistakes. I just hope he will be mindful of his wording on the official Zig blog in the future.

#### Too much verbosity: 

I like verbosity; I like my code to clearly convey what I think. Zig is verbose, really verbose, sometimes too verbose, so verbose that I didn't want to write another single line of code.

I got frustrated. I rewrote Pankti Interpreter from scratch in C (yet another time). This time, I used external libraries, which I learned how to use from the experience with BauriPixel, such as stb_ds and gbstring. I also took some functions directly from raylib's source code (of course, with proper attributions). I was really inspired by Raylib's clean code style, so I followed as far as I could.

![](https://media1.tenor.com/m/r6vQcASomzoAAAAd/malloc-malevolent-shrine.gif)


The previous iteration of C-Based Pankti Interpreter was using Wide Characters and UTF-16 for texts, but this time I created my own UTF-8 codepoint Iterator, and I am really proud of it. Now Pankti uses UTF-8 for internal representation and exposes api for grapheme and codepoint-based string indexing with the help of the suckless libgrapheme library.

Overall, I am quite satisfied with the current iteration. I kept the code real simple and well commented with both WHAT and WHY. But I made some significant changes from the zig variant. Now the interpreter uses double pass with separate parsing and compiling (emitting bytecode) steps. This made the code much cleaner. I added quite a lot of utility functions to remove code repetitions.

With the Zig latest versions, the official minimum Windows version supported was Windows 10 or above, but this time, Pankti will at minimum support Windows 7, and it should also run fine with Windows XP, but I haven't had the chance to properly test it on XP. I should write a separate post explaining why Windows 7 support is important for this project.

I hope my endeavors will be successful and beneficial to many people. I really, really, really hope 2026 will be a good year free from pain and suffering.

Note: When I am editing this post, I am having a terrible stomach pain. So far, so good about the "free from pain" thing.

Thank you.

Palash Bauri
