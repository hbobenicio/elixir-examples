#!/usr/bin/env elixir

myInteger = 10
myOtherInteger = 0x1F # binary: 0b1010, octal: 0o777
myFloat = 3.14
myOtherFloat = 10.0e3 # yields 10^3 = 1000
myBoolean = true
myAtom = :yes # a.k.a. symbols
myString = "myString"
myList = [1, 2, 3] # Lists in elixir are dynamic linked lists. length(myList) runs in linear time
myTuple = {1, 2, 3} # Tuples in elixir are arrays (a.k.a. contiguos allocated memory - a buffer). size(myTuple) runs in constant time
sum = fn(a, b) -> a + b end # function that yields a + b. to call it, use sum.(2, 3)