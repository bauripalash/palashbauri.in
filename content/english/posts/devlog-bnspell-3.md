+++
date = 2022-12-23
description = "Some ideas on developing a spell checking system for Bengali Language"
images = ["https://b.og.palashbauri.in/api/og?title=Devlog%20%233%20-%20Bengali%20Spell%20Check&blog=Adventure%20of%20Palash%20Bauri&date=2022-12-23T03:16:11.693Z&gh=bauripalash"]
kws = ["Programming", "ideas", "india", "spell-check", "bengali"]
lastmod = 2022-12-23
showtoc = true
nocomment = false
noshare = false
showbread = true
noshowlastmod = false
tags = ["devlog", "bengali"]
title = "Devlog #3 - Bengali spell check"
+++

According to the latest statistics, Bengali (my mother tongue) is the 7th most spoken language in the entire world, yet in this digitized modern world there exist very few programs for correcting spelling mistakes in this aforementioned language. There has been done some research in this field such as this paper **A Bangla Phonetic Encoding for Better Spelling Suggestions**[^1] yet somehow there is little to no development in this area.

So I thought, why not give it a try myself? I have the resources and also have the correct level of skills to work on this (in my opinion)

I have some basic ideas💡 about this project,

The first layer of matching on the input will be done against the word list from the West Bengal **Akademi Banan Abhidhan** (A book that contains all the modern and correct spelling of Bengali words). The second layer of scanning will be done via whole dictionary matching.

From these word list-based approaches, only non-complex individual disconnected words with clearly visible spelling errors can be caught. 

Those who know about the Bengali Language or Bengali script, as a matter of fact, know well enough that it is a very complex language and throughout the years it has absorbed some traits and words from other languages mostly from Sanskrit, English, Hindi and more, thus making the job of spell checking a very hard job.

But but but, if you read the Akademi Banan Abhidhan book which mentions rules of correct spelling, you'll find out that rules of correct spelling are not that difficult, with simple `peek()` and `back_peek()` we can determine and fix spelling mistakes. 

I am thinking I will start working on this project, but I am not sure when 😬




---
[^1]: <http://dspace.bracu.ac.bd/xmlui/handle/10361/310>