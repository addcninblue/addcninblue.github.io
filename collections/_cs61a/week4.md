---
layout: note
title: "Week 4 - Recursion and Tree Recursion"
note: 4
toc: true
mathjax: true
---

## Recursion
> It's kinda like magic, but once you get it, it's pretty cool.  
> -- some 61a student, probably

In essence, a _recursive function_ is a function that calls itself at some point. It's not special syntax within Python. For those who have prior experience with _mathematical induction_, it has many similarities.

---
{: .hr-subsection}

### Factorial
Let's take the example of computing a factorial, the product of all positive integers less than or equal to n. [^factorial]

A simple way to think about `factorial(n)` is as follows:
- If \\( n \leq 1 \\), then \\( n! \rightarrow 1 \\)
- Otherwise, \\( n! \rightarrow n * (n-1)! \\)

Let's transform this into Python:

```python
def factorial(n):
    if n <= 1:
        return 1
    else:
        return n * factorial(n-1)
```

Let's write this to be more Pythonic by dropping the `else` and deintenting the inner block:

```python
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n-1)
```

This example is recursive! Our _base case_ is the _simplest problem_, when `factorial(n)` is a known value. In this case, our base case is when `n <= 1`. Our recursion is a known reduction of the problem, where `factorial(n)` is the same problem as the _easier problem_ `n * factorial(n-1)`. This way, we are _reducing our problem into smaller and smaller problems until we get to a known state_.

---
{: .hr-subsection}

<details>
<summary markdown='block'>
### For Those Familiar With Induction
</summary>
Proof by induction is logically very similar to recursion.

In induction, a typical proof for a mathematical formula goes like:
1. Prove base case
1. Assume the formula holds for \\( k \\), and prove that the formula holds for \\( k+1 \\).

The proof works because:
1. For some base case, we know the formula to be true
1. For some unknown problem of size \\( k \\), we have shown the formula to be reduceable to \\( k - 1 \\).

In recursion, the thinking maps to the above concepts:
1. We want to find a base case that is a _known state_ for some function.
1. For a problem \\( k \\) with no immediately known solution, we find a reduction to a size of \\( k - 1 \\).
</details>

---

## Tree Recursion
> Recursion on trees?  
> -- the same 61a student, probably

Contrary to its name, tree recursion isn't recursion on trees. [^tree-recursion] Instead, it refers to the recursion problems that require multiple calls to a function to break down the recurrence.

---
{: .hr-subsection}

### Fibonacci
Let's take a look at the fibonacci sequence, a sequence of numbers where each number in the sequence is the sum of the two prior to it. More formally,

\\[ 
F_n =
    \begin{cases}
        1, & n = 0, 1 \\\\[1ex]
        F_{n-1} + F_{n-2},  & \text{otherwise} \\\\[2ex]
    \end{cases}
\\]

We can transform this definition into code. We have the cases
1. If `n == 0 or n == 1`, then `fibonacci(n) -> 1`
1. Otherwise, we want `fibonacci(n-1) + fibonacci(n-2)`

In code:
```python
def fibonacci(n):
    if n == 0 or n == 1:
        return 1
    return fibonacci(n-1) + fibonacci(n-2)
```

Note that the major difference between this problem and the prior factorial problem is in the recurrence: Fibonacci requires _two_ calls to fibonacci to solve, whereas factorial requires only 1. If we draw out the calls, it looks like a tree (hence the name _tree recursion_).

---

## Tips For Thinking Recursively
> Recursion finally makes sense!  
> -- the same 61a student :')

- In some cases, finding the recurrence relation will be easier. In other cases, defining the base cases will be.
- Recurrence relation:
    - Think about _what the problem is trying to calculate_, and how that can be broken down into smaller versions of the same problem. In other words, if we have some \\( f(k) \\), think about how that can be broken down to some other \\( f(k') \\), where \\( k' < k \\)
- Base cases:
    - Think about _what the smallest version of the problem is_. In the examples above, it's the smallest, _trivial_ versions of the problem. This is usually some case like \\( f(0) \\), \\( f(1) \\), or something similar.

---

## Footnotes

[^factorial]: https://en.wikipedia.org/wiki/Factorial
[^tree-recursion]: Recursion on trees (with tree recursion) _is_ a thing, and we'll be covering it later.
