---
layout: post
title: Bloculator
feature-img: "img/bloculator_banner.png"
date: February, 2018
thumbnail-path: "img/bloculator_main.png"
short-description: A command-line calculator application.
published: true
---

This is a command-line calculator application written in Ruby. It converts infix notated expressions to postfix notation in order to perform the mathematic operations in the appropriate order even when provided complex expressions involving parenthesis, addition, subtraction, multiplication, division, and exponents.

![Bloculator main menu](/img/bloculator_main.png)

# Mathematic Notation

Working on this project afforded me the opportunity to learn a lot about mathematic notation. When humans write down mathematic expressions, they often use what's called [infix](https://en.wikipedia.org/wiki/Infix_notation) notation in which the operator is written in between operands and the 'order of operations' is obeyed unless parenthesis indicate a different grouping. While humans are great at using those visual tools to group and order various operations, machines have a harder time. Computers love to deal in queues where _order_ is already taken care of. This type of notation is called [postfix](https://en.wikipedia.org/wiki/Reverse_Polish_notation).

_[infix example]_
```ruby
(3-1)/(4+2)
```
_[postfix example]_
```ruby
31-42+/
```

A machine can evaluate the postfix expression above by moving from left to right and keeping track of all the numbers as it goes. Once it finds the first operator, it uses that operator to evaluate the most recent two numbers, puts the result on the top of the number 'stack' and continues evaluating.

```ruby
3
31
(31-) = 3-1 = 2
24
242
2(42+) = 4+2 = 6
26
(26/) = 2/6 = 33.3
```

# History

Along with being able to evaluate complex expressions. It was important to me that Bloculator be able to keep track of the expressions you ask it to compute as well as the results of those expressions. This allows you to use previous results as part of subsequent expressions and to remember which expressions you previously entered.

![Expression history](/img/bloculator_history.png)


![Result history](/img/bloculator_results.png)

One future enhancement that I'd like to see in Bloculator is the ability to export and import calculator histories (currently they only last for the duration of the current calculator instance) both to save calculator actions and to share or re-use results.
