# Technical Triangles

In Chapter 2 of Richards & Ford [Fundamentals of Software Architecture](https://www.goodreads.com/book/show/44144493-fundamentals-of-software-architecture) the authors present an interesting characterization of technical knowledge encoding Rumsfeld's notions of what is and is not known.

![Technical triangle](images/sswe.svg)


## Implementation notes

As noted, the work was inspired by material from Chapter 2 of _Fundamentals of Software Architecture_.

### Parameterization

This project was instigation by a confluence of factors, including:

1. desire to create an interesting talk
2. frustration using visual drawing tools (Inkscape) to create exactly what I wanted to see
3. An intermittent interest in SVG dating back at least 20 years

These factors were sufficient to inspire a scripting solution, to at least provide a workable base file which could be touched up or further modified by Inkscape or similar tools.

There are two types of parameters:

1. structural, which control the shape and relative thickness of layers, and
2. style which manages everything else.



### Component design

Software design is an aspect of architecture, a short discussion
on LCOM and coupling follows.

**Loose coupling** is widely discussed in the trade as a powerful
tool for increasing legibility of implementation by reducing
the cognitive load required for understanding. The implementation
is composed of 3 parts:

1. A set of three triangles superimposed one on another,
2. An arrowhead definition,
3. A banner definition.

Each of these may be independently rendered without regard
to the others. The banner is coupled only in terms of option
passed in for initialization. The arrowhead is coupled by
its role as an SVG-defined marker element. 

**LCOM - Lack of Cohesion of Methods** measures the extent of
which a class or component requires execution outside the
scope of the class or component. While the term "LCOM" is in
itself a bit clunky, the notion is useful. In this project,
all of the computation is internal to each class. Adjustments
to default parameter values are managed with optional arguments.


### Testability

It may seem stupid or overtested, but having known good output to test
against has saved time particularly when refactoring for extension.