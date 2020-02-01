---
layout: note
title: "Week 1 - Welcome to 61A!"
note: 1
toc: true
---

## Installing Python
- Follow the instructions over at [Lab 00](https://cs61a.org/lab/lab00/).

---

## Intro to Python
> A programming language is more than just a means for instructing a computer to perform tasks. The language also serves as a framework within which we organize our ideas about computational processes. Programs serve to communicate those ideas among the members of a programming community. Thus, programs must be written for people to read, and only incidentally for machines to execute.

We will introduce *expressions*, which are statements that Python can execute. Then, we will go over how Python executes them, and how they can be stored in *variables*. Lastly, we will discuss the `print` function.

---

## A brief aside
Generally, in 61A your assignments (labs, homework, and projects) will be given in a Python file with the extension `.py`. You can edit these files, and the Python interpreter will execute it line by line.

That being said, Python is a great introductory programming language. There are many features that make it friendly, one of which is the *Python interpreter*, which can be started with `python3 -i` (try it out in your terminal!).

Throughout 61A, you will see expressions such as
```python
>>> print("hi")
hi
```
The `>>>` represents statements executed directly in a Python interpreter (ie. not from a file), and the line after is the output we get from executing the `>>>` line.

---

## Primitive Expressions
> Primitive expressions represent the simplest building blocks that the language provides

Python defines many built in types of primitives, and the most commonly used types are `int`, `float` (floating point number), `bool` (boolean, or True/False type), `str` (string type), and other container types that we will get into later

```python
>>> 3.14 # this is a float
3.14
>>> 'hello!' # this is a string
'hello!'
>>> "double quotes!" # this is another string
'double quotes!'
```

---

## Call Expressions
Call expressions look like

```python
>>> function_name(my, arguments, here)
```

and they apply a function to an argument, and give you a result back. Later in class, we will learn how to define our own functions to create more reusable building blocks.

```python
>>> max(1, 3) # takes the max of 1 and 3
3
>>> pow(2, 3) # takes 2 to the 3rd power
8
>>> abs(-1) # returns the absolute value of -1
1
```

---

## Names / Environment
Python also allows for *assignment*, meaning that you can store values inside of *variables*.

```python
>>> a = 42
>>> a
42
>>> my_sum = a + 10
>>> my_sum
52
>>> ten = abs(-10)
>>> ten
10
```

The `=` *binds* the left *name* to the right *value* inside the current *frame of execution*. In the above case, we are executing these lines in the default *global frame*, which we can see below.

<iframe width="800" height="300" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=a%20%3D%2042%0Amy_sum%20%3D%20a%20%2B%2010%0Aten%20%3D%20abs%28-10%29&codeDivHeight=400&codeDivWidth=350&cumulative=true&curInstr=3&origin=composingprograms.js&py=3&rawInputLstJSON=%5B%5D"> </iframe>

---

## Evaluation
When Python evaluates a call expressions, it uses this order:
1. Evaluate operator and operand
2. Apply the operator to the operand.

---
{: .hr-subsection}

### Example #1: Simple Evaluation

```python
>>> abs(-10)
10
```

1. Evaluate the operator and the operand
    - Here, the operator is `abs` and the operand is `-10`.
    - Looking up `abs`, we get that it's the built-in function `abs`.
    - `-10` is a primitive, so we are good to go.
2. Apply the operator to the operand
    - We apply the built-in function `abs` to `-10`, and we get `10` as our answer.

---
{: .hr-subsection}

### Example #2: Nested Evaluation
What happens when we have nested evaluation statements? (Example taken from composingprograms)

```python
>>> mul(add(2, mul(4, 6)), add(3, 5)) # assume we have add and mul defined
208
```

When we have nested evaluation statements, Python will follow the same procedures. Let's walk through a few steps:

1. Evaluate the operator and the operand
    - The operator in the outermost statement is `mul`. This is a valid name in our current environment. Then, our operands are `add(2, mul(4, 6))` and `add(3, 5)`. Since these are not primitive expressions, we must evaluate them to get a value.
    - For `add(2, mul(4, 6))`:
        1. Evaluate the operator and operand of `add(2, mul(4, 6))`. The operator is `add` and the operands are `2` and `mul(4, 6)`. `2` is a primitive expression, so we can continue here. `mul(4, 6)` needs to be evaluated. Using the same process, we get 24.
        2. Apply the operator to the operand. Applying `add` to `2` and `24` returns `26`.
    - For `add(3, 5)`: Using the same process above, we get `8`.
2. Apply the operator to the operand. Our operator is `mul`, and our operands are `26` and `8`. Our final return value is `208`.

![Nested Evaluation](http://composingprograms.com/img/expression_tree.png)

---

## Print
Print is a function that
1. Returns `None` (nothing), and
2. Prints a value out to the terminal.

```python
>>> print("hi")
hi
>>> print(4.2)
4.2
>>> print(print("hi"))
hi
None
```

In the last example above, think about the evaluation order! (eval operator, operand, apply)

<details><summary markdown='span'>Explanation</summary>
1. Eval operator and operand of `print(print("hi"))`
    - Operator is `print`
    - Operand is `print("hi")`
        1. Eval operator and operand of `print("hi")`
	    - Operator is `print`
	    - Operand is `"hi"`
        2. Apply operator to operand. Here, `hi` is printed out to the terminal, and `None` is returned.
    - Operand is `None`
2. Apply `print` to `None`. `None` is printed out to the terminal, and `None` is returned.
</details>
