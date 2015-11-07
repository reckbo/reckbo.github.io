---
layout: post
title: Set Theory and Logic
---

>A way of viewing the connection between Set Theory and Logic is to say that
>the statements in Logic tell us which regions of a given Universal set are
>non-empty. With this view, one can often convert a Set Theory statement to a
>Logic one by sticking ‘x ∈’ in front of it, e.g.
>
>  $$A \bigcup B \rightarrow x \in (A \bigcup B) 
>  \leftrightarrow x \in A \lor x \in B $$
>
>
> (<http://staffhome.ecm.uwa.edu.au/~00021149/Academy/2011/boolean.pdf>)

We can represent sets as bit vectors where each bit corresponds to
an element in a universal set.  Applying to them the
logic operators $\land$, $\lor$, $\lnot$ is equivalent to applying
to their sets the set operators $\cup$, $\cap$, $^{C}$.
For example:

        U=: '123456789'  NB. universal set

        NB. logic operators
        OR=: +.
        AND=: *.

        NB. Set operators
        intersect=: e. # [
        union=: ~.@:/:~@,

        NB. functions to convert between sets and bit vectors
        tobit=: U&e.  
        toset=: #&U 

        s1=: '1234'
        s2=: '45'
        ]b1=: tobit s1
    1 1 1 1 0 0 0 0 0
        ]b2=: tobit s2
    0 0 0 1 1 0 0 0 0

        s1 union s2
    12345
        s1 intersect s2
    4
        b1 OR b2
    1 1 1 1 1 0 0 0 0
        b1 AND b2
    0 0 0 1 0 0 0 0 0
        toset b1 OR b2
    12345
        toset b1 AND b2
    4

J has a nice function called 'under' that applies a transformation to its
operands, computes the algebraic operations, then applies the transformation's
inverse to the result, so we can use it to show more directly the equivalence
of the two boolean algebras.

        toset=: #&U :. tobit   NB. set tobit as toset's inverse 
        tobit=: U&e. :. toset  NB. set toset as tobit's inverse
        under=: &.

        NB. Convert sets to bit vectors, OR/AND them, and convert back to sets
        s1 OR under tobit s2
    12345
        s1 AND under tobit s2
    4

        NB. Convert bit vectors to sets, take union/intersection, and convert back to bit vectors
        b1 union under toset b2
    1 1 1 1 1 0 0 0 0
        b1 intersect under toset b2
    0 0 0 1 0 0 0 0 0

Formally, the two algebras are said to be isomorphic.
