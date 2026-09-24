---
---
It is possible to specify invalid combinations of values that are syntactically allowed but don't make sense. For example:

- A 3/4 time signature with symbol="cut".
- A 2/4+3/8 time signature with symbol="single-number".

In these cases, as with all other such cases in MusicXML, the behavior of the application will be undefined. ([Issue 641](https://github.com/w3c-cg/musicxml/issues/641))
