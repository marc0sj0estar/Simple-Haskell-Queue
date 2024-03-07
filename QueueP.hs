module QueueP

(QueueP
    , isEmpty
    , enqueue
    , dequeue
    , first
    , empty
    ,dequeueAndReturn
) where

data QueueP a = Empty | Node a (QueueP a)

empty :: QueueP a
empty = Empty

isEmpty :: QueueP a -> Bool
isEmpty Empty = True
isEmpty _ = False

enqueue :: (Ord a) => a -> QueueP a -> QueueP a
enqueue n Empty = (Node n Empty)
enqueue n (Node n2 next) | n <= n2 = Node n (Node n2 next)
                         | otherwise = Node n2 (enqueue n next)

dequeue :: QueueP a -> QueueP a
dequeue Empty = Empty
dequeue (Node x next) = next

first :: QueueP a -> a
first Empty = error "Can't get element, the queue is empty"
first (Node n x) = n

dequeueAndReturn :: (Ord a) => QueueP a -> (a, QueueP a)
dequeueAndReturn q = (first q, dequeue q)

instance (Show a) => Show (QueueP a) where
  show x = "QueueP(" ++ (aux x) ++ ")"
    where
     aux Empty      =  []
     aux (Node x Empty) = show x
     aux (Node x s) =  show x ++ "," ++ aux s