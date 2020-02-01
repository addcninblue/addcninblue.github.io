---
layout: note
title: "Week 2 - A Deeper Dive Into Python"
note: 2
toc: true
---

## Control
So far, we've learned to execute statements sequentially:

```python
>>> fahrenheit = 65 # Temperature outside
>>> celcius = (fahrenheit - 32) * 5 / 9
>>> celcius
18.333333333333332
```

What happens when we want to execute a statement *conditionally*? For example, what if we only want to print the temperature when it's hotter than 70 degrees outside?

Luckily, Python has a feature for that:

```python
>>> fahrenheit = 75 # Temperature outside
>>> if fahrenheit > 70:
...     print('HOT')
HOT
```

In general, this syntax looks like:

```python
if <condition>:
    some_code_here
elif <other condition>:
    some_other_code
elif <other condition>:
    some_other_code
...
else:
    some_other_code
```

---
{: .hr-subsection}

### Example #1: FizzBuzz

Let's try to work through a modified version of the common problem Fizzbuzz:
- Given some number `n`,
    - If a number is divisible by 3, print `Fizz`
    - If a number is divisible by 5, print `Buzz`
    - If a number is divisible by both 3 and 5, print `FizzBuzz`

#### A common (but slightly wrong) solution
Translating the problem description directly into code, we get:

```python
if n % 3 == 0:
    print("Fizz")
elif n % 5 == 0:
    print("Buzz")
elif n % 15 == 0:
    print("FizzBuzz")
```
Can you spot the error above? Hint: Think about what happens when `n` is 15.

<details>
<summary markdown='block'>
#### The correct approach
</summary>

```python
if n % 15 == 0:
    print("FizzBuzz")
elif n % 3 == 0:
    print("Fizz")
elif n % 5 == 0:
    print("Buzz")
```

We need to check 15 first before checking 3 or 5! To elucidate this, let's consider the case of `n = 15`. In the original solution, we would hit the first case of `n % 3 == 0`, since `n` is divisible by 3. Because of this, we would never hit the `15` case. To fix this, we put *the most restrictive* case first. This ensures that we will always hit the 15 case before we hit any others.
</details>

---

## Iteration
> Iteration is the repetition of a process in order to generate a sequence of outcomes  
> -- Wikipedia

Suppose we're now tasked with computing the Celcius equivalents of a range of temperatures in Fahrenheit. Of course, we could just copy our code from earlier for each temperature. However, as CS majors, we're lazy, so we go hunting for a better way.

In Python, there are two keywords that help us with this: `while` and `for`. Specifically, these two keywords help with the task of *iteration*.

---
{: .hr-subsection}

### For loops
For loops take the following form:

```python
for <variable> in <iterable>:
    <suite>
```

Python will loop through all variables in an *iterable* (something we'll get into much later in the course) until the values in the iterable are exhausted. Each time Python loops through, it will assign values sequentially to the variable from the iterable and execute the suite. For now, don't worry about these technical terms.

---
{: .hr-subsection}

### While loops

```python
while <expression>:
    <suite>
```

Python will continue executing the suite until the expression is `False`.

Here is a good way to visualize it:
1. What is the truthiness of `<expression>`?
    - `True`: Execute `<suite>` and go back to (1.)
    - `False`: Quit the loop.

---
{: .hr-subsection}

### For loops? While loops? Choosing one over the other.
You'll notice that `while` and `for` loops look very similar. How would we choose one over another, and what benefits do they give?

The general explanation is that there is a very clear answer which is better. Generally speaking, `for` loops are used for a fixed-length sequence whose length is already known, whereas `while` loops are used for a sequence whose length we don't know.

For example:
- Square all numbers from 1 to 10 &rarr; `for` loop, since we know the sequence.
- Find the seventh prime number &rarr; `while` loop, since we don't know how many integers we will need.

<details><summary markdown='span'>Is it necessary to have two kinds of loops?[^out-of-scope]</summary>
Given that the two loops are so similar, a question might naturally arise: Are both kinds of loops necessary? Well, it turns out that some programming languages decided that, no, it's definitely unnecessary. Google's [Go](https://golang.org/) is a good example of this.
</details>

---
{: .hr-subsection}

### Example: Range of Temperatures

Let's go back to the example and print a range of temperatures in Celcius from Fahrenheit.

Hint: `range(begin, end)` is a Python built-in that returns an iterable that will give you all integers between `begin` and `end`, *including* begin and *excluding* end. It is the mathematical equivalent of `[begin, end)`.

```python
# Let's find the celcius representations of fahrenheit 70~74
>>> for fahrenheit in range(70, 75):
...     celcius = (fahrenheit - 32) * 5 / 9
...     print(celcius)
21.11111111111111
21.666666666666668
22.22222222222222
22.77777777777778
23.333333333333332
```

Of course, this can be done with a `while` loop as well:
```python
# Let's find the celcius representations of fahrenheit 70~74
>>> fahrenheit = 70
>>> while fahrenheit < 75:
...     celcius = (fahrenheit - 32) * 5 / 9
...     print(celcius)
...     fahrenheit += 1
21.11111111111111
21.666666666666668
22.22222222222222
22.77777777777778
23.333333333333332
```

<details>
<summary markdown='block'>
#### An aside: Why does `range` use `[begin, end)`?
</summary>
Doesn't this default sound insane? [^out-of-scope]

It turns out, it's not as insane as it sounds. A handy outcome is that you can easily compute the number of elements by simply doing `end - begin`. Furthermore, `range` provides defaults as a one-argument function, where calling it with one argument would set the end, implicitly setting `begin` to 0. For example, `range(10)` would give all elements `[0, 10)`.

For those of you coming in with prior programming experience, this is equivalent to C-like languages' for loop:
```c
for (int i = begin; i < end; i++) {
...
}
```
</details>

---

## Defining New Functions
Let's put everything we've learned all together with a more motivating example. In the previous code we wrote for computing Fahrenheit from Celcius. Suppose instead we now want to compute this temperature from anywhere, without needing to copy over all our code again. This motivates the need for a `function`.

A function can be thought of as a reusable piece of code with a certain number of inputs and an output (return value). We've seen examples of functions already (`min`, `max`, `abs`, to name a few). Now, we will be learning to define our own.

The syntax is as follows:
```
def <name>(<formal parameters>):
    <function body>
    return <return expression>
```

Note: In Python, the `return` statement is optional. If it is omitted, the return value will be set to `None` (which is Python's null type).

Here is an example of a custom definition of `min`:

```python
def min(x, y):
    if x < y:
        return x
    else:
        return y
```

---
{: .hr-subsection}

### Redefining Fahrenheit to Celcius as a Function
With this, we can now redefine our Fahrenheit to Celcius function.
```python
def f_to_c(fahrenheit):
    celcius = (fahrenheit - 32) * 5 / 9
    return celcius
```

and we can simplify our earlier approach to printing all Celcius temperatures in a loop:

```python
>>> for fahrenheit in range(70, 75):
...     print(f_to_c(fahrenheit))
21.11111111111111
21.666666666666668
22.22222222222222
22.77777777777778
23.333333333333332
```

---

## Higher Order Functions
Now that we're familiar with the idea of a function that returns a value, we can extend this to functions returning *other functions*.

A motivating example: Suppose we want to create a function that returns an *incrementer*.

```python
def add_by(number):
    """
    Returns a one-argument function that returns `number + argument`
    """
    def new_incrementer(x):
        return number + x
    return new_incrementer
```

This allows us to do this:

```python
>>> add_by_one = add_by(1)
>>> add_by_one(5)
6
>>> add_by_ten = add_by(10)
>>> add_by_ten(5)
15
```

---

## Lambda Functions
Lambda functions, or _anonymous functions_, are one-liner functions that are defined without a name. This syntax looks like:

```python
lambda <formal parameters>: <lambda body>
```

In normal functions, note that we use `return` to indicate a value to be returned. Since lambda functions are written in one line, the last value evaluated is implicitly returned. An example is given below.

---
{: .hr-subsection}

### Revisiting Fahrenheit to Celcius
Let's make a lambda function called `f_to_c_lambda` that returns the Celcius temperature of some temperature in Fahrenheit:

```python
>>> f_to_c_lambda = lambda fahrenheit: (fahrenheit - 32) * 5 / 9
```

This allows to use the same loop from before:

```python
>>> for fahrenheit in range(70, 75):
...     print(f_to_c_lambda(fahrenheit))
21.11111111111111
21.666666666666668
22.22222222222222
22.77777777777778
23.333333333333332
```

---
{: .hr-subsection}

### Functions? Lambdas? Choosing one over the other.
In general, lambdas are used when a simple calculation is needed (ie. a one-liner). This will arise in places such as `min`, which accepts a list and an optional `key` value:

```python
>>> my_list = ["apple", "bear", "carrot"]
>>> min(my_list) # default is alphabetical
'apple'
>>> length = lambda x: len(x)
>>> min(my_list, key=length) # now we use the lambda function we just defined
'bear'
>>> min(my_list, key=lambda x: len(x)) # we can also write this in one line
'bear'
>>> # Of course, we don't need a lambda function for this:
>>> min(my_list, key=len) # len works as well
'bear'
```

---

## The Environment
> Our subset of Python is now complex enough that the meaning of programs is non-obvious. What if a formal parameter has the same name as a built-in function? Can two functions share names without confusion? To resolve such questions, we must describe environments in more detail.  
> -- Composing Programs

We briefly introduced the topic of *environments* in Week 1. They're a good way of showing the execution of a Python program, and it makes execution mechanical by assigning rules. Before we jump into execution, let's define a few terms. Composing Programs has a concise explanation of these terms:
> An environment in which an expression is evaluated consists of a sequence of **frames**, depicted as boxes. Each frame contains **bindings**, each of which associates a name with its corresponding value. There is a single **global** frame. Assignment and import statements add entries to the first frame of the current environment.

Now, we can look at execution:
1. When a Python program is started, a global frame is created.
1. When there is an assignment statement, a _name_ is bound to a _value_.
1. When there is a function definition, the name of the function is bound to the same name in the frame.

    Putting this all together, we get something like this:
    <iframe width="800" height="270" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=fahrenheit%20%3D%2080%0Af_to_c_lambda%20%3D%20lambda%20fahrenheit%3A%20%28fahrenheit%20-%2032%29%20*%205%20/%209&codeDivHeight=400&codeDivWidth=350&cumulative=true&curInstr=0&origin=composingprograms.js&py=3&rawInputLstJSON=%5B%5D"> </iframe>

---
{: .hr-subsection}

### Calling User-Defined Functions

Calling functions take on the form of:
```python
<name of function>(<arguments of function)
```

In Python, this is the way this is evaluated (as explored in [note 1](./week1))
1. First, we evaluate the operator in the current frame.
1. Then, we evaluate each individual operand in the current frame.
1. Once we have both the operator and the operands, we **open a new frame**, and we apply the operator the operands in the new frame. The frame opened will have the _parent_ of the _frame it was defined in_.
    - With lambda functions, the _name_ of the frame is _lambda_, whereas with defined functions, the name of the frame is the intrinsic name of the function (the name it was defined with).
1. The value given by the `return` statement is called the _return value_, and becomes of the value of the entire call expression. In the example below, we see that the first function call opens a frame titled _lambda_, whereas the second function call opens a frame titled *f_to_c*. Note that both functions are defined in `global`, so both of their parents are the global frame. The return values of both are also bound in the global frame (where the function was called).
    <iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=fahrenheit%20%3D%2080%0Af_to_c_lambda%20%3D%20lambda%20fahrenheit%3A%20%28fahrenheit%20-%2032%29%20*%205%20/%209%0Adef%20f_to_c%28fahrenheit%29%3A%0A%20%20%20%20celcius%20%3D%20%28fahrenheit%20-%2032%29%20*%205%20/%209%0A%20%20%20%20return%20celcius%0A%0Acelcius_from_lambda%20%3D%20f_to_c_lambda%28fahrenheit%29%0Acelcius%20%3D%20f_to_c%28fahrenheit%29&codeDivHeight=400&codeDivWidth=350&cumulative=true&curInstr=12&origin=composingprograms.js&py=3&rawInputLstJSON=%5B%5D"> </iframe>

---
{: .hr-subsection}

### A Note on Lookup Order

When lookup happens in a frame, this is the order:
1. Lookup name in current frame. Return value if found.
1. Lookup name in parent frame. Return value if found.
1. Continuously recurse to parent frames until we hit global frame.
1. At global, lookup name in global frame. Return value if found.
1. Error out if not found.

Example of erroring:
<iframe width="800" height="370" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=def%20a%28%29%3A%0A%20%20%20%20def%20b%28%29%3A%0A%20%20%20%20%20%20%20%20return%20c%0A%20%20%20%20return%20b%28%29%0Aa%28%29&codeDivHeight=400&codeDivWidth=350&cumulative=true&curInstr=7&origin=composingprograms.js&py=3&rawInputLstJSON=%5B%5D"> </iframe>
Above, we open up frames `a` and `b`, and we try to look up `c`. Since `c` doesn't exist in frame `b` or `a` or `global`, we error out.

Example of valid lookup:
<iframe width="800" height="390" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=c%20%3D%2010%0Adef%20a%28%29%3A%0A%20%20%20%20c%20%3D%2020%0A%20%20%20%20def%20b%28%29%3A%0A%20%20%20%20%20%20%20%20return%20c%0A%20%20%20%20return%20b%28%29%0Aa%28%29&codeDivHeight=400&codeDivWidth=350&cumulative=true&curInstr=9&origin=composingprograms.js&py=3&rawInputLstJSON=%5B%5D"> </iframe>
Above, we open up frames `a` and `b` the same way. This time, when we try to look up `c`, it once again does not exist in frame `b`. We look in its parent (`a`), where it does exist. As a result, we return `20`.

---

## Footnotes

[^out-of-scope]: This is outside of the scope of this class
