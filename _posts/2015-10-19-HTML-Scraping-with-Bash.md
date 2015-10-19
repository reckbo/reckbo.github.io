---
layout: post
title: HTML Scraping with Bash
---

Sometimes it's easier to scrape an html page using a text browser and a shell
script rather than parser methods like html-xml-utils and Python's
BeautifulSoup.  Specifically, when a page is made primarly of tables with
visible delimiters, you can use a text browser to save it as text and then
delete the extra noise with a shell script to get a delimiter separated text
file.  This is how I acquired the match and player stats from [AFL
Tables](http://afltables.com/afl/afl_index.html).  You can see my scripts and
the data tables [here](https://github.com/reckbo/aflstats).
