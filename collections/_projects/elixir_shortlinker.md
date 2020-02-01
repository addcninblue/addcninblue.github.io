---
layout: page
title: "Elixir Shortlinker"
priority: 3
---

## Background
CS61A uses an in-house [link server](https://github.com/Cal-CS-61A-Staff/links) for student links and staff links. It helps with sharing important documents (like sign-ins, etc). Recently, I learned Elixir, a functional programming language, and I wanted to write something interesting with this, particularly to see how well it handled scaling (which it's known for). As a result, I wrote a drop-in replacement for this link server, hosted on my own `go.addcnin.blue` server.

## Performance
Its performance is very good when the server load increases. Whereas in Python, the service is single-threaded because of Python's built-in synchronization issues (GIL), Elixir has default concurrency because its model is built around spawning light green threads. As a result, the load spreads evenly across CPUs. The only complaint between this and the Python one is unloaded memory usage -- this one uses much more memory (on the order of ~100 MB), probably to handle the overhead of the BEAM.

## Elixir
Writing the project was very rewarding. Elixir is a fun language, and there are many smart features baked in -- handling of concurrent processes, nonblocking calls to other processes, easy scheduling of threads without worrying about race conditions. I'll definitely be writing another project that uses Elixir's data handling prowess to concurrently process large amounts of data.

[Github](https://github.com/addcninblue/links)
