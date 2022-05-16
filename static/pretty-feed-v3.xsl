<?xml version="1.0" encoding="utf-8"?>
<!--

# Pretty Feed

Styles an RSS/Atom feed, making it friendly for humans viewers, and adds a link
to aboutfeeds.com for new user onboarding. See it in action:

   https://interconnected.org/home/feed


## How to use

1. Download this XML stylesheet from the following URL and host it on your own
   domain (this is a limitation of XSL in browsers):

   https://github.com/genmon/aboutfeeds/blob/main/tools/pretty-feed-v3.xsl

2. Include the XSL at the top of the RSS/Atom feed, like:

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="/PATH-TO-YOUR-STYLES/pretty-feed-v3.xsl" type="text/xsl"?>
```

3. Serve the feed with the following HTTP headers:

```
Content-Type: application/xml; charset=utf-8  # not application/rss+xml
x-content-type-options: nosniff
```

(These headers are required to style feeds for users with Safari on iOS/Mac.)



## Limitations

- Styling the feed *prevents* the browser from automatically opening a
  newsreader application. This is a trade off, but it's a benefit to new users
  who won't have a newsreader installed, and they are saved from seeing or
  downloaded obscure XML content. For existing newsreader users, they will know
  to copy-and-paste the feed URL, and they get the benefit of an in-browser feed
  preview.
- Feed styling, for all browsers, is only available to site owners who control
  their own platform. The need to add both XML and HTTP headers makes this a
  limited solution.


## Credits

pretty-feed is based on work by lepture.com:

   https://lepture.com/en/2019/rss-style-with-xsl

This current version is maintained by aboutfeeds.com:

   https://github.com/genmon/aboutfeeds


## Feedback

This file is in BETA. Please test and contribute to the discussion:

     https://github.com/genmon/aboutfeeds/issues/8



-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/> - Feed preview</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <style type="text/css">
          
    * {
        box-sizing: border-box;
    }
    img {
        max-width: 100%;
    }
    body {
        margin: 0;
        font-family: -apple-system,BlinkMacSystemFont,segoe ui,Roboto,Oxygen,Ubuntu,Cantarell,open sans,helvetica neue,sans-serif;
        line-height: 1.7;
        padding-bottom: 20px;
    }

    h3 {
        padding-bottom: 0;
    }

    .feed-item{
            line-height: 0.5;
            margin-bottom: 10px;
            padding: 5px;
            }

    .publish-date {
        color: blue;
    }

    .container {
        display: grid;
        gap: var(--gap);
        max-width: 46rem;
        width: 95%;
        margin: auto;
    }
    .intro {
        background-color: #c3f7c3;
        margin-block-end: var(--gap);
        padding-block: calc(var(--gap) / 2);
    }
    .intro .container {
        gap: 1rem;
        grid-template-columns: 4fr 2fr;
        align-items: top;
    }
    @media (min-width: 40rem) {
        .intro .container {
            grid-template-columns: 4fr 1fr;
            align-items: center;
        }
    }
    .recent {
        padding-block-end: var(--gap);
    }
        </style>
      </head>
      <body>
        <nav class="intro">
          <div class="container">
            <div>
              <p><strong>Yippe you found my RSS feed!</strong> Please <strong>Subscribe</strong> by copy-pasting the URL into your RSS feed reader.</p>
              <small>
                Visit <a href="https://aboutfeeds.com">About Feeds</a> to get started with newsreaders and subscribing. It's free.
              </small>
              <p></p>
              <small>
                  Heavily inspired from <a href="https://daverupert.com/atom.xml">Dave Rupert</a>'s RSS feed styling.
              </small>
            </div>
            <!-- Image from : https://giphy.com/stickers/transparent-happy-jeong5mog-ifXWIrbONpgB5B6n5m -->
            <img src="/images/for-rss-feed.gif" alt="yOU foUnd mE" />
          </div>
        </nav>
        <div class="container">
          <header>
            <h1><xsl:value-of select="/rss/channel/title"/></h1>
            <p><xsl:value-of select="/rss/channel/description"/></p>
            <a class="head_link">
              <xsl:attribute name="href">
                <xsl:value-of select="/rss/channel/link"/>
              </xsl:attribute>
              Back to Website &#x2192;
            </a>
          </header>
          <section class="recent">
            <h2>Recent entries</h2>
            <xsl:for-each select="/rss/channel/item">
              <div class="feed-item">
                <h3> *
                  <a target="_blank">
                    <xsl:attribute name="href">
                      <xsl:value-of select="link"/>
                    </xsl:attribute>
                    <xsl:value-of select="title"/>
                  </a>
                </h3>
                <small class="publish-date">
                  Published: <xsl:value-of select="pubDate" />
                </small>
              </div>
            </xsl:for-each>
          </section>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

