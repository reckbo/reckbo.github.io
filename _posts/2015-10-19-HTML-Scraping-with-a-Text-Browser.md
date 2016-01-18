---
layout: post
title: HTML Scraping with a Text Browser
---

Sometimes it's easier to scrape an html page by rendering it to text and using
a shell script rather than using parser methods like html-xml-utils, Python's
BeautifulSoup, or R's readHTMLTable.  When a page is made primarly of tables
with visible delimiters, you can use a text browser to save it as text and then
delete the extra noise to get a delimiter separated text file.  This is how I
acquired some of the match and player stats from [AFL Tables](http://afltables.com/afl/afl_index.html).  
