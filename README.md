# Simple-Haskell-Queue
A simple queue structure in haskell.
## Description
Basic implementation of a queue structure and its functions. Good for learning how to use and create your own data structures. If you want a more complex version you can use the official [Data.Sequence](https://hackage.haskell.org/package/containers-0.7/docs/Data-Sequence.html) instead.
## How to use
To use modules, import them into your script and asign a name to the library:
```
import QueueP as Q
```
QueueP needs to be the path to the module.
Now to use the module you can use the name you gave it.
## Use examples
### Creating an empty queue
```
> Q.empty
QueueP()
```
### Checking if a queue is empty
```
> Q.isEmpty Q.empty
True
```
### Inserting an element in a queue
```
> Q.enqueue 5 Q.empty
QueueP(5)
```
### Getting the first element of a queue
```
> Q.first (Q.enqueue 5 Q.empty)
5
```
### Deleting the first element of a queue
```
> Q.dequeue (Q.enqueue 5 Q.empty)
QueueP()
```
### Getting the first element and erasing it from the queue using one function
```
> Q.dequeueAndReturn (Q.enqueue 5 Q.empty)
(5,QueueP())
```
Use this if you don't want to manually delete the first element using "dequeue".
## Examples
Function that creates a queue, adds the number 5 and checks if the first number in the queue is 5:
```
exampleFunction:: Bool
exampleFunction = Q.first (Q.enqueue 5 Q.empty) == 5
```
Function that returns a tuple of the first element of the queue and the queue without that element:
```
exampleFunction2:: (Ord a) => Q.QueueP a -> (a, Q.QueueP a)
exampleFunction2 q = (Q.first q, Q.dequeue q)
```
The same function but using "dequeueAndReturn":
```
exampleFunction3:: (Ord a) => Q.QueueP a -> (a, Q.QueueP a)
exampleFunction3 q = Q.dequeueAndReturn q
```
