# Linked List Project

A Ruby implementation of a singly linked list built from scratch as part of practicing fundamental data structures and pointer/reference manipulation.

---

# What I Built

This project implements two core classes:

- `Node` → represents an individual node in the list
- `LinkedList` → manages the full linked list structure

The linked list supports:

- appending nodes
- prepending nodes
- traversing the list
- searching
- indexed access
- insertion at arbitrary positions
- removal at arbitrary positions
- converting the list into a readable string format

---

# Core Concepts Practiced

This project helped reinforce foundational computer science concepts such as:

- object references
- linked structures
- traversal
- mutation safety
- preserving references before reassignment
- insertion/deletion through pointer manipulation
- edge-case handling
- guard rails for invalid indexes

---

# Full Pseudocode

## Node Structure

```text
CLASS Node

  data
  next_node

  initialize(data, next_node = nil)
    store data
    store next_node

END CLASS
```

---

## Linked List Structure

```text
CLASS LinkedList

  initialize
    head = nil

END CLASS
```

---

# append(value)

```text
Create new node

IF list is empty
  set head to new node
  stop

Start at head

WHILE current node has next node
  move current forward

Connect last node to new node
```
---

# print_list

Start at head node

WHILE current node exists

  print current node value followed by " -> "

  move current to next node

END WHILE

print "nil"

---

# prepend(value)

```text
Create new node

Set new node next reference to current head

Move head to new node
```

---

# size

```text
IF list is empty
  return nil

Start at head
count = 0

WHILE current exists
  increment count
  move current forward

Return count
```

---

# head

```text
IF list is empty
  return nil

Return head value
```

---

# tail

```text
IF list is empty
  return nil

Start at head

WHILE current exists
  IF current next node is nil
    return current value

  move current forward
```

---

# at(index)

```text
IF list is empty
  return nil

Start at head
count = 0

WHILE current exists

  increment count

  IF count equals target index
    return current value

  move current forward

Return nil if index does not exist
```

---

# pop

```text
IF list is empty
  return nil

Store current head value

Move head to second node

Return removed value
```

---

# index(value)

```text
IF list is empty
  return nil

Start at head
count = 0

WHILE current exists

  increment count

  IF current value equals target value
    return count

  move current forward

Return nil if value does not exist
```

---

# insert_at(index, *values)

```text
Create new nodes from values

IF no values provided
  return list

Chain all new nodes together

Count total list size

IF index invalid
  raise IndexError

IF index is 0
  connect end of new chain to current head
  move head to first new node
  stop

Traverse to node BEFORE insertion index

Store original next connection

Connect current node to start of new chain

Connect end of new chain to original next connection
```

---

# remove_at(index)

```text
IF index is 0
  move head to second node
  stop

Count total list size

IF index invalid
  raise IndexError

Traverse to node BEFORE removal index

Skip over target node

Reconnect list
```

---

