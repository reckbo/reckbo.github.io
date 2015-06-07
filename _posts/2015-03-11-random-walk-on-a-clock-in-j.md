---
layout: post
title: Random Walk on a Clock in J
---

Inspired by John D. Cook's [blog post](http://www.johndcook.com/blog/2013/09/30/random-walk-on-a-clock/),
I wanted to see what a solution in J would look like for simulating a random walk
around a clock.

Let the first row of a state matrix be a count of how many times position *j*
has been visited, and the second row be a row of zeroes with a one marking the
current position.

        ]state=: (12#0) ,: (1,11#0)
    0 0 0 0 0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0 0 0 0 0

Define a random flip function

        flip=: _1: ^ ?&2: 
        flip''
    _1
        flip''
    1
        flip''
    1

Define a transition function that increments the position count and shifts
the current position left or right 

        next=: +/ ,: flip |. {:
        next state
    1 0 0 0 0 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0 0 0 0 0
        next next next state
    1 0 0 0 0 0 0 0 0 0 1 1
    0 0 0 0 0 0 0 0 0 1 0 0
        next^:15 state  NB. apply next 15 times
    3 2 1 1 2 2 2 1 0 0 0 1
    0 0 0 1 0 0 0 0 0 0 0 0
    
We want to run this until all positions are visited, i.e. there are no zeroes
in the first row.

        NB. returns true if list y has a zero
        notallvisited=: 0&e.
                
        NB. applies function 'next' until first row has no zeroes 
        run=: next^:(notallvisited@:{.)^:_  

        run state
    2 2 1 1 1 2 8 17 15 7 5 3
    0 0 1 0 0 0 0  0  0 0 0 0
        run items 5# ,: state  NB. run simulation 5 times
     1  1 1 1 1 4 9 9 6 5  3  1
     1  0 0 0 0 0 0 0 0 0  0  0

     8  6 3 5 5 2 1 1 1 1  1  4
     0  0 0 0 0 0 0 0 0 0  1  0

     2  1 1 1 1 1 3 4 3 2  2  2
     0  1 0 0 0 0 0 0 0 0  0  0

    15 11 5 2 1 1 5 7 4 5  8 11
     0  0 0 0 0 1 0 0 0 0  0  0

     8  5 4 3 1 1 1 2 7 9 10 10
     0  0 0 0 0 0 0 1 0 0  0  0

The number of steps taken to visit all positions is the sum of the first row.

        NB. e.g compute number of steps
        +/"1 {. run state
    24

        NB. compute number of steps for 5 simulations
        +/"1 {. items run items 5# ,: state  
    117 69 106 29 38

Now we're ready to run many simulations and compute the mean number of steps.

        mean=: +/ % #

        NB. compute the mean of 20,000 simulations
        mean +/"1 {. items run items 20000# ,: state   
    67.1326

