#set heading(
  numbering: "1."
)

#set math.equation(
  numbering: "(1)"
)

#align(center, text(32pt)[
  COMP_SCI 496: Graduate Algorithms Notes 
])

#align(center, text(16pt)[
  Randy Truong
])

#align(center, text(12pt)[
  26 April 2024
])

#show par: set block(spacing: 0.65em)
#set par(
  first-line-indent: 1em,
  justify: true,
)
#let var = math.italic

#pagebreak()
#outline()

#pagebreak()

= Chapter 0: A Prelude in Graph Theory and Combinatorics
#[This is a chapter that is devoted to Randy learning how 
graph theory works in finer granularity.]
== Subgraphs 
/ Subgraph: #[Given a graph $G=(V,E)$, a subgraph of $G$, 
which is denoted as $G' = (V', E')$ is a graph whose 
vertices $V'$ are a subset of $V$ and whose edges 
$E'$ are a subset of $E$.]

== Induced Subgraphs
/ Induced Subgraph: #[Given a graph $G=(V,E)$, an induced 
subgraph $G' = (V', E')$ is a subgraph of $G$ that contains 
the following property: 
- all edges $e' in E'$ must have (both) endpoints be in $V'$]

#[We define the subgraph induced by $V'$, where $V'$ is a set 
of vertices $V' subset.eq V$, as being the subgraph $G' = (V', E')$
in which all $e' in E'$ must have both endpoints $r'_1, r'_2 in V'$.]

== Graph Orientations 
/ Orientation: #[Given an undirected graph $G$, an _orientation_ 
of the graph $G$ would be the resulting graph in which we assign 
each edge a direction, resulting in a directed graph.]

== Tournaments 
/ Tournaments: #[Given a set of vertices $V$, a tournament of 
$V$, denoted as $T$ on $V$, is an _orientation_ of the 
vertices, such that the resulting graph is connected.]
  - #[Note, in a tournament, two endpoints $i, j$ can only 
    have a single edge between them, in which $i arrow.r j$
    or $j arrow.r i$, but not both]

== Dominating Sets 
/ Dominating Set: #[A _dominating set_ of an undirected graph 
$G = (V,E)$ is a set $U subset.eq V$ such that every 
vertex $v in V - U$ has at least one neighbor in $U$. ]

#pagebreak()
= Chapter 1: The Basic Method 
== The Probabilistic Method 
- Powerful tool for tackling problems in discrete math 
- Main idea of the method 
  - *Objective.* #[We see kto prove that a structure with 
certain desired properties _exists_]
  - We first define an appropriate probabilisty space of structures 
  - #[then, we show that the desired properties hold in these 
  structures with positive probability]


=== Example 1 <test>
#[We note that the _Ramsey number_ $R(k, cal(l))$ is the smallest 
integer $n$ such that in any wo-coloring of the edges of a complete 
graph on $n$ vertices $K_n$ by red and blue, either there is a 
red $K_k$ (ie, a ocmplete subgraph on $k$ vertices all of whose 
edges are colored red) or there is a blue $K_cal(l)$.]
- #[Ramsey showed that $R(k, cal(l))$ is finite for any 
two integers $k$ and $l$.] 
- #[We can obtain a lower bound for hte diagonal 
Ramsey numbers $R(k, k)$]
  - #[*Remark.* A _complete graph_ $K$ on $n$ (which is denoted as $K_(n)$) 
  is a graph in which each pair of distinct $n$ vertices is connected together by an edge.]


==== *Prop. 1* <prop1>
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
== Optional Proof Notes 
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

== The Essence of the Probabilistic Method 
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
=== Why is this approach effective? 
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

== Second Look at the Probabilistic Method 
=== Property $S_k$ 
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
- *Remark.* Because $T$ is a tournament, we know that 
  if we're considering a vertex $v$, it must be connected 
  to all of the nodes within the subset $K$. Thus, there 
  is a $1/2$ probability with which the edge with endpoints 
  $v, j : j in K$ is directed $v -> j$. 
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

