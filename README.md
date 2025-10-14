# The Sneed Programming Language
Formerly Lisp

Jokes aside, Sneed is a small Lisp dialect with a handful of references
from The Simpsons. It is a hobbyist project made as a learning experience for me, with
Daniel Holden's [Build Your Own Lisp](https://buildyourownlisp.com/) being used as the main source of help
for to go about crafting a Lisp interpreter. There are two versions of Sneed:
The first is the "main.c" file, which relies on Holden's "mpc" parser combinator library.
The second has not been fully completed yet, but it is a bonus activity to work on at the end of the book where
I implement my own parser from scratch in "sneed.c (not without some help of course). This was a fun and educational experience
and I would be quite keen to continue working on Sneed in future, maybe implementing more features or hidden references ;)

## Some Examples of how Sneed works:
Compile the mpc reliant version with: `make external` in the root directory, or compile the standalone version with `make standalone`.
Then enter the `/bin` folder and run it with `./sneed_external` or `./sneed_standalone`. Make sure to grab the mpc library that this relies upon if you are using the external version.

You will enter the Sneed REPL, where you can type in Sneed code. Being a Lisp dialect, Sneed
is rather unorthodox in its syntax (largely due to the usage of Polish notation). Here are some examples of Sneed code:

`doh {addition} (\ {x y} {+ x y})`<br>
Here, this defines (using Homer's famous "D'oh!" catchphrase) a function called "addition" that takes two parameters, x and y, and returns their sum.

`doh {result} (addition 5 10)`<br>
This calls the previously defined "addition" function with the arguments 5 and 10, and assigns the result to a variable called "result".
Running `result` in the REPL will output `15`. Simple!

We can do more complicated things of course too, such as zipping two lists into a new list of pairs. Here's an example, utilizing the `fun`, `nil`, `first` and `or` keywords d'ohed in `prelude.snd` (I'll make this into a standard library format for easier reading and implement it in `prelude.snd` later):
```
(fun {zip lst1 lst2} {
  if (or (== lst1 nil) (== lst2 nil))
    {nil}
  {join (list (list (first lst1) (first lst2))) (zip (tail lst1) (tail lst2))}
})
```
Now let's try it out!<br>
```zip (list 1 3 5) (list 2 4 6)```<br>
Gives us the output:<br>
`{1 2} {3 4} {5 6}` exactly as we wanted! Cool stuff, right?
Here's another example using `fun` to make an exponential function:
```
(fun {pow x y} {
  if (== y 0)
    {1}
  {* x (pow x (- y 1))}
})
```
Now we can call `pow 2 3` to get `8`. This is a great example of how one can levarage Lisp's strengths in recursion to 
implement mathematical functions.

There are many more features and ways to do things in Sneed, so feel free to try it out while I work more on the documentation and the
non-mpc version. Enjoy!

## Disclaimer
There is an ongoing error getting this to compile on Linux systems at the moment due to it not linking to the readline library for some reason.
I myself am using a combination of Windows, WSL2, and CachyOS (the latter for my laptop). It has been a while since I last programmed in C, so forgive me if I have made any silly mistakes with this ;P
