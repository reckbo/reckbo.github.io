---
layout: post
title: I Don't Understand Your Code
---

Moseley and Marks (2006) claim the biggest source of software complexity
is state.  To understand a piece of code a programmer must mentally simulate
its execution, which requires that she consider the possible runtime states
that influence each step.  The more possible states there are, the more
scenarios she must consider, and the more uncertain she is of what actually
happens.  For example, multiplication of two constant numbers is obvious but
multiplication of two variables set and updated throughout the code is not.

We can look at this idea another way: by representing a programmer's mental
model of the code's behaviour by a probability distribution over possible
scenarios.  Initially she knows nothing and entropy is at a maximum, but after
some reasoning she begins to recognize some scenarios as impossible and others
as more or less likely.  Thus her informal reasoning about the code reduces the
entropy of her mental model and we say she has gained information.  The cost of
that information is mental energy (analagous to how lowering a physical
system's entropy costs heat energy); more state means more time spent
debugging.  This doesn't mean we should be avoiding *all* state, but it does
mean we should be avoiding *unnecessary* state.


*References*

Moseley, B & Marks, P 2006, 'Out of the Tar Pit'. [[pdf]](http://shaffner.us/cs/papers/tarpit.pdf)
