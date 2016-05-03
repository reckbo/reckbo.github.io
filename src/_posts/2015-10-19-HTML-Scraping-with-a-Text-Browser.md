---
layout: post
title: HTML Scraping with a Text Browser
---

Sometimes it's easier to scrape web pages by rendering them to text and
processing it with a script rather than using parser methods like
html-xml-utils, Python's BeautifulSoup, or R's readHTMLTable.  This can happen
when the html elements have no distinguishing classes or id's but the web page
has clearly delimited tables, like at [AFL Tables](http://afltables.com/afl/afl_index.html).  

Here are two ways I rendered some of the [AFL Tables](http://afltables.com/afl/afl_index.html) pages to text 
using the text browsers *w3m* and *elinks*:

    w3m -dump -cols 150 -T text/html webpage.html > webpage.txt
    elinks -dump -dump-width 250 > webpage.txt < webpage.html
