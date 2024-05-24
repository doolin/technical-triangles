# Technical Triangles



## Implementation notes

As noted, the work was inspired by material from
_Fundamentals of Software Architecture_. Software
design is an aspect of architecture, a short discussion
on LCOM and coupling follows.

_Loose coupling_ is widely discussed in the trade as a powerful
tool for increasing legibility of implementation by reducing
the cognitive load required for understanding. The implementation
is composed of 3 parts:

1. A set of three triangles,
2. An arrowhead definition,
3. A banner definition.

Each of these may be independently rendered without regard
to the others. The banner is coupled only in terms of option
passed in for initialization. The arrowhead is coupled by
its role as an SVG-defined marker element. 

_LCOM - Lack of Cohesion of Methods_ measures the extent of
which a class or component requires execution outside the
scope of the class or component. While the term "LCOM" is in
itself a bit clunky, the notion is useful. In this project,
all of the computation is internal to each class. Adjustments
to default parameter values are managed with optional arguments.


