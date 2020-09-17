
# Table of Contents



Q1 Solution:

The result of `f(0)` is 10 because any time we call `f` with a value
less than 10 we call `f` again with the value `(x + 1)` Therefore any
call where the initial value of `x` is less than 10 will eventually
end when `x` reaches the value 10.

When we call `f(100)`, a value already larger than 10, we get \`=100=\`
back. Any value greater than or equal to `10` will be returned to us.

Q2 Solution:

The function `g`, when called, creates an environment with the value
`x` bound to 0. Because a new environment is created each time we call
`g`, call each of the environments so created `env-g-N` where N
indicates which call to `g` created the environment. It then returns a
function which refers to that environment. The body of that function
increments the `x` in the associated `env-g-N` environment. 

Therefore, the function `h1` increments the value of `x` in the
`env-g-1` environment and returns the result. `h2` does the same
thing, but in the `env-g-2` environment. 

Therefore `c(h1(), h2(), h1(), h1(), h2())`

results in `c(1,1,2,3,2)`.

