---
layout: post
title: Representing Sets
---

Set operations in material set theories are defined in terms
of the membership predicate ∈, e.g.

$$A  \cup B := \{ x: x \in A \text{  or  } x \in B\}.$$

Typically sets are represented as lists of unique elements, e.g. {1,2,3},
which together with the set operations define an algebra of lists.  But sets
can also be represented as bit vectors (indicator functions) where each bit
corresponds to an element of a universal set.  Set operations are then carried
out by the logic operators $\land$, $\lor$, and $\lnot$.  Here is an example
in J.

{% highlight J %}
    U=: '123456789'  NB. universal set

    intersect=: e. # [  NB. set intersection
    union=: ~.@:/:~@,   NB. set union
    tobit=: U&e.        NB. Convert set to bit vector
    toset=: #&U         NB. Convert bit vector to set

    setA=: '1234'
    setB=: '45'
    b1=: tobit setA
    b2=: tobit setB

    setA union setB
12345
    setA intersect setB
4
    b1 OR b2
1 1 1 1 1 0 0 0 0
    b1 AND b2
0 0 0 1 0 0 0 0 0
    toset b1 OR b2
12345
    toset b1 AND b2
4
{% endhighlight %}

J has a nice function called _under_ that applies a transformation to its
operands before computing the given algebraic operations, and then applies the
transformation's inverse to the result.  We can use it to show the equivalence
of the two algebras.

{% highlight J %}
    toset=: #&U :. tobit   NB. set tobit as toset's inverse 
    tobit=: U&e. :. toset  NB. set toset as tobit's inverse
    under=: &.

    NB. Convert sets to bit vectors, OR/AND them, and convert back to sets
    setA (OR under tobit) setB
12345
    setA (AND under tobit) setB
4

    NB. Convert bit vectors to sets, take union/intersection, convert back 
    b1 (union under toset) b2
1 1 1 1 1 0 0 0 0
    b1 (intersect under toset) b2
0 0 0 1 0 0 0 0 0
{% endhighlight %}

The algebras are boolean and because of their one-to-one mapping (if all sets are
restricted to be subsets of $U$) they are said to be isomorphic.
