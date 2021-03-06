---
layout: post
title: A Computer Science Perspective Helps
---

The distinction between abstractions and concrete representations is not as
emphasized in mathematics as it is in computer science, making it easier to
conflate the two.  This can happen particularly when studying foundations,
where it's very tempting to view their encodings as the ultimate authority on
what mathematical objects really are.  We can avoid this trap can by keeping in
mind an object's specification, i.e. it's essential properties and how it
interacts with other objects (Wells 1995).  This helps distinguish them from
their concrete representations.  

Here are some examples of mathematical abstractions and their representations:

- Math objects are encoded as sets of sets of
... sets in Zermelo-Fraenkel set theory (e.g the Kuratowski construction of an ordered pair is $$\{\{a\}, \{a,b\}\}$$).

- Probabilistic events are modelled by sample spaces.

- An abstract vector space $V$ is represented by a concrete system of
coordinates $\phi: V \rightarrow {\bf R}^n$ for some basis of $V$.
    
- An abstract group $G$ is represented by isomorphisms on some space $X$, $\phi: G \rightarrow \hbox{Aut}(X)$. 

- The abstract number systems $N$, $Z$, $Q$, $R$, $C$ are represented by
concrete numeral systems, for example the decimal and binary numeral systems.

(Tao 2015)

<br><i><b>References</b></i>

* Wells, Charles 1995, **[Communicating Mathematics: Useful Ideas From Computer Science](http://www.cwru.edu/artsci/math/wells/pub/pdf/commath.pdf)**

* Tao, Terence 2015, **[275A, Notes 0: Foundations of probability theory](https://terrytao.wordpress.com/2015/09/29/275a-notes-0-foundations-of-probability-theory/)**
