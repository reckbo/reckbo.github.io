---
layout: post
title: An Intution for Exponentials
---

One way to understand exponentials is to see them as numbers decomposed into
their "infinite roots".  Look at Bernoulli's original formulation of $e$:


$$
\begin{align}
e &= \lim_{n\to \infty} (1 + \frac{1}{n})^n \\
\end{align}
$$

By abusing notation and using $dx$ to mean the equation's infitesimally small
number, we can rewrite it as

$$
e = (1 + dx)^{1/dx} ,
$$

which is $e$'s decomposition into its infinite root $1+dx$.  With this view, you
can perceive a real exponent $b$ as meaning a multiplication of $b/dx$ roots,

$$
e^b = (1 + dx)^{b/dx} ,
$$

and you can see why the derivative of $e^x$ is $e^x$:

$$
\begin{align}
\frac{d}{dx} e^x &= \frac{e^{x + dx} - e^x}{dx} \\
&= \frac{ e^x e^{dx} - e^x}{dx} \\
&= \frac{e^x (1 + dx) - e^x}{dx} \\
&= \frac{e^x dx}{dx} \\
&= e^x
\end{align}
$$

Other (non-negative) numbers can be similiarly decomposed:

$$
\begin{align}
a^b &= e^{cb} \\
    &= (1 + dx)^{cb/dx} \\
    &= (1 + cdx)^{b/dx} \\
\end{align}
$$

The last step follows from the proper formulation of $e$ above.  Thus, a base
$a$ number grows at a rate $c$ ($= \ln a$) times $e$'s unit growth rate.

