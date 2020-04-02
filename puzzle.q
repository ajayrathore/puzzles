// http://beyondloom.com/blog/strings.html

// All solutions in K4


// 0 - Multiplicity
// Characters are expensive, and the accountants tell me we can’t hand them out willy-nilly anymore. Given a string x and a character y,
// how many times does y occur in x?
{+/x=y}["mississippi";"s"]
4i
//Another way
{#:(=x)y}["mississippi";"s"]
4

// 1 - Trapeze Part
// Sometimes I try reading sentences right-to-left to make my life more exciting. Results have been mixed.
// Given a string x, is it identical when read forwards and backwards?
{x~|x}"racecar"
1b

// 2 - Duplicity
// One is the loneliest number. Given a string x, produce a list of characters which appear more than once in x.
&1<#:'="applause"
"ap"


// 3 - Sort Yourself Out
// Alphabetical filing systems are passe. It’s far more Zen to organize words by their histograms!
// Given strings x and y, do both strings contain the same letters, possibly in a different order?
('[{~/x@'<:'x};(;)])["listen";"silent"]
1b

// Other fun way to do it
('[{~/r@\:!*r:#:''=:'x};(;)])["listen";"silent"]
1b


// 4 - Precious Snowflakes
// It’s virtuous to be unique, just like everyone else. Given a string x,
// find all the characters which occur exactly once, in the order they appear.
{&1=#:'=x}"somewhat heterogenous"
"mwa rgnu"


// 5 - Musical Chars
// Imagine four chars on the edge of a cliff. Say a direct copy of the char nearest the cliff
// is sent to the back of the line of char and takes the place of the first char.
// The formerly first char becomes the second, the second becomes the third, and the fourth falls off the cliff.
// Strings work the same way. Given strings x and y, is x a rotation of the characters in y?
{1=+/y~/:{,/|0 1 _ x}\x}["foobar";"barfoo"]
1b

// 6 - Size Matters
// Sometimes small things come first. Given a list of strings x, sort the strings by length, ascending.
{x@<#:'x}("books";"apple";"peanut";"aardvark";"melon";"pie")
("pie";"books";"apple";"melon";"peanut";"aardvark")


// 7 - Popularity Contest
// Sixty-two thousand four hundred repetitions make one truth. Given a string x,
// identify the character which occurs most frequently.
// If more than one character occurs the same number of times, you may choose arbitrarily. Is it harder to find all such characters?
{*>#:'=x}"abdbbac"
"b"
//Find all characters
{&x=max@x:#:'=x}"CCCBBBBAAAA"
"BA"


// 8 - esreveR A ecnetneS
// Little-endian encoding is such a brilliant idea I want to try applying it to English.
// Given a string x consisting of words (one or more non-space characters) which are separated by spaces,
// reverse the order of the characters in each word.
{" "/:|:'" "\:x}"a few words in a sentence"
"a wef sdrow ni a ecnetnes"


// 9 - Compression Session
// Let’s cut some text down to size. Given a string x and a boolean vector y of the same length,
// extract the characters of x corresponding to a 1 in y.
{x@&y}["foobar";1 0 0 1 0 1]
"fbr"


// 10 - Expansion Mansion
// Wait, strike that- reverse it. Given a string x and a boolean vector y,
// spread the characters of x to the positions of 1s in y, filling intervening characters with underscores.
{@[;&y;:;x]#[;"_"]@#:y}["fbr";1 0 0 1 0 1]
"f__b_r"


// 11 - C_ns_n_nts
// Vowels make prose far too… pronounceable. Given a string x, replace all the vowels (a, e, i, o, u, or y) with underscores.
{@[x;;:;"_"]@&12>"aeiouyAEIOUY"?x}"Several normal words"
"S_v_r_l n_rm_l w_rds"

// 12 - Cnsnnts Rdx
// On second thought, I’ve deemed vowels too vile for placeholders. Given a string x, remove all the vowels entirely.
{x_/abs(!#r)-r:&12>"aeiouyAEIOUY"?x}"Several normal words"
"Svrl nrml wrds"


// 13 - TITLE REDACTED
// Given a string x consisting of words separated by spaces (as above), and a string y,
// replace all words in x which are the same as y with a series of xes.
{@[x;;:;"X"]@,/(!#y)+/:x ss y}["a few words in a sentence";"words"]
"a few XXXXX in a sentence"


// 14 - It’s More Fun to Permute
// My ingenious histogram-based filing system has a tiny flaw: some people insist that the
// order of letters in their names is significant, and now I need to re-file everything.
// Given a string x, generate a list of all possible reorderings of the characters in x.
// Can you do this non-recursively?
{(1 0#x){,/{,/|0 1 _ x}\'x,'y}/x}"xyz"
("xyz";"yzx";"zxy";"yxz";"xzy";"zyx")