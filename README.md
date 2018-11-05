katfact
=======



[![Build Status](https://travis-ci.com/sckott/katfact.svg?branch=master)](https://travis-ci.com/sckott/katfact)

`katfact` package

Get a random cat fact from the Cat Fact API <https://catfact.ninja/>


----

Package to demonstrate using [webmockr][] for tests in an R package that uses [httr][].

[webmockr][] was originally built with support only for the [crul][] package - but now also supports [httr][]. Support for [curl][] is in the works.

## install


```r
remotes::install_github("sckott/katfact")
```


```r
library(katfact)
```

## get a cat fact


```r
kat_fact()
#> $fact
#> [1] "Isaac Newton invented the cat flap. Newton was experimenting in a pitch-black room. Spithead, one of his cats, kept opening the door and wrecking his experiment. The cat flap kept both Newton and Spithead happy."
#> 
#> $length
#> [1] 211
```


[webmockr]: https://github.com/ropensci/webmockr
[crul]: https://github.com/ropensci/crul
[httr]: https://github.com/r-lib/httr
[curl]: https://github.com/jeroen/curl
