#import "preamble.typ":*
#import "@preview/cetz:0.2.2":canvas, tree, draw
#import emoji

#set page(margin: (
  x: 3cm, 
  y: 2cm,
))

#let def = $eq.delta$



#titlePage[COMP_SCI 496: Graduate Algorithms][Randy Truong][Spring 2024]

#show par: set block(spacing: 0.65em)
#set par(
  first-line-indent: 1em,
  justify: true,
)
#let var = math.italic

#set heading(
  numbering: "1.1.1.1.1"
)

#set math.equation(
  numbering: "(1)"
)

#set enum(numbering: "(1).(a)")

#set terms(
  separator: [. ]
)

#pagebreak()
#outline()

#unit[Probability + Graph Theory][]
#chap[A Prelude in Graph Theory and Combinatorics]
#[This is a chapter that is devoted to Randy learning how 
graph theory works in finer granularity.]
= Subgraphs 
/ Subgraph: #[Given a graph $G=(V,E)$, a subgraph of $G$, 
which is denoted as $G' = (V', E')$ is a graph whose 
vertices $V'$ are a subset of $V$ and whose edges 
$E'$ are a subset of $E$.]

= Induced Subgraphs
/ Induced Subgraph: #[Given a graph $G=(V,E)$, an induced 
subgraph $G' = (V', E')$ is a subgraph of $G$ that contains 
the following property: 
- all edges $e' in E'$ must have (both) endpoints be in $V'$]

#[We define the subgraph induced by $V'$, where $V'$ is a set 
of vertices $V' subset.eq V$, as being the subgraph $G' = (V', E')$
in which all $e' in E'$ must have both endpoints $r'_1, r'_2 in V'$.]

= Graph Orientations 
/ Orientation: #[Given an undirected graph $G$, an _orientation_ 
of the graph $G$ would be the resulting graph in which we assign 
each edge a direction, resulting in a directed graph.]

= Tournaments 
/ Tournaments: #[Given a set of vertices $V$, a tournament of 
$V$, denoted as $T$ on $V$, is an _orientation_ of the 
vertices, such that the resulting graph is connected.]
  - #[Note, in a tournament, two endpoints $i, j$ can only 
    have a single edge between them, in which $i arrow.r j$
    or $j arrow.r i$, but not both]

= Dominating Sets 
/ Dominating Set: #[A _dominating set_ of an undirected graph 
$G = (V,E)$ is a set $U subset.eq V$ such that every 
vertex $v in V - U$ has at least one neighbor in $U$. ]

#pagebreak()
#chap[The Basic Method]
= The Probabilistic Method 
- Powerful tool for tackling problems in discrete math 
- Main idea of the method 
  - *Objective.* #[We see kto prove that a structure with 
certain desired properties _exists_]
  - We first define an appropriate probabilisty space of structures 
  - #[then, we show that the desired properties hold in these 
  structures with positive probability]


= Example 1 <test>
#[We note that the _Ramsey number_ $R(k, cal(l))$ is the smallest 
integer $n$ such that in any wo-coloring of the edges of a complete 
graph on $n$ vertices $K_n$ by red and blue, either there is a 
red $K_k$ (ie, a ocmplete subgraph on $k$ vertices all of whose 
edges are colored red) or there is a blue $K_cal(l)$.]
- #[Ramsey showed that $R(k, cal(l))$ is finite for any 
two integers $k$ and $l$.] 
- #[We can obtain a lower bound for hte diagonal 
Ramsey numbers $R(k, k)$]
  - #rmk[Complete Graph][A _complete graph_ $K$ on $n$ (which is denoted as $K_(n)$) 
  is a graph in which each pair of distinct $n$ vertices is connected together by an edge.]


== *Prop. 1* <prop1>
#[If $mat(n ; k) dot 2^(1-mat(k; 2)) < 1$, then $R(k, k) > n$. Thus 
$R(k, k) > floor(2^(k/2))$ for all $k gt.eq 3$
]
- #[Note, here $R(k,k)$ represents a graph $R$ in which the induced
monochromatic graphs must _both_ be of size $k$, which is a stronger 
condition than $R(k, cal(l))$]


*Proof.* In @prop1, we first derive the following: 
- #[We first seek out the probability that an induced graph
$K_(n)$ is monochromatic, which is equiv. to]
$
Pr[A_R] = (1/2)^(mat(n; 2)) arrow.r 2^(mat(n;2)) arrow.l.r 2^(1-mat(n;2))
$
- #[We next seek the probability that any induced graph (aka a 
$n$-combination of the original $k$-graph) is monochromatic]
$
mat(k;n) dot 2^(1-mat(n;2))
$
- #[*Observation 1.* We understand that the probability of this event 
occuring must be bounded by $1$, thus leading us to the conclusion that 
$
mat(k;n) Pr[A_R] < 1 
$
which must imply that the probability that event $Pr[A_R]$ doesn't occur 
must be non-zero]
  - #[What exactly is the _negation_ of event $A_R$? If $A_R$ denotes 
the event that the induced subgraph of $K_k$ on $R$ is monochromatic, 
then $not (A_R)$ must be the probability that a two-coloring of the
graph $R$ does _not_ produce a monochromatic induced subgraph]
  - #[We would denote this is as the Ramsey number of induced
  grpah sizes $n$ and $n$, or $R(n, n)$. Given that we want the negation, then 
we know that the size must be greater than $n_0$, since the Ramsey
number must be $n_0$]
- #[*Observation 2.* We understand that if the size of the 
induced graph, denoted as $n >= 3$ and if we take 
the size of the graph $k$ to be $k= floor(2^(k/2))$, then we know 
that 
$
mat(k; n)2^(1-mat(n;2)) < ((2^(1+n/2)) / n!) dot (k^n/(2^(n^2/2))) < 1 
$
Thus, $R(n,n) > floor(2^(n/2)) forall n >= 3$]
= Optional Proof Notes 
 - #[Because there are $mat(k;n)$ choosings of the graph $G$, then 
it follows that at least one of these events occurring must be non-zero
but strictly less than 1. ]
  - #[Thus, the inverse of this statement must be true- ($exists$ a two-coloring of 
the graph $G$ of $k$ vertices $G_k$ that doesn't have a monochromatic
induced graph $G_n$)]
  - #[This is represented as the Ramsey number $R(k, k)$, which 
semantically equates to smallest size of a graph that has a monochromatic
edge-colored subgraph of size $k$]
  - #[Given that we know that the Ramsey number refers to the smallest $n$
for which there is a monochromatic induced subgraph of sizes $k$ or $cal(l)$,
then it follows that in order for both monographic subgraph sto be of sizes 
$k$, then the graph must be at least the size of the graph whose Ramsey 
number $R(k, cal(l))$ is $n$.]

= The Essence of the Probabilistic Method 
Note the way that we evaluated this problem. 
  - #[*Objective.* Prove the existence of a good 
  coloring $K_n$ given a graph $K$.]
    - #[We first defined what a "good" coloring was-- which was a non-monochromatic
  graph formed from the induced graph of the two-colored graph.]
    - #[Then, we showed that it _exists_, in a nonconstructive way]
      - #[We defined a probability space of events, and we narrowed
    that probability space down to events that described structure sof 
  particular properties]
      - #[From there, we then just showed that the desired properties 
    that we want will hold in this narrowed down probability space, with
  positive probability.]
= Why is this approach effective? 
#[This approach is effective because the vast majority of probability 
spaces in combinatorial problems are _finite_]
- #[Sure, we could use an algorithm to try and find such a structure 
with a particular property]
- #[For example, if we wanted to actually find an edge two-coloring 
of $K_n$ without a monochromatic induced graph, we could just 
iterate through all possible edge-colorings and find their induced
grpahs.]
  - #[Obviously, this is impractical (it's actually class $PP$ haha)]
  - #[Although these problems could be solved using _exhaustive
  searches_, we want a faster way. ]
  - #[This is the difference between _constructivist_ and _nonconstructivist_
ideas in proofs]
    - #[Although we don't have a deterministic way of forming the graph, 
  we are able to define an algorithm that could potentially lead to the desired graph, 
which, which is more effective than just trying to deterministically create one]
   - #[In the case of the Ramsey-number problem, it would be more 
 effective to find a good coloring (a non-monochromatic induced graph)
 by just letting a fair coin toss decide on how to color the nodes]

= Second Look at the Probabilistic Method 
= Property $S_k$ 
#[We state that a tournament $T$ has the property 
$S_k$ if and only if, for every set of $k$ Players, there 
is one that beats them all.]/
- #[Formally, this would mean that given a tournament $T = angle.l V, E angle.r$ 
  and subsets $K$ of size $k$
  $
    exists v in T - K : (v, k) forall k in K 
  $
  ]

#[_*Claim.* Is it true that for every finite $k$ that there exists 
a tournament $T$ (on more than $k$ vertices) with the property 
$S_k$?_]

#[*Proof.* In order to prove this, let us consider a random tournament $T$. 
\ \ 
Given this random tournament $T$, let's determine the probability that 
a node $v$ in $T-K$ beats all of the nodes $j in K$. This is a difficult 
probability to calculate, however, and it is
this probability as the complement of its negation (that there isn't a node 
in $V-K$ that beats all the nodes $j in K$). 

Let us find probability that a fixed node $v$ in $V-K$ 
beats all the nodes $j in K$.
- #rmk[Tournamentk][Because $T$ is a tournament, we know that 
  if we're considering a vertex $v$, it must be connected 
  to all of the nodes within the subset $K$. Thus, there 
  is a $1/2$ probability with which the edge with endpoints 
  $v, j : j in K$ is directed $v -> j$. ]
  - Since there are $k$ nodes in $K$ and that the event 
    of $v$ beating a vertex $j$ is independent, then we just
    find the product 
$
  Pr(v "beats them all") arrow.r product_(1)^(k) (1/2) -> (1/2)^k  arrow.l.r (2)^(-k)
$
    
From this, it follows that the probability that $v$ doesn't beat them all 
is given by 
$
  Pr(v "does not beat them all") &= \ 
  &= (1 - Pr(v "beats them all")) \ 
  &= (1 - 2^(-k))
$
Now, we simply just need to find the probability that 
_any_ fixed $v$ doesn't beat them all. 

$ 
  Pr("no vertex beats them all") &= \ 
  &= ("number of possible" v in V-K) \
  & times Pr(v "doesnot beat them all") \ 
  &= product_(v in V-K) Pr(v "does not beat them all") \ 
  &= product_(v in V-K) (1 - 2^(-k)) \ 
  &= (1-2^(-k))^(n-k)
$

Finally, we just need to consider this scenario 
for all subsets $K$ of size $k$ in $V$ 

$
  sum_(K subset V \ |K|=k) Pr("no vertex beats them all") &= \ 
&= mat(n; k) Pr("no vertex beats them all") \ 
&= mat(n;k ) (1-2^(-k))^(n-k)
$
]

#unit[Randomization Algorithms][
  #figure(
    image("./img/rando.jpg", width: 100%),
    caption: [how it feels to learn probability for the first time 
  while literally in a graduate class that uses probability]
  )

]
#chap[Hashing (TODO)]
#pagebreak()
#chap[Universal and Perfect Hashing (TODO)]
#pagebreak()
#chap[Bloom Filters (TODO)]
#pagebreak()
#chap[Balls and Bins (TODO)]
#pagebreak()
#chap[Power of Random C=hoi es (TODO)]
#pagebreak()
#chap[Power of 2 Random Choices (TODO)]

#pagebreak()
#chap[Hypercubes + Permutation Routing (TODO)]

#unit[Streaming Algorithms][
  #figure(
    image("./img/tyler1.jpg", width: 100%),
    caption: []
  )
]
#chap[Motivation: Finding the Most Frequent Elements (TODO)]
#pagebreak()
#chap[Misra-Gries Algorithm (TODO)]
#pagebreak()
#chap[Count-Min Sketch (TODO)]
#pagebreak()
#chap[Counting Distinct Elements (TODO)]
// =============================================== 
// ONLINE ALGORITHMS PART 1
// =============================================== 
#unit[Online Algorithms][
  #figure(
    image("./img/online_alg.jpg", width: 100%),
    caption: [balling ]
)]

#chap[Online Algorithms (Part 1)]
= Motivation 
- #[In the former lectures, we utlized and proved the runtime 
and correctness of algorithms that approximated the solutions of 
computationally difficult problems ]
  - #[However, we now move on to a new problem: ]
\
#align(center, text[
  _...how can we optimize the solution to a problem in which 
  the algorithm doesn't have all of the information that it needs?..._
])
\
_...by using *Online Algorithms!*_

\ \
#dfn[Online Algorithms][#[Algorithms used in settings 
where data/inputs arrive _over time,_ thus requiring us to 
_make decisions on the fly,_ without knowing what's going to happen 
in the future.]]

Of course, the opposite type of algorithm is exactly what we're used to. 
- Using bubble sort? You usually know all of the inputs beforehand 
- #[We can think of data structures themselves as being inherently 
online algorithms, since they handle sequences of requests, without 
knowledge of the future]


= List of Classical Online Algorithm Problems 
- Rent or buy? (Ski rental problem)
- The elevator problem

= The Ski Rental Problem (Rent or Buy?)
- This is the problem statement: 

#align(center, [_"Say you are just starting to go skiing. 
  You can either rent skis for \$50 or buy them again for 
  \$500. You don't know if you're going to enjoy skiing, so you 
  opt to rent. Then you decide to go again, and again, and 
  after a while, you realize that you have shelled out more 
  money renting and wish you had bought right at the start."_
])

- The intuitive solution: 
  - In order to optimally solve this problem, we just need to set a 
_threshold_. If we plan on going to ski for more than 10 days, then just 
buy the skis. Otherwise, if you don't plan on skiing for more than 
10 days, then just rent them. 
  - #[*Objective.* What is the optimal strategy for saving money, assuming 
that you didn't know how often you were going to ski?]

= #[ What exactly makes an online algorithm solution (or any 
solution in this case) _good?_]
- We consider the _competitive ratio_ of the algorithm.


#dfn[Competitive Ratio][#[
  The _competitive ratio_ of an online algorithm defines the *worst-
  case* ratio of the _online algorithm ALG_ would result 
  in on an input sequence $I$ to the cost of the optimal offline 
  algorithm _OPT_.
  $
  "competitive ratio" = (var("ALG")(I)) / (var("OPT")(I))
  $
]]

#ex[Competitive Ratio 1][#[ 
    - #[*Case 1 (Buy instantly).* Let us consider the algorithm _ALG_
  in which we just buy the skis instantly. We know that the worst 
  case scenario for this problem occurs if we only ski once, ie $I = {1}$.
  If we utilize the competitive ratio definition, we observe
  $
  (var("ALG")(I)) / (var("OPT")(I)) = 500 / 50 = 10.
  $ <oa1>
  @oa1 semantically equates to "the online algorithm _ALG_ is ten 
  times worse than the most optimal offline algorithm _OPT_."
]
]]

#ex[Competitive Ratio 2][#[
  - #[*Case 2 (Rent forever).* Let us consider the algorithm _ALG_
in which we just continuously rent. The worst case set of futures 
  $I$ is the same, as it is possible we just ski for one time. This 
results in 
  $
  (var("ALG")(I)) / (var("OPT")(I)) = (50 times infinity) / 50 = infinity.
  $
  This ratio is unbounded, so we can safely say that this particular 
  _ALG_ is not very good lol 
]
]]

#ex[Competitive Ratio 3][#[
  Let us now consider a decent strategy, which we call the 
  _better-late-than-never_ algorithm. This algorithm, denoted as 
  _ALG_, simply states that we just rent the skis until we realize 
  that we should have just bought them. At that point, we just 
  buy the skis. 
  - #[Formally, if rental cost is $r$ and the purchase cost is $p$, then
  the algorithm is to rent $ceil(p/r) - 1$ times, then buy.]
  #thm[Better-Late-Than-Never Performance][#[
    The algorithm _better-late-than-never_ has a competitive ratio 
    $<= 2$. If the purchase cost $p$ is an integer multiple of 
    the rental cost $r$, then the competitive ratio is 
    $2-(r / p)$
  ]]
  #proof[Proof of BLTN Performance][#[
    We can prove this theokem directly via case analysis. 
    - #[*Case 1.* If you went skiing less than $ceil(p/r)$ times, 
  which for $p=500$ and $q=50$ would be less than 10 times, then 
  you are performing optimally]
      - #[This is because all you can do is rent, otherwise if you 
  buy, then you're wasting money!]
    - #[*Case 2.* If you go skiing $>= ceil(p/r)$ times, then the 
  best solution otherwise would have just been to buy the skis 
  from the start or _OPT_ $= p$. We find that in the circumstance 
  that we do buy, _ALG_ will pay 
    $(r times (ceil(p/r) - 1)) + p
    $
    which is essentially equivalent to the rental price $r$ multiplied 
    by the maximum number of times we rent without exceeding $p$, plus 
    the $p$ we pay whenever we buy the skis. We know that arithmetically 
    $r times (ceil(p/r) -1) + p$ must be less than or equal to $2p$. If 
    $p$ is a multiple of $r$, then it will just be $r times ((p/r) -1) + p$,
    which is equal to $p - r + p => 2p - r$
  ] 
    #[For case 1, we demonstrated that the competitive ratio was 1. In 
  the second case, we demonstrated that the competitive ratio was $<= 2$.
  Given that the worst case is 2, this must be the competitive ratio.]
  ]]
]]

#thm[BLTN Optimality][#[
  Algorithm BLTN has the best possible competitive ratio for 
  the ski-rental problem for determiinstic algorithms when 
  $p$ is a multiple of $r$. 
]]

#proof[Proof of BLTN Optimality][#[
  Let us consider the event that the day that you purchase the skis 
  is the last day that you even use them.
  - #[Consider first that this is *feasible*, since]
    + #[_ALG_ never purchases $=>$ competitive ratio 
is unbounded, which is undesired]
    + #[_ALG_ is  _deterministic_, which implies that 
a purchase _must_ occur at some point.]
  Now that we've established that it _is_ possible that we 
  may purchase the skis and never use them again, let us consider 
  the cases in which we rent _more_ times than BLTN as well as _less_ 
  times:
  - #[Renting longer than BLTN $=>$ $r$ increases, which implies that 
the competitive ratio must increase, making the algorithm worse]
  - #[Renting less than BLTN $=>$ ratio of $r/p$ decreases, but this must 
imply that both the denominator and the numerator must decrease by 
$k times r$, which also increases the competitive ratio, which is 
still worse.]

]]

#nt[i definitely need to look this over bc i need to mathematically work 
out why this is sound sad ]






// =============================================== 
// ONLINE ALGORITHMS PART 2 
// =============================================== 

#pagebreak()
#chap[Online Algorithms (Part 2)]
= From last time...
In the last lecture, we were introduced to online algorithms as well as the ski rental problem. 
#rmk[Online Algorithms][
  Online algorithms are algorithms that attempt to solve a problem 
  _without_ knowing the entire input space. Online algorithms will 
  optimize their answer as inputs come in, ie _on the fly_.

]

#rmk[Ski Rental Problem][
  The ski rental problem is as follows: 
  #qt("Say you are just starting to go skiing. 
  You can either rent skis for $50 or buy them again for 
  $500. You don't know if you're going to enjoy skiing, so you 
  opt to rent. Then you decide to go again, and again, and 
  after a while, you realize that you have shelled out more 
  money renting and wish you had bought right at the start.")

]
In the previous lecture, we discussed a *deterministic* strategy 
for evaluating this problem. 
- #[Our strategy, the better-late-than-never strategy, was as follows:] 

  - #[If the cost of renting was about to exceed the cost of buying the skis, then 
  we would simply just by the skis at that point.]

  - #[We proved that in such a case, the online algorithm, denoted as _ALG_, would 
require that the customer rents the skis for $ceil(p/r) - 1$ times before buying the 
skis outright in order to guarantee the minimal loss.
  ]

- Costs of rent vs buying 
  - Best evaluated using _randomization_ 

#rmk[$k$-competitivity][
An algorithm is $alpha$-competitive iff 
$
EE[italic("ALG")(I)] <= alpha dot.c italic("OPT")(I)
$]

= Algorithm 
+ Pick a "random" threshold $T in [0, B]$ 
  #rmk[Deterministic Online Algorithms][$T$ was $B-1$ in deterministic variant]
+ Rent for the first $T$ days 
+ Then, buy 

- Picking distribution for $T$?
  - Evaluate it utilizing a differnetial equation 

- #[In principal $T$ must be a continuous random variable for large values of 
$B$]
  - #[Assume that we can rent up until 4.75 days, then buying]

= Picking a distribution for $T$

$
"rental cost" &= sum_i=1^n Pr("still rent on day" i) \ 
"rental cost" &= sum_i=1^n Pr(T > i)
$
where $n$ is the number of days that we ski 

$
Pr(T <= t) = cases(
  1 ", if" t >= B,
  (e^(t/b)-1)/e-1 ", for"  t in [0, B]

)
$
If $T=B => Pr(T) = 1$, and $T=0 => Pr(T) = 0$
- Let 
$
var("density") = f_T = 1/B dot.c (e^(t/b)) / (e-1), t in [0,B]
$
Suppose that we ski for $n$ days, there are two cases:
+ Case 1 $(n <= B)$.
$
var("OPT") = n 
$
$
EE[var("ALG") ]= EE["cost of renting"] + EE["cost of buying"]
$

Let us derive $EE["cost of buying"]$
$
EE["cost of buying"] = Pr(T <= n) dot.c B 
$
We know from cases that this equals 
$
= (e^(n/B) - 1) / (e-1) dot.c B
$
Now let us evaluate for the cost of renting 
$
EE["cost of renting"]
$
We utilize the following equality 
$
EE["cost of renting"] = EE[min(n, T)]
$
We either rent for first $n$ steps, or if $T$ is sufficiently small, then buy. 
- However, what is $EE[min(n, T)]$
$
= EE_T [integral_0^n II(t <= T)var("dt")]
$
Conceptually, we are integrating from $[0,n]$. It happens that $T$ may be 
less tha nor equal to $n$. The indicator function states that the value of 
the function $II(t <= T) in [0,1]$. If $t <= T$, then this integral is just 
equal to $T$. 
- From here, what else can we do? We can utilize _linearity of expec. to 
swap the integral and the $EE$._
$
&=> integral_0^n EE_T [II(t <= T)]  var("dt")  \ 
&=>  integral_0^n  Pr(T <= T) var("dt")
&= (*)
$
This is just analogous utilizing a summation and finding the probability
across multiple days
- Now, let us substitute the value of $Pr(t <=T)$ as being $(1 - Pr(T <=t))$.
$
(*) &= integral_0^n 1 - (e^(t/B) - 1)/(e-1) var("dt") \ 
&= integral_0^n (e-e^(t/B))/(e-1) var("dt") \ 
&= e/(e-1) dot.c n - (e^(n/B)-1)/(e-1) dot.c B
$
#align(center, text[
  Lmao, study up how to integrate again idiot
])
\
\
#[Up until this point, we have found $EE["renting"]$ and $EE["buying"]$,
thus, we assert that 
$
var("ALG") = e/(e-1) dot.c n approx 1.58 dot.c n 
$
where $n$ is the value of $var("OPT")$. This already performs a lot better
than the deterministic solution of the problem.

\ 
Now let us consider the second case: 
]


- #[*Case 2* $> B$. We observe that for a sufficiently large $n$, then 
we are guaranteed that both algs would have bought skis at or before time $B$,
thus the cost won't change.
- #[Thus, the costs of both algorithms, the offline and online algorithms, 
would have bought the skis by time $B$].
]
Thus, we surmise that the online algorithm performs better than or equal to 
an optimal algorithm.

\
#align(center, text[
  _But can we do better?_
])

There are two strategies here: 
- #[*Approach 1.* Assume there's a distribution $f$ with which the alg picks a threshold
that is better than ours. We'll examine $n$ and thorugh computation, determine that 
$f$ is the best possible function.]
] 
- #[*Approach 2.* Utilize the _minimax_ principle (Yao's minimax principle for online algorithms)]
  - Instead of one $n$, look at the distribution of $n$'s, then do the analyss on the random distribution of $n$'s
  - Just "do things at random for various $n$'s"
    - If we assume that things are done at random, then it simplifies the computations
= Caching 

\* Caching:  All modern processors have caches L1, L2, etc. 

\
#[Let us imagine that we have a cache of size $k$ that can store $k$ elements/pages.
Whenever we store data, we store it witihn the cache. If the cache is full, however,
then we just evict an element. 
- What's the optimal strategy for choosing caches to read from and evict elements from?
- LRU Cache is the most famous one 
  - Basic, but practical
  - #[Essentially, we just keep track of whenever a cache was last used, and 
when we have a collision, we just evict the oldest one ]
- *Motivation.* We want to compare LRU with the best offline algorithm
]

*Theorem.* The competitive ratio is $k$, thus 
$
sup_I (var("ALG")(I))/(var("OPT")(I)) = k 
$

#[In the context of caches, we measure perforamnce based solely on the number of 
cache misses.]

#[*Note.* If we care about randomized algorithms, then the best competitive ratio 
is $O(log k)$]

\
*Objective.* We seek to prove that the number of cache misses that LRU has 
is bounded by $k dot.c var("OPT")(I) $. 
- Again, this could be improved utilizing ranodmization 

\ 
Let us consider a sequence of instances (sequences of numbers)
$
I_1, I_2, dots, I_n
$

#[Our strat: Fix an instance $I$. Let us consider a block $i$ that 
starts and ends with a cache miss. We find that in such a case, the 
optimal algorithm has 2 misses.]

- #[How much does $var("OPT")$ page after the cache becomes completely full? 
$
"numMisses"(var("OPT")) = "number of blocks"
$
Meanwhile 
$
"numMisses"(var("LRU"))  = k
$
- Analysis
  - How many ways does LRU page? 
  - $k$, since if there's more zz
- We claim that $var("LRU")$ has one cache miss
  - This is because $var("LRU")$ guarantees that no new element will be evicted
    - #[For any distinct number in an instance $I$, we iwll never evict it more than once per block]
  - Thus, since $var("OPT")$ must evict at least one element by definition of blocks 
  - and $var("ALG")$ will evict at least $k$ elements, then we complete the proof $qed$
- Let us reiterate the strats here: 
  - LRU always misses after filling the cache 
  - #[The optimal strategy? Always evict the element that is least likely to be evicted per block. This, of course, 
  works only for offline algs]
]
= Next TIme (Beyond Worst Case Analysis)
- #[If we use resource segmentation, we find that the competitive ratio of this algorithm 
improves. We can demonstrate that the competitive ratio can be reduced to 2. ]

//-------------------------------------------------- 
// 2 - Competitive Algorithms for Online PAging
//-------------------------------------------------- 
#pagebreak()
#chap[2-Competitive Algorithm for Online Paging (05/14/24)] 
= Reminders 
- Homework 03 is due Friday (with extension to Monday)
= Is 2-competitive real for LRU cache? 
#rmk[][We proved that $k$-competitive is the best that we can do]

= Today 
- Look at randomized online algorithms 
  - Martingale Algorithm
  - Beyond worst-case analysis 
    - Resource augmentation

= Resource Augmentation
- Tactic for analyzing online algorithms
  - Compare this algorithm with the optimal offline algorithm _OPT_
  - In order to compensate for difference, allocate more resources for _ALG_

= Scenario 
- _OPT_
  - Has $k$ pages 
- _ALG_
  - Has $2k$ pages (an advantage!)
  - Could be $1.5k$ or $k+1$, etc

#nt[Intuition here is that: Suppose that more resources $=>$ comparable 
perforamnce with _OPT_. We can also imagine that for _OPT_, resource 
augmentation has similar perforamnce, thus the online must be comparable]

= Why Resource Augmentation? 
- Allows us to bypass the worst-case scenario 

#thm[][
  The number of LRU misses is $<= 2 times var("OPT")(I)$ where 
  LRU runs with $2k$ pages and _OPT_ with $k$
]

#nt[Proof is similar to former proofs]

#proof[Proof for LRU Augmentation][
  Let us consider an arbitrary sequence of futures $I$. We partition 
  this block. 

  $
    {1,5,11,1, dots}
  $
  Let us split these into $2k$ distinct pages. For any block, consider
  the number of misses from both _OPT_ and _ALG_.
  - #[*_OPT_ analysis.* In the offline cache there are $k$ pages. If its lucky,
  $k$ pages are added to the cache. This leaves, by dfn of the block, 
  $k$ remaining pages that weren't added, resulting in a miss. Thus, 
  there are $>= k$ misses per block. ]
  - #[*_ALG_ analysis.* We argue that _ALG_ makes $<= 2k$ misses. By 
definition of LRU, and the old-new page system. We will never miss on the same 
page within a block, but since there are $2k$ pages, then we can potentially 
miss _every_ time]
    - #[]
  Thus, asymptotically, the ratio is 2. 
]

#nt[LRU Cache is a reasonable alg because it will perform twice as worse 
as _OPT_ in any time]

#unit[FPT Algorithms][

#let data = (
  [SLEEP DEPRIVATION], [ALGS], [OS], [VERIF]
)

#align(center + horizon)[
#figure(
canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: red.lighten(70%),
    stroke: red.lighten(70%))

  tree.tree(
    data, 
    direction: "up",
    spread: 4, 
    grow: 3, 
    draw-node: (node, ..) => {
      circle((), radius: 0.75, stroke: none)
      content((), node.content)
    }, 
    draw-edge: (from, to, ..) => {
      line((a: from, number: .9, b: to),
          (a: to, number: .9, b: from), mark: (start: ">", end: ">"))
    }, 
    name: "tree")

  // Draw a "custom" connection between two nodes
  // let (a, b) = ("tree.0-0-0", "tree.0-0-1",)
  // line((a, .6, b), (b, .6, a), mark: (end: ">", start: "|"))
}),
  caption: [week 9])
]


]
#chap[Preview of Second Half for Class]
= Motivation: Solving Computationally Hard Problems
- #[Imagine we had a very hard problem to solve, perhaps one that is 
NP-complete.]
- #[...What compromises can we make in order to "solve" the problem?]
  - #[We can find the _exact_ answer $arrow.l.r$ #text(red)[compromise on time]]
    - #[Exact algorithms]
  - #[We can _approximate_ the answer $arrow.l.r$ #text(green)[save on time]]
    - #[Approximation algorithms]
  - #[We can _reduce_ the problem as to focus on a particular parameter, rather than the entire 
  input size $arrow.l.r$ #text(green)[save on time]]
    - #[Fixed Parameter Tractable Algorithms]

Here's kind of the itinerary of algorithm analysis for reference lol 
= Fields of *Algorithm Design and Analysis*
== Undergraduate Algorithms
  - #[Basically just looking at general solutions to non-computationally 
difficult problems]
  + #[*Greedy Algorithms*]
  + #[*Divide and Conquer*]
  + #[*Dynamic Programming*]
== First Half of 496: 
  - #[Basically just looking at new approaches to solving these problems 
  in order to save space and time, as well as how to optimize the solution 
  in uncertain situations]
  + #[*Randomized Algorithms*]
  + #[*Streaming Algorithms*]
  + #[*Online Algorithms*]
#text(green)[== Second Half of 496]
  - #[*How can we solve computationally-hard problems?*]
  + #[#text(green)[*Fixed Parameter Tractable (FPT Algorithms).*]]
  + #[#text(green)[*Approximation Algorithms.* ]]
    - #[*Intuition.* We can't _exactly_ solve this problem in polynomial time.
    So let's just find an answer that is slightly worse than the optimal.]
      - #[Similar to online algorithms, since we just care about cost]
      - #[Emphasis on speed over correctness]
  + #[#text(green)[*Exact Algorithms.* ]]
  + #[#text(green)[*Beyond worst-case Analysis of Algorithms.*]]

Definitions will be revealed...

#pagebreak()
#chap[FPT Algorithms]

= Motivation 
#rmk[Techniques for Solving Computationally-Hard Problems][
  One of the ways that we can solve computationally-hard problems 
  is to utilize FPT (Fixed Parameter Tractable) algorithms. These algorithms 
  are an alternative to *approximation algorithms*, which compromise 
  correctness for speed. In the case of FPT, we will see that they make 
  no compromises on correctness for speed.
]
- #[If computing the problem over an _entire_ input space is too 
costly... what if we compute the answer utilizing smaller subproblems?]

= Motivation (cont'd): DNA Strand Length Problem
#nt[This problem isn't the _perfect_ situation for utilizing FPT, since 
this is a polynomial time problem that we're just reducing to constant time, 
whereas the typical FPT problem is reducing an exponential time of $n$ problem 
into an exponential time of $k$ problem.]
Let us consider the following problem: 
#qt[Consider two strands of DNA. Align the two strands of DNA with the minimum
  possible cost (ie, with the minimum number of gaps $delta$).]
  - #[*Typical Solution.* We would just apply a two-dimensional dynamic 
  programming algorithm.]
    - #[But what if a $n^2$ complexity was too slow? ]
    - #[What if we knew that 
    we just wanted to see if an alignment existed for $k$-cost?]

  - #[*Optimization.* Instead of calculating all alignments of all costs 
  for DNA strands, attempt to generate the alignments to some threshold
  $k$, thus we bound the number of computations by $k$.]

#[The focus of FPT algorithms is to fix some parameter $k$, which we can derive
based on the problem's input, or as a desired result of the problem. By 
fixing a parameter $k$, we can then design an algorithm that calculates 
over $k$, thereby reducing the overall complexity, while still preserving 
correctness.]

= Defining FPT Algorithms
#dfn[Fixed Parameter Tractable (FPT) Algorithms][

  FPT Algorithms are algorithms whose asymptotic running time is upper-bounded 
  by the exponential function of a _specific parameter_ $k$ of the problem. In practice, 
  running time is represented as this exponential function $f(k)$ multiplied by a polynomial of 
  the input size $n$.
  $
  f(k) times var("poly")(n)

  $
]
== The Inputs in More Detail
  - What is $k$?
    - #[$k$ is some parameter of the input or the solution. $k$ is unique to the 
problem] 
  - What is $n$?
    - The size of the input to the problem.

= Examples of Problems that Can Be Optimized Using FPT 
+ Hamiltonian Paths 
+ $k$-paths (parameterized by $k$)
+ Feedback Vertex Set (parameterized by $k$)

= Motivating Problem 1: Hamiltonian Paths 
#qt[*Problem Statement.* Suppose we have a graph $G$ that is unweighted. Find a path that visits 
every vertex exactly once.]

#nt[We will get back to this one, since this one is a little difficult-- 
first discuss the $k$-paths problem ]

= Motivating Problem 2: $k$-Paths (AKA Longest Simple Path)
#qt[*Problem Statement.*  Given a graph $G$, determine if there exists a simple 
  path of $k$ vertices in $G$.]
- #[Evaluating the $k$-paths problem $=>$ We can solve the hamiltonian path 
problem]
== Naive Solution 
- #[*Solution 1*. Calculate all subsets of $k$ vertices and just determine 
if there exists a path $P$ between them.]

- #[*Solution 2*. Starting from any vertex $v in G$, just perform a breadth-first
search to see if there exists a valid $k$-path.
]

- *Analysis.* Let us consider Solution (1). 
  - Given a graph $G$ such that $G$ is $Delta$-regular: 
    - #[(suppose that $Delta approx n$ or $Delta approx sqrt(n)$)]

  - #[*Runtime.* $O(Delta^k)$, since we exhausively search all 
  paths of $k$ vertices for each vertex]
  - #[Clearly not FPT, since $Delta^k approx n^k$]


#qt[Given our naive solution, can we do better?]

#[Yes! We can improve our exponential, naive algorithm by 
utilizing the FPT framework. We can do this by utilizing the 
*color coding* technique.]

== FPT Solution
#rmk[$k$-paths Problem][
  The graph $G$ in the problem is _unweighted_ and _undirected_. 
]

#[*Intuition.* If we can somehow transform $G$ into a directed 
graph, then we can evaulate the problem utilizing *dynamic 
programming*.]

- #[Without DP, we were essentially just enumerating all possible 
combinations of the vertices and verifying them, which is _slow_]
- #[By color coding the graph, we are able to filter out some combinations 
and make the verification process faster]
#dfn[Color Coding][
  Technique in which, given $G$, pick some $k$ colors s.t., and then 
  color all vertices $1, dots, k$ at random (independently + uniformly)

]

Let us now consider a basic usage of the color-coding technique, and 
then a more difficult one that optimizes it. 

= Evaluating $k$-Paths via Basic Color Coding 
- #[This algorithm is going to inherent the "randomization" aspect of our 
naive algorithm by randomly selecting $k$-element combinations, but will 
now utilize *dynamic programming*, due to the added coloring]

- *Algorithm.* Given a graph $G$:
  + Color $G$ using $k$ colors (enumerated as colors ${1, dots, k}$)
  + #[Based on this coloring, determine if a good path exists by 
randomly selecting $k$-element subsets of vertices]
    - ie, determine if there exists a path of colors $1->2->dots->(k-1)->k$
    - we can do this part using dp 


#nt[This algorithm only works if the $i$th vertex receives the $i$th 
color.]


== Algorithm In Detail
- *Intuition.* Split the graph into layers based on colors $1, dots, k$
  - #[1-dimensional DP]
  - #[Utilize dynamic programming in order to demonstrate if there exists 
a path from $1$ to $k$]

- For each layer: 
  + #[Mark the $i$th layer (or $var("dp")_i$) as reachable if and only if the vertex that precedes it 
is reachable]


#[
#let side = 14pt
#let dpRow = stack(
      dir: ltr,
      rect(width: side, height: side, inset: 3pt)[1],
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side, inset: 3pt)[$dots$],
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side, inset: 3pt)[$k$],
    )

#let dpRowE = stack(
      rect(width: side, height: side, inset: 3pt),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side, inset: 3pt),
      rect(width: side, height: side),
      rect(width: side, height: side),
      rect(width: side, height: side, inset: 3pt),
    )


#align(center)[
  #v(1cm)
  #figure(
    stack(
      dpRow,
    ),
    caption: [DP Table for the Longest Simple Path Problem]
  )
  #v(1cm)
]
]

== Algorithm Analysis
#[We derived, by definition of the algorithm, that for 
any combination of $k$-vertices, it will take $k$
iterations to determine if its good.
]

- #[That being said, however, how many graph colorings/repetitions do we have 
to try in order to get the answer? ] 

#[In order to evaluate this, we consider the probability that we're going 
find a good path.]


#thm[Probability of Good Path][
  The probability that, for a path of length $k$, the $i$th vertex 
  has the correct corresponding color $i$ is given by 
$
Pr[i"-th vertex gets color " i "for" {1, dots, k}] = (1/k)^k = 1/k^k
  $ <gp1>
  at the lowest bound.
]
#nt[This probability is the *worst-case bound*, which occurs 
assuming that there is only one path. If there are multiple paths, then it's better for us. ]

#[We are able to use @gp1 in order to determine approximately how many times 
we will have to run the algorithm (coloring and all) in order to obtain the 
answer.]

#clm[The maximum number of repetitions (of the algorithm) required to find the solution 
  is $approx k^k$ (ofc there's $k^k$ different combinations).]

#[Even though we have a bound on how many combinations we need to reveal 
the answer, we can concisely narrow down how many repetitions we need 
to guarantee that we find a path of $k$-colors]

== Making the Bound of Repetitions More Accurate
Let us now consider the failure bound of this algorithm (ie, the probability 
that we aren't able to find a good-colored path). In this case, we let 
$delta$ be this failure bound. 

#clm[The total number of repetitions $t$ of the Basic Graph Coloring Algorithm in 
order to evaluate the $k$-paths problem is $t approx k^k times ln(1/delta)$.]

#proof[Proof to Claim][
- #[$"Let" delta "be the probability that we aren't able to find a path" P "of length " k $]
- #[$"Let" p "be the probability that a path" P "of length" k "is good"$]
- #[$"Let" t "be the number of repetitions"$]

$
Pr["after" t "attempts" exists.not "path P of length" k] &= (1-p)^t \

Pr["after" t "attempts" exists.not "path P of length" k] &<= delta  \ 

(1-p)^t &<= delta  \ 
ln((1-p)^t) &<=  ln(delta) \ 
t times ln(1-p) &<= ln(delta) \ 
approx t times (-p) &<= ln(delta) \ 
approx t  &>= ln(1/delta) / p \ 
approx t &>= ln(1/delta) / (1/k)^k \ 
approx t &>= ln(1/delta) / (1/k^k) \ 
approx t &>= k^k times ln(1/delta)\ 
$ <naive1>
Given @naive1, we observe that the number of repetitions needed to 
  guarantee that we find a path-$P$ of length $k$, as required.
]
Now, we can make some claims about the true runtime of the FPT algorithm, 
based on the definition of FPT. 

#clm[The total runtime of the basic color coding FPT algorithm is 

$
  k^k times ln(1/delta) times O(m) &= \ 
  &= O(k^k). 
$
]

#proof[Proof][We already know that the number of repetitions of the 
algorithm required in order to find a good path $P$ of length $k$ is 
  given by $k^k times ln(1/delta)$. We simply add on the new fact:

  #align(center)[
    #v(0.5cm)
  _during each repetition though, the 
  amount of time that it takes in order to verify that the path 
    is a good path is $var("poly")(n)$, which we will denote as 
    $O(m)$._
    #v(0.5cm)
  ]

  Thus, since we have to verify some $var("poly")(n)$ paths, 
  as well as $k$ nodes for each path with probability $(1/k)$,
  then we know that the totla runtime must be 
  $
  = &f(k) times var("poly")(n) \ 
  = &k^k times ln(1/delta) times O(m) \ 


  $ <pr35a>
  as required.
]


Although it may seem like we're done with this problem... as with all 
CS problems...
#qt[...how can we improve this algorithm?...]

= Evaluating $k$-Paths via Advanced Color Coding
#rmk[Complexity of Naive Color Coding][
  The asymptotic time complexity of the FPT $k$-Paths solution using 
  basic color coding was $k^k times ln(1/delta) times O(m) = O(k^k)$.
]
#qt[...how can we do better...?]

= Algorithm Intuition (Advanced Color Coding)
#[*Intuition.* In our new solution, we hope to improve the runtime 
of the original algorithm by increasing the probability of success by 
_loosening_ the constraint of a good path.]
  - #[In this case, we will be loosening the constraint of a good path 
  by simply making a good path equivalent to a path in which all 
  $k$ vertices have distinct colors]

= Algorithm Design (Advanced Color Coding)
- Given an unweighted, undirected graph $G$: 
  - Color each vertex $v in V$ uniquely
  - #[Determine if $exists$ a good path $P$ in the resulting $k$-colored graph 
  using dynamic programming]
    - #[A $k$-length path $P$ is good if and only if all $v in P$ 
    have distinct colors]

= Algorithm in Detail (Advanced Color Coding)
- Given a fixed color $u$, find $var("path")(u, cal(S))$ where $cal(S) subset.eq {1,dots,k}$
  - We want each path to have only one vertex of each color in $cal(S)$
  - We can use $S$ in the original problem

- The space of the DP will be $2^k times n$ (FPT) (still way better than $n^(log(n))$)
  - Visit all neighbors $v$
  - We know that $var("path")(u, cal(S))$ exists if 
    - $exists v in var("nei")(u$  where $var("path")(v, cal(S) / var("color")(u)$ exists 
    - where, of course, $var("color")(u) in cal(S)$

- We would need to repeat this algorithm $e^k times log(1/delta)$
- Runtime is  $e^k times log(1/delta)$ multiplid by runtime of dp



= Algorithm Analysis (Advanced Color Coding)
#clm[The probability that all colors in a $k$-length path $P$ are distinct 
is $(1/e)^k$.]

#proof[Proof][
  Let us first consider the probability of the event in which all colors 
  in $P$ are distinct, then we bound it more precisely. 

  #par[We know that for any path, there are $k^k$ possible ways 
  to choose each vertex distinctly for a path that is $k$ elements long. 
  We also know that there are $k!$ permutations of 
  $k$ distinct elements. Thus, 
    $
    &Pr["all colors in" P "are distinct"] = \
    &= ("num possible" k "color perms") times Pr["all elements in" P "are distinct"] \ 
    &= k! times (1/k)^k = k!/k^k
    $ <p39>
]

Based on @p39, we demonstrate that $Pr["all colors in" P "are distinct"] = k! / k^k$. We can 
better bound this probability by utilizing Stirling's Inequality. 
  #rmk[Stirling's Approximation][
    $
    n! tilde.op sqrt(2pi n) times (n/e)^n
    $
    which, we can simply just regard as 
    $
    n! tilde.op (n/e)^n
    $
  ]
Using Stirling's Approximation, 
$
Pr["all colors in" P "are distinct"] &= k! / k^k \ 
&approx.eq (k/e)^k / k^k \ 
&approx.eq (1/e)^k
$ <prf39a>
  Based on our calculations in @prf39a, we determine that the probability that all 
  colors in $P$ are distinct is $(1/e)^k$, as required.
]

From here, we are able to utilize the same calculations as in @pr35a in order to 
demonstrate that the runtime of the Optimized Graph Color-Coding FPT solution is 
$(1/e)^k$.

#clm[The runtime of the Optimized Graph Color Coding FPT solution is 
  $
  e^k times log(1/delta) times O(m) = O(e^k).
  $
]

#proof[Proof][Utilize the same calculations as in the basic graph color coding FPT solution.]


#pagebreak()
#chap[FPT Algorithms (Part 2) (05/16/24)]
= Reminders 
- For HW3 
  - Questions about Q1 
    - #[Aim is to show that if you don't use a randomized routing approach, then delay suffers 
    and will be $O(d)$ with high probaiblity and worsens exponentially]
    - #[Demonstrate that $O(k)$ for randomized approach and $Omega(2^k)$ for 
    the naive/greedy approach]

    - We want to find the *optimal* algorithm for Q2 
    - ie, the most optimal _deterministic_ and _randomized_ strategies
  - For Q3
    - We want a 2-competitive algorithm (ie, the competitive ratio is $1/2$)
- Homework 03 is due Friday (with extension to Monday)
= Remark 
  - #[We previewed the color-coding technique in the last lecture:]
#rmk[Color-Coding FPT Algorithm][We can utilize two variants of color coding: 

  - #[*Basic.* We color the graph randomly, determining that a good path 
was one in which all vertices $v_1, dots, v_k in P$ were colored 
$1, dots, k$.]
    - #[Time complexity of $(k^k times ln(1/delta) times O(m))$]

  - #[*Optimized.* We color the graph randomly, determining that a good 
path was one in which all vertices $v_1, dots, v_k in P$ were colored 
_distinctly_.]
    - #[Time complexity of $(e^k times ln(1/delta) times O(m))$]
]
= Outline of Lecture
#[Today's lecture, we basically just finished up the discussion on FPT 
algorithms. We first revised the FPT algorithm for the $k$-paths problem 
as well as how to apply it to the Hamiltonian-path problem. Then we discussed 
a new problem that can be optimized utilizing FPT algorithms:

  - #[Vertex Cover]
    - #[Utilizes a technique called _kernelization_ in order 
to solve]
which we then just used to motivate approximation 
algorithms, which 
offer us a different insight on solving the problem. 
Finally, we concluded
this lecture by discussing the *set cover problem* which 
we also evaluate using 
approximation algorithms.]
= Vertex Cover Problem 
== Introduction to Kernelization 
*Kernelization* is a technique that is employed with 
FPT (or generally parameterized) algorithms.

#par[The primary intuition about kernelization is that 
we want to be able to take a problem, which we will denote as 
$Q$, and make an argument about an equivalent problem, of which
we can make the same argument about the original problem.]

\

#nt[Honestly, sounds a little fake, but as with most combinatorics/
discrete math-related arguments, it works.

#qt[
    ...(the "probabilistic method" is another fake argument btw)...
  ]
]

#par[In kernelization, we call equivalent problems _instances_.]
== Defining Kernels

Not to be confused with _literally every other definition 
of a kernel in computer science_, kernelization is a _paradigm 
for solving parameterized problems_.


#par[From _Parameterized Algorithms_ by 
Fedor V. Fomin and Lokshtanov:]

#dfn[Kernelization][
  A _kernelization algorithm_, or simply a kernel, for a 
  parameterized problem $Q$ is an algorithm $cal(A)$ that, 
  given an instance $(I, k)$ of $Q$, works in polynomial 
  time and returns an equivalent instance $(I', k')$ of 
  $Q$ (Fomin et. Lokshtanov).


]
  #nt[It is required that size $(k)_cal(A) <= g(k)$
  for some computable function $g: NN -> NN$. We can 
  essentially think of $g$ as some computable function 
  on $k$.
  ]

#dfn[Reduction Steps][
  A reduction rule for a parameterized problem $cal(Q)$
  is a function $phi.alt$ such that 
  $
  phi.alt: Sigma^* times NN => Sigma^* times 
  NN
  $ 
  maps an instance $(I, k) in Q$ to an equivalent 
  instance $(I, k')$ of $Q$ such that $phi.alt$ can 
  be computed in $|I|$ and $k$ time. 
]

#thm[Safe and Soundness Rule][
  We state that two instances of a problem $Q$ are 
  equivalent if $(I,k) in Q$ if and only if $(I, k') in Q$

]

Essentially, we can think of kernelization algorithms as 
algorithms that utilize _reduction rules_ in order to 
reduce the a problem instance it into its "computationally
difficult 'core' structure". 

- #[In other words, kernelization just algorithmically 
reduces a problem down into simpler instances until we reach
the crux of the problem. We do this to make finding the 
true answer easier and more systematic.]



== Introduction to Vertex Covers 

=== Definitions 
#[In order to evaluate this problem, we first need 
a notion of what exactly a vertex cover is. ]

#dfn[Vertex Cover][Given a graph $G = angle.l V, E 
  angle.r$, a *vertex cover* of $G$ is a subset of 
  vertices $cal(S) subset.eq V_G$ that includes all 
  unique endpoints of every edge in $G$ at least once. 

  Mathematically, this can be denoted as
  $
  "cover"(G) = [S subset.eq V_G | forall (u,v) in E_G (u in cal(S)) or (v in cal(S))
  or (u, v in cal(S))]
  $

  #[For the purposes of the problem and its corresponding FPT 
  algorithm, we will let $(G^((i)), k^((i)))$ represent the $i$th 
  vertex cover (in the sequence of generated vertex covers) of 
  size $k$.]
  
]
=== Example
*Example 1.* Here is a 2-graph: 
#let data = ([Dmitrii], [Konstantin])
#align(center + horizon)[
#figure(
canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: red.lighten(70%),
    stroke: red.lighten(70%))

  tree.tree(
    data, 
    direction: "right",
    spread: 2, 
    grow: 3, 
    draw-node: (node, ..) => {
      circle((), radius: 0.85, stroke: none)
      content((), node.content)
    }, 
    draw-edge: (from, to, ..) => {
      line((a: from, number: .95, b: to),
          (a: to, number: .95, b: from), )
    }, 
    name: "tree")

  // Draw a "custom" connection between two nodes
  // let (a, b) = ("tree.0-0-0", "tree.0-0-1",)
  // line((a, .6, b), (b, .6, a), mark: (end: ">", start: "|"))
}),
  )
]
$G$'s vertex cover could be 
  $
    &var("cover")(G) = {"Dmitrii"} \
    or &var("cover")(G) = {"Konstantin"}
  $

since the edge that "Dmitrii" and "Konstantin" are incident to 
also connects their neighbor "Dmitrii" and "Konstantin," respectively.

#nt[If it wasn't clear, we just want the vertices such that 
the connected edges to these vertices connects all of 
the other edges in the graph.]

= #sc[Minimum Vertex Cover] Problem Statement
#pb[#sc[Miminum Vertex Cover] Problem][Given a graph $G = angle.l V, E angle.r$, find 
  the minimum size vertex cover.  ]


= FPT Algorithm Approach
#rmk[FPT Algorithms][FPT algorithms are algorithms that are able to 
  minimize the runtime of an NP-hard problem. They do this by 
  reducing the exponential time $O(c^n)$ to one that is dependent on some 
  parameter $k$. The runtime of such algorithms is defined as: 
  $
  f(k) times var("poly")(n)
  $
  where $k$ is some _fixed parameter_ of the problem (which is problem/instance-
  dependent) and $n$ is the size of the input/universe.
]

== Algorithm Intuition 
In our FPT solution for the Vertex Cover problem, we employ 
_two_ reduction steps that, informally: 

  + #[Eliminate all _unnecessary vertices_ from the problem space
and the solution]
  + #[Add all vertices that are _guaranteed_ to be in the solution.]

#nt[Given that we are restricting the input space to a constant 
$k$ which is fixed, we are able to freely perform a _brute
force_ algorithm on the input space, since it'll always 
be upper bounded by an algorithm on $n$.]

== Algorithm Design
#[Given the vertex cover problem, which we will denote as a problem 
$cal(Q)$, we define the two following reduction rules for 
an instance $(G^((i)), k^((i)))$, where $(G^((i)), k^((i)))$
is defined as the $i$th vertex cover of $G$ that is of 
size $k$.
- #[*Reduction Rule 1.* If the $i$th vertex cover on $G$ of size $k$ possesses 
an isolated vertex $v$, then remove $v$ from the graph. The 
new instance is represented as $(G-v, k).$]
- #[*Reduction Rule 2.* If there exists a vertex $v in G^((i))$ such that 
$var("deg")(v) > k^((i))$, then delete $v$ and its incident 
edges from $G$ and decrement the parameter $k$ by 1. The resulting 
instance is $(G-v, k-1).$]

#[We observe that Reduction Rule 2 really just follows from the following 
claim:  
#clm[If $G$ contains a vertex whose degree is at least $k$,
then $v$ should be in every vertex cover of size at most $k$.]
]
 
Utilizing these two reduction rules we perform the following 
algorithm:  
#v(0.5cm)
```
while kernel K is a valid cover 
  randomly choose k or k' vertices 
  if k or k' vertices are a valid vertex color do 
    continue
  end

  return
end
```
#v(0.5cm)

]

- #[2 Instances]
  - #[We want to use some reduction steps]
  - #[Guarantee that if the original instance has some solution of $k$, then 
  all other instances should have such a solution.]
  - #[Likewise, if we know the solution for various instances, then we know 
  the solution to global]
  - #[Instances will have a size of $k$ (in the context of this problem, 
we shall use size $k^2$)]

- Overview 
  - #[Utilize a sequence of reductions that reduce teh global problem into 
  variuos instances/sketches]
    - #[We call these smaller instances of the problem _kernels_, such 
    that the size of each kernel is $<= g(k)$]
    - #[With these kernels, we can utilize a _brute force algorithm_]
      - #[Randomly choose $k$ or $k'$ vertices and just verifying if 
      they're a valid cover]
      - #[This is fine because the algorithm is dependent on $k$, rather 
      than $n$]
      - #[Exponential on $k$]
      - #[We want to utilize an inductive argument, as if there's a solution for 
one kernel of size $*$, then it should hold for the next, etc.]

#nt[Why is this better than greedy?...]

#rmk[Kernelization][]

== Argument Outline
We utilize *two rules*:
+ #[If $(G^(i), k^(i))$ (the $i$th vertex cover of size $k$) has 
isolated vertices, then remove them]
  - #[This doesn't affect the instance-- since there would never 
  be a reason why we would want to keep them, since they won't affect 
  the result]
#nt[Duh, why would include vertices that don't matter?]
#nt[This is recursive. We will use the $(i-1)$th vertex cover in order 
to derive the $i$th vertex cover]
+ #[If there exists a vertex $v in G^i$ such that $var("deg")(v) > k^i$,
then we will add $v$ to the solution and remove $v$ and all 
edges incident with it from $G$]

#nt[If we have many edges that are incident to $u$, then just 
remove $u$ and all edges that are incident with it. This will 
result in various isolated vertices, which can be removed by rule (1)]

== ...why does this work?
#todo()
#rmk[][We want a solution that is of cost at most $k$. If there's 
a good vertex candidate-- just remove it since we know it must 
be in the answer (or a valid answer).]
=== Recurrence Relation 
$
G^((i+1)) = &(G^((i)) - u) \ and (&k^((i+1)) = k^((i)) - 1)
$

#[There must be $k^i$ edges incident to $u$. If not, then we would _eventually_
remove the other vertices-- which wouldn't be optimal.
]

- #[If there are multiple vertices $v_i$ that are incident to $> k^(i)$ edges,
then we just remove all of them.]

+ #[If we can't apply rule (1) or rule (2):]
  - #[If graph $|G^i| > (k^((i)))^2$, then _there is no solution_]
  - #[Why is this the case?]

#clm[If $G$ has $2^k^2$ vertices $->$ the number of edges in 
$G>k^2$. If there exist a vetex cover of size $<= k$, then it cuases $G <= k^2$
edges]

#unit[Approximation Algorithms][#figure(
  image("./img/stonks.png"),
  caption: [\$FFIE TO THE MOON],
  )]

#chap[Approximation Algorithms]
= Citations 
+ #[_Approximation Algorithms _ (Vijay V. Vazirani)]
  - Chapters Referenced 
     + Chapter 1 (#sc[Introduction])
      - #sc[An approximation algorithm for cardinality vertex cover ] (page 3)
     + Chapter 2 (#sc[Set Cover]) (pgs. 15-26)
     + Chapter 14 (#sc[Rounding Applied to Set Cover]) (pgs. 119-124)
+ #[UW CSE 421: Introduction to Algorithms]
  + #[Lecture 23: Approximation Algorithms (Set Cover)]
+ #[CMU 15-451/651: Design and Analysis of Algorithms]
  + #[Lecture \#17: Approximation Algorithms]

= Introduction 
In this new section, we consider the design and analysis 
of *Approximation Algorithms*, which is another 
field of algorithms that tackles the issue of evaluating 
NP-hard and NP-complete problems with "good-enough" 
accuracy in polynomial time. 

#rmk[Motivation for Approximation Algorithms][We want 
  to study approximation algorithms 
because they provide a polynomial time way of computing 
NP-hard problems.]
#dfn[Approximation Algorithms][#[Approximation algorithms are 
  algorithms that both maximize a *cost ratio* as well 
  as a *value ratio* such that 
  $
  "Cost Ratio" = var("ALG")(I) &<= alpha times var("OPT")(I) \
  "Value Ratio" = var("ALG")(I) &>= alpha times var("OPT")(I)

  $
  where $alpha$ is the _approximation factor/ratio_ such that 
  $alpha <= 1$, and we strive for $alpha$ to be as close to 1 as 
  possible.
]]

#nt[Whenever we discuss Approximation Algorithms, we will 
consider each algorithm based on their $alpha$ factor. For 
  an approximation algorithm _ALG_ that has an approximation 
  factor of $alpha$, then we consider that algorithm 
  to be $alpha$-approximate. 

  Additionally, we will also consider algorithms of 
  paritcular $alpha$-approximate ratios. For example, 
  we might discuss 2-approximation algorithms.
  + #[2-approximation algorithms]
]

= (Re-)Introduction to the #sc[Minimum Vertex Cover] problem 
#rmk[FPT Approximation Solution for #sc[Minimum Vertex Cover]][]
#todo()


#[Now that we have some exposure on how we can _FPT reduce_
the #sc[Minimum Vertex Cover] problem in order to get 
an exact solution in $f(k) + var("poly")(n)$ time, let 
us now analyze various _approximation algorithms_
techniques for evlauating the #sc[Minimum Vertex Cover]
problem. 

]

== #[Approximation Strategies for #sc[Minimum Vertex Cover]]
+ #[*Strategy 1.* Greedy Approximation]
+ #[*Strategy 2.* LP-Relaxation Approximation]

= #[Strategy 1: Greedy Approximation Algorithm (#sc[Minimum 
  Vertex Cover])]
#[This section discusses the Greedy Approximation Algorithm 
strategy for evaluating the #sc[minimum vertex cover] problem.]

#[As with most greedy algorithms, we can sum up the behavior 
of this algorithm as simply just adding vertices $v in V(G)$
as long as there exists an uncovered edge that is incident 
to it. ]

== Algorithm Intuition (#sc[minimum vertex cover])
#int[If we pick an arbitrary edge $e in E(G)$, then we know 
that any vertex cover $var("cover")(G)$ must contain 
at least one of the endpoints of such an edge. Thus, 
  add both endpoints to the solution, remove all edges covered
  by these endpoints, and repeat.]

Here is the pseudocode for the Greedy Approximation Solution: 

#line(length:100%)
```pseudocode
while exists (u,v) in E(G) such that (u,v) not covered by S do 
    S.add(u)
    S.add(v)
    remove all (m, n) in E(G) covered by S
end
```
#line(length:100%)

Again, it is important to note that we are essentially doing 
the following 
+ #[We iterate through all remaining edges in $G$] 
  + #[If there is an edge in which at least one of the endpoints 
  does not exist in $S$, then we just add the endpoints]
  + #[Then, based on the new vertex cover $S$, remove all edges 
  from the graph $G$ that are now covered by $S$]


== Analysis (#sc[Minimum Vertex Cover])
#[We find that based on the design of the algorithm, we 
arrive at the following performance claim: 
Claim
]



#clm[
  #[Using the greedy approximation algorithm for the 
  #sc[Minimum Vertex Cover] problem, we find that 
the algorithm is 2-approximation. Mathematically: ]
  $
  var("ALG")(I) <= 2 times var("OPT")(I)
  $
]

#todo()

#proof[Proof][
  _ALG_ considers edges $(u,v), dots, (u_k, v_k)$
  $
  u_i = u_j \ 
  var("OPT")(S) >= k \ 
  var("ALG")(S) = 2k
  $
]

= Problem 2: #sc[Set Cover] Problem 
#[In this section, we pivot to a new problem, the 
#sc[Set Cover problem], which is a fundamental problem that 
is one of the fundamental problems of approximation 
algorithms.]

Here is the problem statement: 
#pb[#sc[Set Cover]][
  Given a universe $Omega = {u_1, dots, u_n}$ and a collection of subsets 
  $cal(S) = {S_1, dots, S_2}$ where $S_i subset.eq Omega$ for $1 <= i <= n$,
  find a minimum-size subcollection of $cal(C) subset.eq cal(S)$ such that 
  $
  union.big_(S_i in cal(C)) S_i = Omega
  $]

#thm[][The $ln(n)$-approximation algorithm for $n = |Omega|$.]
= Applications (#sc[Set Cover] Problem)
+ #[*Application 1.* Imagine that a company wants to hire 
candidates such that all required skills are covered]
+ #[*Application 2.* "Fuzz" testing in software]
+ #[*Application 3.* A manufacturer wants to get all 
items from different suppliers at minimum cost ]

= Algorithm Strategies (#sc[Set Cover Problem])
+ #[*Strategy 1.* Greedy Strategy]
+ #[*Strategy 2.* Linear/Integer Programming Strategy]

#todo()

= Greedy Approach Intuition (#sc[Set Cover Problem])
#int[
  Pick the set that maximizes the number of *new* elements 
  covered by the set cover of $G$, denoted as $var("cover")(G)$
]

Here is the algorithm's pseudocode:
#line(length: 100%)
```
while (v_t != 0) 
  find S_i that covers most elements in U_t
  add it to the solution
  v_t+1 = v_t \ S_i
  t = t + 1 
```
#line(length: 100%)

= Greedy Approach Analysis (#sc[Set Cover] Problem)
Given the greedy approach, let us make the following claim: 

#clm[The greedy approximation algorithm for the #sc[Set Cover] problem 
gives an $O(ln(n))$ approximation of the optimum.]
#clm[If _OPT_ $= k$, then the greedy approximation algorithm 
_ALG_ will find at most $k times ln(n)$ sets.]

#let colred(x) = text(fill: red, $#x$)
#let colbl(x) = text(fill: blue, $#x$)
#proof[Proof for Greedy Approach Approximation][
  #[Let $var("OPT") = k$, where $k$ is a number of sets (ie, the minimum
  number of sets in order to construct a full set cover of $G$).
  Additionally, let $n$ represent the number of elements in the 
  universe $Omega$.]

  + #[Since we know that $var("OPT") = k$, then 
  there must exist a set of vertices that covers at least $1/k$-th of 
  the remaining elements. ]
    + #[We know that in order for $k$ sets to cover all $n$ elements 
  in the universe $Omega$ that there must be on average $n/k$ elements 
  per set. ]
    + #[In terms of $n$, this would mean that each set, 
    on average, contains $(n/k)/n = 1/k$th of the elements in 
    $Omega$.]
    + #[If each set did not have at least 
    $1/k$th of the elements in $Omega$, then $var("OPT") > k$, which is 
    false by definition of _OPT_.]

  + #[The first set that _OPT_ chooses, denoted as $S_1$ 
    will have a size of $>= n/k$. ]
    + #[By (1)(a), (1)(b), (1)(c)]
  + #[When _OPT_ picks $S_1$ such that $|S_1| >= n/k$, then 
  the number of remaining elements in the set must be 
  $n_1 <= n(1 - (1/k))$] 
     #text(gray)[- #[...where $n_1$ represents the number of elements 
  in the first state, after _OPT_ has removed elements from $Omega$ 
  in order to add them to first set cover $S_1$.]]
    + #[We can prove (3) using the following computation: 
  $
  ("num. elements remaining") &<= [colbl(("original num. elements")) \
  &bl - bl colred(("size of set cover after 1 iteration"))] \
  n_1 &<= [colbl(n) - colred(S_1)] \
  n_1 &<= [colbl(n) - colred(n/k)] \
  n_1 &<= n(1-1/k)
  $ <msc1>
      ]
  + #[After _OPT_ chooses its first set cover $S_1$ after a single 
iteration of the algorithm, then there must exist a set $S_2$ 
with at least $(n_1)/(k-1)$ elements.]
    #text(gray)[+ #[We can utilize similar logic to that in (1)(a-c)]]
    + #[Given that _OPT_ $=k$, then the average number of elements 
per set $k_i$ is $n_1/(k-1)$.]
    + #[Given that there are $n_1$ elements remaining, this implies 
that each set that _OPT_ can choose must be $(n_1/k)/n_1 = 1/k$]

  + #[After the second iteration $S_2$, then the number of remaining 
elements that are left uncovered, denoted as $n_2$ must be upper-bounded
by $n_1(1- 1/(k-1))$]
    + #[We simply just need to perform similar computations to @msc1
  $
  n_2 &<= [colbl(("num. elements in 1st iter")) - colred(("size of set cover after 2 iters."))] \ 
  &<= [colbl(n_1) - colred((n_1)/k)]
  $
]
$
  |V_2| &<<  (1-1/k) |V_1|  << (1-1/k)^2 times n   \ 
  |V_i| &<= (1-1/k)^i times n \
  (1-1/k)^(k ln(n)) &< 1/n




$

]

#pagebreak()
#chap[Approximation Algorithms Pt. 2 
  (05/17/24 Lecture)]
= Citations 
+ _Approximation Algorithms _ (Vijay V. Vazirani)

  - Chapters Referenced 
     + Chapter 1 (#sc[Introduction])
      - #sc[An approximation algorithm for cardinality vertex cover ] (page 3)
     + Chapter 2 (#sc[Set Cover]) (pgs. 15-26)
     + Chapter 14 (#sc[Rounding Applied to Set Cover]) (pgs. 119-124)
= Remarks 
- Homework 4 assigned (due 05/31/24)
  - Problem 1 is about LRU Cache 
  - Problem 2 is similar to the FPT problems discussed in class 
    - Discusses a problem about *Contracting Edges*
    #dfn[*Contracting Edges*][Given two connected vertices, 
we contract the edge between them by removing that edge between them 
and then treat both vertices as the same vertex]
  - #[Problem 3 is going to cover one of today's problems, the "edge-deletion 
  to make a graph triangle free" problem]

#nt[Today we are going to be discussing linear programmming (which will 
  be utilized in problem 3 on the homework)]

= Last Time 

#rmk[#sc[Set Cover] Problem][
  #qt[
    Given two sets within a universe $Omega$ such that $|Omega| = n$. 
    Assume that if we choose all sets that we will seleect all of 
    the elements within $Omega$
  ]
]

= Lecture Skeleton
+ #[#smallcaps[Weighted Set Cover] problem ]
  - Variation on #sc[Set Cover] problem 
  - Discuss traditional approximation algorithm solution 
  - Discuss _linear programming_ solution

+ #[Linear Programming] 
  - very informal definition in-class, formalities included post-lecture (thanks future-randy)

+ #sc[Minimum Triangle-Free Edge-Deletion] problem 
  - Discuss linear programming solution 


= #sc[Set Cover with Weights] Problem 


== Problem Statement (#sc[Set Cover with Weights] Problem)
#rmk[#sc[Set Cover] Problem][
  #qt[
    Given a universe $Omega = {u_1, dots, u_n}$ and a collection of 
    subsets $cal(S) = {S_1, dots, S_2}$ where $S_i subset.eq Omega 
    $ for $1 <= i <= n$, find a minimum-size subcollection of 
    $cal(C) subset.eq cal(S)$ such that]
  $
  union.big_(S in cal(C)) S = Omega
  $
]
#pb[#[Weighted Set Cover] Problem][Utilizing the #sc[Set Cover] problem, suppose now that each set 
  $S_i in cal(S)$  has a corresponding weight $w_i$. Find a minimum-size 
  subcollection $cal(C) subset.eq cal(S)$ in order to cover the universe $Omega$ while 
  minimizing the total subcollection's weight.
  $
  sum_(i) w_i : S_i subset.eq cal(C)
  $]

= Strategy 1: Layering Technique (#sc[Weighted Set Cover])
#[In this section, we note the *layering technique* for 
evaluating the #sc[Weighted Set Cover] problem.]
#int[Our basic strategy is to find the sets that cover the most amount 
of elements with the minimum possible cost. ]
#[The primary basis for this algorithm is to uitlize _induction_.
The premise here is to just demonstrate that after ]
- Determine that after $t$ steps, _ALG_ _does not_ cover 
$
e^(-w_t/var("OPT")) times n "elements"
$

This is pretty straightforward (supposedly lol)

However, we'll learn an alternative method utilizing *linear programming*

#rmk[Linear Programming][(will discuss next time)]

= Linear Programming/Integer Programming Approach
- But why use linear programming since there's another approximation approach? 
  - #[An LP interpretation of the problems can be solved via IP solvers, 
  which can be solved faster than a pure combinatorial approach]
    - #[A "good-enough" solution that can be solved in _polynomial time_]
  - #[We are able to "relax" the problem]
    - #[We can replace constraints to make the problem easier]


#nt[Our intuitoin is to think of our set as a set of _equations_]

We are now going to consider some indicator varaibles such that  

$ 
x_i = cases(
  1 "if" s_i "is in the solution", 
  0 "otherwise"
)
$
We want to minimize 
$
sum_(i) w_i times x_i
$ <sum1>

by the way of linear programming, we are able to add _linear constraints 
and equations_. 

Thus, for @sum1, we want to find all $u in Omega$, such that 
$
sum_(i : u in s_i) x_i >= 1 
$

The value of @sum1 would correspond to _some_ combinatorial solution, 
which is true since @sum1 is only true if $x_1$ corresponds to 1.

Let us now relax the problem such that $x in.not {0,1} $, but 
$x in [0,1]$ such that 
$
$

#dfn[Linear Programming (Informal)][A set of linear constriants on some 
  variables $x_1, ..., x_n$. 
THis is similar to linear equations (which contains equalities) such as 
$
  A times x  = B
$
  where $A$ is a matrix and $x$ is a set of variables 

whereas for linear programming, we have 
  $
  A times x >= B
  $
  with an additional constraint $angle.l c, x angle.r$ such that 
  $
  c^t times x = sum_(i) c_i x_i "where" x >= 0 
  $
]

If the non-LP interpretation of the problem is feasible by the original LP 
problem, it stays feasible by the LP-relaxed problem.

#thm[][The optimal value of the LP problem, denoted as _LP_,

  $
  var("LP") <= var("OPT")
  $
  where _OPT_ represents the optimal solution to the combinatorial problem.
]

#rmk[][_OPT_ in this case represents the _cost_ of the problem.]

We find that this is not going to be a big issue _unless_ _LP_ is significantly 
lesser than that of _OPT_ (integrality gap).

But how can we actually compare the solution of the LP problem with that 
of the combinatorial problem?
- We want to _encode_ the solutions of the combinatorial problem

= LP-Based Approximation Algorithm for #sc[Set Cover]
== Roadmap 
+ Solve the LP-problem 
  - *Obj.* Acquire $x_1, dots, x_m$ where $0 <= x_i <= 1$
  - But what exactly is a non-integral value of $x_i$?
    - Philosphically, we can think of it as a probability that $i$ is in the set 
+ Select $S_i$ in the solution with probability $(x_i times ln(n)) or 1$
  - Where $ln(n)$ is some multiplicative factor (that is usually small)
  - lol where did this come from 

+ Two Possibilities 
  - #[*Brute Force.* Be done here and repeat until a feasible solution is 
calculated (ie, 
all elements are covered)]
  - #[*Randomized Rounding Technique.* For any element $u$ that is uncovered, 
pick the cheapest set $S_i$ containing it and just add it to the solution]

== Approach
+ Set a feasible solution with probability 1 
+ Evaluate the probability that after 
$
&Pr(u "is not covered (after step 2)") = Pr(forall i, u in S_i "where" S_i "is not chosen") \ 
= &product_(i: u in S_i) Pr(S_i "is not chosen") \
= &product_(i: u in S_i) (1 - x_i ln(n)) \
$
Assume that any term $(1 - x_i ln(n)) >= 0$ 
$
&= product_(i: u in S_i) max(1 - x_i ln(n), 0) \
$
Using the inequality that $e^(-t) >= 1-t$, 

$
  &<= product_(i : u in S_i) e^(-x_i ln(n)) \
$

#[
#show math.equation: set text(size: 15pt)
$
  &<= e^(- sum_(i: u in S_i) x_i ln(n))
  &<= e^(-ln(n)) = 1/n
$
]

Let us now consider the cost of the LP solution

#rmk[][Cost of sets included in step 2]
$
&EE["cost at Step 2"] = (sum_i w_i times x_i) times ln(n) \ 
= &"LP" times ln(n)
$

#rmk[][Cost of sets included in step 3]
$
&EE["cost at Step 3"] <= sum_(u in Omega) Pr(u "is not covered (after Step 2)") 
times var("OPT") \ 
<= &n times 1/n times var("OPT") = var("OPT")
$

where $sum_i w_i times x_i$ is our linear program expression.


#nt[_OPT_ is not known by the algorithm. The algorithm doesn't need to know 
it in this case ]

= Minimum Triangle-Free Edge-Deletion Problem 
#pb[#sc[Minimum Triangle-Free Edge-Deletion]][Given a graph $G$, find the minimum number of edges needed 
  to make $G$ triangle-free.]

To remove any confusion, if we had a graph 
that had multiple triangles (ie, connected components containing 3 vertices),
we just want to remove the minimum number of edges to remove those 
connected components.

== Motivation
- #[Triangles are found constantly in _social networks_ for friend 
recommendation, since we would want to find vertices (people) who are 
adjacent to other people]

= Solution Approach (Triangle-Free Edge-Deletion Problem)
Here, we detail a linear/integer-programming based solution for the 
triangle-free edge-deletion problem. 

Let us first consider what exactly the solution to the equivalent 
LP-problem would actually represent. 

#clm[The solution to the triangle-free edge-deletion problem would be *the number 
of edges* that need to be deleted in order to make the graph triangle-free.]


== Linear Programming Construction (Triangle-Free Edge-Deletion Problem)
#rmk[Soln. for the Triangle-Free Edge-Deletion Problem][The solution to the 
  triangle-free edge-deletion problem would be *the number 
of edges* that need to be deleted in order to make the graph triangle-free.]

- Construct an LP for the problem 
  - #[Construct an indicator varaible that indicates whether or not we should 
delete an edge 
  ]

For an edge $e in E(G)$, we have the LP/objective function 
$ 
min sum_(e in E(G)) x_e : x_e in [0,1] "by our \"default constraint\""
$ <tri1>
Are there any other constraints that we can impose?  
+ For each triangle $(u, v, w)$, at least one edge _must_ be removed  
  - (such that $ (u,v), (u,w), (v,w) in E(G)$)

We can represent this as 
$ 
x_((u,v)) +  x_((v,v)) + x_((u,w)) >= 1 
$ <tri2>

thus, we utilize the objective function @tri1 with the new consraint @tri2. 

#nt[]

== Algorithm 
#algDfn[Triangle Deletion LP Algorithm][
+ Solve the LP to obtain the optimal set of edges 
+ Delete all edges $(u,v)$ with $x_((u,v)) >= 1/3$
]

By utilizing this algorithmic solution, we will _not_ obtain a feasible 
solution.

#nt[For the homework, you want to modify this algorithm to 
  achieve 
a better approximation]

== Discussing Feasibility of the Approximation Soluiton
#rmk[][there r triangles in the graph]
#[By our LP and its constraint, we know that for each edge, 
its can either be part of triangle(s) or not (ie, it must be 
either $>= 
1/3$ or $0$)]

== The Cost of the LP Solution
$
&m' def "# edges whose value is " >= 1/3 \ 
= &sum_((u,v) in E(G))
$
$
&= var("ALG") = m'  \  
&=var("OPT") >= var("ALG") >= m' / 3 \ 
&= var("LP") >= sum_((u,v) in E(G)) x_((u,v)) 
>= sum_((u,v) "is removed") x_((u,v)) >= m' times 1/3
$ <70> 

Thus by @70, $var("ALG") << 3 times var("OPT")$

= Next Time 
- LP-Duality

#unit[Dynamic Graph Algorithms][]

#chap[Graph Orienting]

