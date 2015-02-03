---
layout: post
title: Information Theory, Inference, and Learning Algorithms in J - Ensembles
---

Unlike in the [previous post](/2015/01/28/mackay03-in-j-bigrams/) on 27x27
letter bigrams where we made a joint probability matrix by counting, ensembles
are usually defined by a set of conditional and marginal probabilities.  To get
an intuition for this, let's write out the simple example given in Example 2.3,
p. 25 in J.  But first, let's give a definition for what an ensemble actually
is.

An **ensemble X** is a triple $(x,A_x,P_x)$ where *x* is an outcome taking on
values from $A_x = \\{a_1, ..., a_I\\}$, with associated probabilities
$P_x = \\{p_1, ..., p_I\\}$

A **joint ensemble XY** is an ensemble where each outcome is an order pair
*(x,y)* (also written *xy*), where $x \in A_x = \\{a_1,...,a_I\\}$, $y \in A_y = \\{b_1,...,b_J\\}$, 
and $P(x,y)$ is called the joint probability of *x* and *y*.

[(Mackay 03)](http://www.inference.phy.cam.ac.uk/mackay/itila/)


Now let's get to the example:

Jo wakes up not feeling well and the doctor orders a test for a
disease.  The test is 95% reliable, and 1% of Jo's age and background
have the disease.  If the test is positive, what is the probability
Jo has the disease?

If we define variables *disease* and *test* as

* *disease=0* =\> Jo doesn't have the disease
* *disease=1* =\> Jo has the disease
* *test=0* =\> the test is negative for the disease
* *test=1* =\> the test is positive for the disease

then the probabilities are

* $P(test=0 \| disease=0) = 5\%$
* $P(test=1 \| disease=1) = 95\%$
* $P(disease=0) = 99\%$
* $P(disease=1) = 1\%$

To start, we represent $P(test=j|disease=i) = P_{i,j}$ as a matrix
`ptest_disease`  where rows represent *disease*  and columns represent  *test*:

       NB. Conditional probability P(test|disease)
       ]ptest_disease=: 2 2 $ 0.95 0.05 0.05 0.95
    0.95 0.05
    0.05 0.95

and the marginal probability  $P(disease=i)$  as a vector

        NB. Marginal probability P(disease)
        ]pdisease=: 0.99 0.01 
    0.99 0.01

Then we can compute the joint probability by multiplying the two,
since $P(test,disease) = P(test|disease) P(disease)$

        NB. joint P(test,disease)
        ]joint=: ptest_disease * pdisease 
    0.9405 0.0495
    0.0005 0.0095

Now that we have the joint probability, we can calculate any probability that
we are interested in.  To answer the original question, what is
$P(disease=1|test=1)$, we divide each column of `joint` by it's sum, because
$P(disease|test) =  \frac{P(disease,test)}{P(disease)}$

        NB. P(disease|test)
        ]pdisease_test=: (%"1 +/) joint
      0.999469 0.838983
    0.00053135 0.161017

and we see that  $P(disease=1\|test=1)$  is 16%.  So even though the test is
95% accurate, because it's a rare disease it's more likely the test is
giving a false positive than Jo has the disease.
