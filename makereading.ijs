formatline=: 3 : 0
  'author year title'=. y
  '* **',title,'**   <br>',author,' ',year
)

HDR=: 0 : 0
---
layout: page
title: Reading
---
)

Body=.LF joinstring ;  ( (a:,2&{.)@{. , <@formatline"1@:}.) each  t=.(<@:(deb each)@:('|'&cut every)@:cutLF;.1~ '_**'&E.) fread'reading.dsv'
(HDR,Body) fwrite 'reading.md'

