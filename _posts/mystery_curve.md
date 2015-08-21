3 : 0
NB.* stepsftn: vector of numbers from num, to num, in numsteps steps.
   'from to numsteps'=. y
   from+(to-from)*(numsteps-1)%~i.numsteps
)
curve=: 3 : '(^0 j. y) - (1r2 * ^6* 0 j. y) + 1r3 * 0 j. ^_14 * 0 j. y'
   plot curve steps 0 , (o.2), 100000
