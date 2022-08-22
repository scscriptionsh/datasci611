For this and any homework assignment feel free to actually type code
in and run it.

Problem 1:
==========

Suppose you run this code.

```
alias hello="echo hello world"
hello
```

Given that "hello" isn't a file on the path, describe how to modify
our "evaluation strategy" to account for this new behavior.

Problem 2
=========

Create a file called "experiment.sh" that looks like this.


    echo argument number one is $1
    echo argument number two is $2

    echo rest arguments ${@:3}

    echo all arguments $@



And invoke it by saying:

```
bash ./experiment.sh a b c d e
```

Describe some new evaluation rules that explain this
behavior. Experiment! You don't need to get this exactly right.

Problem 3
=========

Now invoke the script like this:

```
bash ./experiment.sh a 'b c' d
```

Describe a new evaluation rule to explain the results.
