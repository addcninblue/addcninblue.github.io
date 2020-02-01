---
layout: note
title: "Week 5 - Abstractions"
note: 5
toc: true
---

## Container Types
Remember back in [week 1](./week1#primitive-expressions) when I said that there were "other container types that we will get into later"? Well, here they are:
- List type: A _mutable_ container. Lists use _square brackets_.
    ```python
    # notice that lists can hold all kinds of elements, including other containers
    >>> ["Hello!", 2, True, [1], (0, 1)]
    ["Hello!", 2, True, [1], (0, 1)]
    ```
- Tuple type: An _immutable_ container. Tuples use _round brackets_. [^parentheses]
    ```python
    # same with tuples!
    >>> ("Hello!", 2, True, [1], (0))
    ("Hello!", 2, True, [1], (0))
    ```

### List Operations
Here are some of the most commonly-used list operations, assuming `lst` is a list:
- `lst[start:end:count]`: Creates _a copy_ of the list from starting position `start` to ending position `end`, taking every `count`th element. `start` defaults to `0`, `end` defaults to `len(lst)`, and `count` defaults to `1` when each is not specified.
- `lst.append(x)`: Appends x to the end of the list.
- `lst.extend(x)`: Extends x, an iterable, to the end of `lst`.
    - This is equivalent to appending each item from x to `lst`.
    - Or roughly in code:
        ```python
        for item in a:
            lst.append(item)
        ```
- `lst.insert(pos, x)`: Inserts `x` at `pos` position.
- `lst.remove(x)`: Removes first item whose value is equal to `x`
- `lst.pop(index)`: Removes item whose index is `index` from `lst`.

For a full list of list operations, check the [Python reference](https://docs.python.org/3/tutorial/datastructures.html).

## An Aside on Mutability
You may have noticed that there wasn't a section on tuple methods. This is because tuples are _immutable_, resulting in them only having two methods: `index` and `count`. [^tuples]

Immutability is a feature of certain objects in Python where the value of the object cannot be changed after being declared. This means that in the case of tuples, no matter what you do, once the tuple is declared, its values are final and unchangeable.

You might ask, isn't the following mutating the variable?

```python
>>> a = (1, 2)
>>> a = (2, 3)
>>> a
(2, 3)
```

It's not. The tuple itself is not changed; instead, the name `a` is _rebound_ to a different value.

## Abstractions: An Abstract
Programmers are, by nature, lazy people. We try to simplify things, to the point where we try to abstract away components. Much like how driving a car doesn't require knowing how the car works under the hood, _abstractions_ allow programmers to write code that uses parts of other code without knowing how it works.

## A Motivation for Abstractions
Let's take the example of a coordinate pair. This can be represented by a two-element tuple, like this: `(x, y)`. Suppose we were given these two points, `home` and `school`, and were told to create a `distance` function to compute the distance between any two points. This might be a valid function:

```python
>>> home = (0, 0) # I'm the center of the world
>>> school = (3, 4)
# Let's make a function to compute the distance betweeen two points:
>>> def distance(a, b):
        x_distance = a[0] - b[0]
        y_distance = a[1] - b[1]
        pythagorean_distance = sqrt(x_distance ** 2 + y_distance ** 2)
        return pythagorean_distance
>>> distance(home, school)
5.0
```

So far, this seems great! It looks like we can perform all sorts of computations to these coordinate objects. However, one problem will quickly arise.

Suppose the container type of these coordinates is changed. Instead of a tuple of `(x, y)`, we're now given a tuple of `(location_name, x, y)` (making our locations `("home", 0, 0)` and `("school", 3, 4)`). Our implementation of distance is now suddenly broken! This gives a motivation for _abstractions_

## A Functional Introduction to Abstractions
Now, with the power of abstractions, let's say we're given this _functional interface_:
- `make_location(location_name, x, y) -> location`: A function that takes in a location name, an x coordinate, and a y coordinate, and returns a _location object_.
- `x_location(location) -> x`: A function that takes in a location object and returns its x location.
- `y_location(location) -> y`: A function that takes in a location object and returns its y location.
- `location_name(location) -> name`: A function that takes in a location object and returns its name.

With this, let's make the `distance` function again:

```python
>>> def distance(a, b):
        x_distance = x_location(a) - x_location(b)
        y_distance = y_location(a) - y_location(b)
        pythagorean_distance = sqrt(x_distance ** 2 + y_distance ** 2)
        return pythagorean_distance
```
And let's try it on our `home` and `school`, also defined below:
```python
>>> home = make_location("home", 0, 0)
>>> school = make_location("school", 3, 4)
>>> distance(home, school)
5.0
```

Note that this abstraction makes it so that _the distance function works regardless of the implementation of the abstraction itself_ !

Two valid implementations of the abstractions could be as follows; notice that although the implementations are different, **the distance function still works!**:

<details>
<summary markdown='block'>
### Implementation 1
</summary>

```python
### Abstraction ###
>>> def make_location(location_name, x, y):
        return (location_name, x, y)

>>> def x_location(location):
        return location[1]

>>> def y_location(location):
        return location[2]

>>> def location_name(location):
        return location[0]
### End Abstraction ###

>>> def distance(a, b):
        x_distance = x_location(a) - x_location(b)
        y_distance = y_location(a) - y_location(b)
        pythagorean_distance = sqrt(x_distance ** 2 + y_distance ** 2)
        return pythagorean_distance

>>> home = make_location("home", 0, 0)
>>> school = make_location("school", 3, 4)
>>> distance(home, school)
5.0
```

</details>

<details>
<summary markdown='block'>
### Implementation 2
</summary>

```python
### Abstraction ###
>>> def make_location(location_name, x, y):
        return (location_name, (x, y))

>>> def x_location(location):
        return location[1][0]

>>> def y_location(location):
        return location[1][1]

>>> def location_name(location):
        return location[0]
### End Abstraction ###

>>> def distance(a, b):
        x_distance = x_location(a) - x_location(b)
        y_distance = y_location(a) - y_location(b)
        pythagorean_distance = sqrt(x_distance ** 2 + y_distance ** 2)
        return pythagorean_distance

>>> home = make_location("home", 0, 0)
>>> school = make_location("school", 3, 4)
>>> distance(home, school)
5.0
```

</details>

---

## Footnotes
[^parentheses]: Or _parentheses_, if you're like that
[^tuples]: https://www.programiz.com/python-programming/methods/tuple
