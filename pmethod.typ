#set heading(
  numbering: "1."
)

#set math.equation(
  numbering: "(1)"
)

#align(center, text(32pt)[
  The Probabilistic Method Notes
])

#align(center, text(16pt)[
  Randy Truong
])

#align(center, text(12pt)[
  26 April 2024
])

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

== 

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


