+++
date = 2022-12-09
description = "Development log of Pankti Programming Language and some other updates"
images = ["https://b.og.palashbauri.in/api/og?date=2022-12-09T15%3A57%3A00.00Z&title=Status%20Update%204&gh=bauripalash&blog=Adventure%20of%20Palash%20Bauri"]
kws = ["status", "programming", "life", "pankti" , "exams" , "westbengal"]
lastmod = 2022-12-09
nocomment = false
noshare = false
noshowlastmod = false
tags = ["devlog", "status"]
title = "Status Update #4"
draft = false
+++


## Personal Updates

I haven't been able to write here for about a month. My final exams for my Diploma in Elementary Education started on November 28th and ended on the 30th. So I had to study a little bit to not fail, and TET[^1] exam is on 11th December, again studying a little bit 🙃.


## Devlog - Pankti

Pankti Programming language now has basic wasm support and a new mascot.

WASM support was relatively easy to implement thanks to Go's built-in Wasm support. But the mechanism I developed to catch the `Stdout` uses [`os.Pipe`](https://pkg.go.dev/os#Pipe) internally which was not available on the WASM backend, so I had to use a hack to capture all `console.log` and redirect them to the output `textarea`. I am well aware that this is not an ideal solution at all. I have a few solutions in mind with a less hacky approach and I'll be trying to use them but for now, it works and I don't want to spend more time with this wasm thing right now.

My final exams just ended and the **Big** exam is coming on December 11th, so I have to prepare for that.

Here are some updates on the Pankti project:

* The android app is now available on Play Store: <https://play.google.com/store/apps/details?id=in.palashbauri.panktimob>
* Windows binaries don't get flagged as malware anymore.
* Pankti now has its own webpage at <https://pankti.palashbauri.in>
* Windows binaries will now have icons and version informations thanks to goversioninfo.


## Little Extra:

I now have a vanity URL at <https://go.cs.palashbauri.in> for go modules, the site is built using Zola static site generator. The source code is available here [bauripalash/gomodvanity](https://github.com/bauripalash/gomodvanity/).

I got another project idea while working on that project. Pages can be redirected using a basic HTML tag 

```html
<meta http-equiv="Refresh" content="0; url='https://example.com'" />
```

Now with that `technology`, I can create a URL shortener. So I created a project called [staticurl](https://github.com/bauripalash/staticurl)

The whole project is in a single file [main.go](https://github.com/bauripalash/staticurl/blob/main/main.go) which has 243 lines (181 sloc). To create a new short URL you just have to create a file in the `urls` directory.
The name of the file will be the short URL and the first line inside that file will be the long URL.

For example, if we create a file named `pb` in urls directory and write `https://palashbauri.in` to the first line of the file, then if we visit `https://short.domain/pb`, we will be redirected to `https://palashbauri.in`.

The heart of the project is this file `template.html`:

```html
<!DOCTYPE html>
<html>
  <head>
	  <meta http-equiv="refresh" content="0; url='{{.Url}}'" />
  </head>
  <body>
	  <p>Redirecting you to <a href="{{.Url}}">{{.Url}}</a>; If you are not redirected within 5 seconds please click the link!</p>
	  <small>Made with <a href="https://github.com/bauripalash/staticurl">staticurl</a></small>
  </body>
</html>

```

## Another update:

I ~~am going to rewrite~~ rewrote this site from scratch. At first, I wanted to use the **Zola** static site generator but it has some limitations which would have made the development of this project very hard that's why I used `hugo` again. Check out the source code here: <https://gitlab.com/bauripalash/bauripalash.gitlab.io/>.

---
[^1]: Learn more about the current status of Teacher Recruitment and TET exams in West Bengal here : [Chaos In Bengal](https://palashbauri.in/chaos-in-bengal/)
