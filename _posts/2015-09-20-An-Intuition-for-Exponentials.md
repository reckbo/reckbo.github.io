---
layout: post
title: An Intution for Exponentials
---

One way to see exponentials is as numbers decomposed into "infinite roots".
Look at Bernoulli's original formulation of $e$:


$$
\begin{align}
e &= \lim_{n\to \infty} (1 + \frac{1}{n})^n \\
\end{align}
$$

By abusing notation and using $dx$ to mean the equation's infitesimally small
number, we can rewrite as

$$
e = (1 + dx)^{1/dx} ,
$$

which is $e$'s decomposition into its infinite root $1+dx$, and it's easy to see why
the derivative of $e^x$ is $e^x$:

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
a &= e^{\ln a} \\
    &= (1 + dx)^{(\ln a)dx} \\
    &= (1 + (\ln a) dx)^{1/dx} \\
\end{align}
$$

The last step follows from the substitution of $n\ln a$ for $n$ in Bernoulli's
formula above.  Thus, a base $a$ number grows at a rate $\ln
a$ times $e$'s unit growth rate.

