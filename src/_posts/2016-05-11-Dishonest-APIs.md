---
layout: post
title: Dishonest APIs
---

In his post [Singletons are Pathological Liars](http://misko.hevery.com/2008/08/17/singletons-are-pathological-liars/)
Miško uses an object oriented example to make the important point that global
state makes it possible for functions to have dishonest APIs, signatures whose
arguments don't match their function's dependencies.  How does global state
make this possible? By giving functions access access information outside of
their arguments.  E.g:

    def getUser(String name):
        return globalState.getDBConnection().lookupUser(name)

Here `getUser` has a dependency on a database connection not stated
in its signature.  Without global state, you'd be forced put the dependency
into an argument: 

    def getUser(DatabaseConnection DB, String name)
        return DB.lookup(name)

This function's dependencies are exactly those declared as its arguments, and
it makes testing and understanding the code easier.

Viewed another way, any function that has access to state outside its arguments
implicitly has that state as an argument (if you're a fan of category theory
then you'll notice the functions form part of a coalgebra, the program being
one big object).  You can imagine every function having a `GlobalState s` as
its first argument, which it may or may not use.  Similarly, any method of an
object has that object's internal state as an argument (made explicit in some
languages like Python), which it may or may not use.  From this perspective,
dishonest APIs are the ones whose functions don't use the state available to
them, the state that's implicitly their dependency.

Dishonest methods violate their object's encapsulation  (see [Non-Member
Functions Improve Encapsulation](http://www.drdobbs.com/cpp/how-non-member-functions-improve-encapsu/184401197)
for a good explanation).  The cure for this is to move them out of the object,
making them static in languages like Java and C++.  Obviously you can't do this
for globally scoped functions.  Instead, you can eliminate global state and guarantee honest APIs, or
you can design for them by reducing the scope of the global state to within an
object or by following a policy of explicitly putting the state into APIs of
functions that use it. 

<br><i><b>References</b></i>

* Hevery Miško, 2008, **[Singletons are Pathological Liars](http://misko.hevery.com/2008/08/17/singletons-are-pathological-liars/)**

* Meyers, Scott 2000, **[How Non-Member Functions Improve Encapsulation](http://www.drdobbscom/cpp/how-non-member-functions-improve-encapsu/184401197)**
