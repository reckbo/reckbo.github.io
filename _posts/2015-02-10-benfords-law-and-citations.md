---
layout: post
title: Significant Digit (Benford's) Law in Publication Citations
---

I expect that any decent sized sample of a convex process will have more numbers
with a leading significant digit of 1, followed by significant digit 2, and
the least occurrence of numbers with significant digit 9, since
$f^{-1}(2) - f^{-1}(1) > f^{-1}(3) - f^{-1}(2) > ... > f^{-1}(9) - f^{-1}(8)$
for a convex function $f(t)$ and uniform distribution of $t$.  To see this in
action I thought to plot the histogram of significant digits of publication
citations, since I think it's reasonable that the more citations a paper has,
the more likely it is to be cited again.  This meets the convex criterion.  For
a roughly uniform sampling of $t$, we should collect the citations of papers
of senior researchers only (although I make one exception out of curiosity).

To get the data, I used the [Publish or Perish](http://www.harzing.com/pop.htm)
application, a Windows interface to Google Scholar, and downloaded six
csv files, one per researcher.  Here's the J code I use to plot the histograms:

    load'csv'
    load'plot'

    csvs=: {."1 fdir '*.csv'

    NB. helper functions
    readcitescol=: >@:(".each)@:}.@:({."1)@readcsv
    firstdigit=: {.@:(10&#.^:_1) "0
    freq=:#/.~
    dropzero=:}.
    normalize=: (% +/)

    NB. Make histogram for each csv
    hist=: > dropzero@:normalize@:freq@:sort@:firstdigit@:readcitescol each csvs

    NB. Define Benford distribution function
    benford=: (10&^.)@:(1 + %)

    NB. Make the plot
    key=: 'key Benford,', ','joinstring csvs  NB. the legend
    xlabel=: 'xlabel ', ": >: i.9  NB. labels 1 to 9
    title=: 'title Benford Distribution for Publication Citations'
    (';'joinstring key;xlabel;title) plot (benford >:i.9),hist


![](https://raw.githubusercontent.com/reckbo/citations-and-benfords-law/master/benford_citations_J.png)

Here's a version made using R's ggplot:
![](https://raw.githubusercontent.com/reckbo/citations-and-benfords-law/master/benford_citations_R.png)

([Code on Github](https://github.com/reckbo/citations-and-benfords-law/))

So the results match our intuition, but the next question is, why, except for
the less senior researcher Sylvain Bouix, do the distributions so closely match
the log distribution $log(1 + 1/x)$?  Here's one answer given by 
[Hill 1995](https://projecteuclid.org/euclid.ss/1177009869).

