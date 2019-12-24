---
layout: page
title: "Week 13"
week: 13
---

## Streams
- Streams are very similar to Linked Lists. Below is a short comparison

  - Linked Lists:

    ```scheme
    scm> (define a (cons 1 (cons 2 nil)))
    a

    scm> a
    (1 2)

    scm> (car a)
    1

    scm> (cdr-stream a)
    (2)

    scm> a
    (1 2)
    ```

  - Streams:

    ```scheme
    scm> (define a (cons-stream 1 (cons-stream 2)))
    a

    scm> a
    (1 . #[promise (not forced)])

    scm> (car a)
    1

    scm> (cdr-stream a)
    (2 . #[promise (not forced)])

    scm> a
    (1 . #[promise (forced)])
    ```
