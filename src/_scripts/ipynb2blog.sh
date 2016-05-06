#!/bin/bash -eu

SCRIPT=$(readlink -m $(type -p $0))
SCRIPTDIR=$(dirname $SCRIPT)

# Input
ipynb=$1
title=$2

# temp
md=${ipynb##*/}
md=${md/.ipynb/.md}
md_files=${md/.md/}_files

# output
output=$SCRIPTDIR/../_posts/`date "+%Y-%m-%d"`-${title// /-}.md
dirImgs=$SCRIPTDIR/../public/img/$md_files

echo -e "\
---
layout: post
title: $title
---" > $output

jupyter nbconvert --to markdown $ipynb
cat $md | sed 's,```J,\{% highlight J %\},g' | sed 's,```,\{% endhighlight %\},g' >> $output
sed -i.bkup 's,png\](,png\](\{\{ site.baseurl \}\}public/img/,g' $output
[ ! -d $dirImgs ] || rm -r $dirImgs
mv $md_files $dirImgs
rm $md $output.bkup
