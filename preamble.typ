#let var = math.italic

#let bl  = [#h(0.35cm)]

#let qt(x) = "\"" + [#x] + "\""

#let uC = counter("unit")

#let rmkProps = (  
  fill: rgb(255, 225, 225), 
  outline: rgb(200, 100,100),
  color:  rgb(125,0,0),
)

#let dfnProps = (  
  fill: rgb(225, 255, 255), 
  outline: rgb(100, 200,200),
  color:  rgb(0,125,125),
  c: counter("dfn")
)

#let thmProps = (  
  fill: rgb(225, 255, 225),
  outline:  rgb(100, 200, 100),
  color: rgb(0, 150, 0),
  c: counter("thm")
)

#let clmProps = (  
  fill: rgb(245, 222, 255),
  outline:  rgb(124, 17, 171),
  color: rgb(83, 0, 120),
  c: counter("clm")
)

#let lemProps = ( 
  fill : rgb(255, 255, 225),
  outline : rgb(200, 200, 100),
  color : rgb(150, 150, 0),
  c: counter("lem")
) 

#let ntProps = (  
  fill: rgb(225, 225, 225),
  outline: rgb(150, 150, 150),
  color: rgb(50, 50, 50), 
)

#let corProps = ( 
  fill: rgb(255,239,224), 
  outline: rgb(255,162,81), 
  color: rgb(244,114,0), 
  c: counter("cor")
)


#let proof_outline = stroke(thickness: 1pt, paint: rgb(255,100,100))

#let dfn(key, body) = {
  v(0.5cm)
  rect(
    fill: dfnProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: dfnProps.at("outline"),
    text(dfnProps.at("color"))[
      #dfnProps.c.step()
      #[*Definition #dfnProps.c.display()*] #[*(#key).*] #align(left, [#body])],
  )
  v(0.5cm)
}
#let rmk(key, body) = {
  v(0.5cm)
  rect(
    fill: rmkProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: rmkProps.at("outline"),
    text(rmkProps.at("color"))[
      #[*Remark*] #[*(#key).*] #align(left, [#body])],
  )
  v(0.5cm)
}


#let thm(key, body) = {
  set text(black)
  v(0.5cm)
  rect(
    fill: thmProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: thmProps.at("outline"),
    text(thmProps.at("color"))[#[*Theorem*] #[*(#key).*] #align(left, [#body])],
  )
  v(0.5cm)
}

#let clm(body) = {
  set text(black)
  v(0.5cm)
  rect(
    fill: clmProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: clmProps.at("outline"),
    text(clmProps.at("color"))[#[*Claim.*] #align(left, [#body])],
  )
  v(0.5cm)
}

#let lem(key, body) = {
  set text(black)
  v(0.5cm)
  rect(
    fill: lemProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: lemProps.at("outline"),
    text(lemProps.at("color"))[#[*Lemma*] #[*(#key).*] #align(left, [#body])],
  )
  v(0.5cm)
}

#let cor(key, body) = {
  set text(black)
  v(0.5cm)
  rect(
    fill: corProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: corProps.at("outline"),
    text(corProps.at("color"))[#[*Corollary*] #[*(#key).*] #align(center, [#body])],
  )
  v(0.5cm)
}

#let nt(body) = {
  set text(black)
  v(0.5cm)
  rect(
    fill: ntProps.at("fill"),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    stroke: ntProps.at("outline"),
    text(ntProps.at("color"))[#[*Note.*] #align(left, [#body])],
  )
  v(0.5cm)
}

#let proof(key, body) = {
  set text(black)
  [#[_*#key.*_] \ #body]
  align(right)[$qed$]
}

#let ex(key, body) = {  
  [#[_*Example (#key).*_] \ #align(left, [#body])]
}


#let titlePage(title, name, term) = { 

  align(center+horizon, text(32pt)[
    #title
  ])

  align(center+horizon, text(16pt)[
    #name
  ])

  align(center+horizon, text(12pt)[
    #term
  ])
}

#let unit(title, pic) = { 
  pagebreak()
  align(center, line(length: 75%))
  uC.step()
  align(center, text(size:32pt, fill: gradient.linear(..color.map.magma))[Unit #context uC.display()\: \ #title])
  align(center, line(length: 75%))
  align(center + horizon, pic)
  pagebreak()
}

#let cC = counter("chapter")

#let chap(title) = { 
  cC.step()
  align(center, text(size:24pt, fill: gradient.linear(..color.map.plasma))[Chapter #context cC.display()\: \ #title])
  v(0.5cm)
  align(center, line(length: 85%, stroke: 1pt))
  v(1cm)
}

#let qsProps = ( 
  hFill: rgb(176, 185, 255),
  hBody: rgb(60, 63, 115),
  pFill: rgb(230, 233, 255),
)

#let qs(key, body) = {  
  set text(black)
  stack(rect( 
    fill: rgb(39, 87, 161),
    inset: 6pt,
    width: 100%,
    stroke: rgb(39, 87, 161),
    radius: (
    top-left:5pt,
    top-right:5pt,
  )
)[#text(white, size: 9pt)[#smallcaps(key)]],
  rect(
    fill: white,
    inset: 15pt,
    radius: ( 
      bottom-left: 5pt, 
      bottom-right: 5pt,
  ),
    stroke: rgb(39, 87, 161),
    width: 100%,
  [#text(size: 9pt)[#emph(body)]],
  ))
}

#let qt(body) = { 
  v(0.5cm)
  align(center)[
    #emph(body)
  ]
  v(0.5cm)
}


