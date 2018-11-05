context("kat_fact: real requests")
test_that("kat_fact works", {
  aa <- kat_fact()

  expect_is(aa, "list")
  expect_named(aa, c('fact', 'length'))
  expect_is(aa$fact, 'character')
  expect_type(aa$length, 'integer')
})

test_that("kat_fact length works", {
  expect_lte(kat_fact(30)$length, 30)
  expect_lte(kat_fact(80)$length, 80)
  expect_lte(kat_fact(120)$length, 120)
  expect_lte(kat_fact(300)$length, 300)
  
  aa <- kat_fact(max_length = 0)

  expect_is(aa, "list")
  expect_equal(length(aa), 0)
})

test_that("kat_fact error behavior", {
  expect_error(kat_fact(max_length = 'foobar'))
})


context("kat_fact: mocked requests")
test_that("kat_fact works", {
  webmockr::enable("httr")

  stub <- webmockr::stub_request("get", "https://catfact.ninja/fact")
  stub <- webmockr::to_return(stub, status = 200, body = '{"stuff": "things"}')

  aa <- kat_fact()

  expect_is(aa, "list")
  expect_named(aa, 'stuff')
  expect_is(aa$stuff, 'character')
  expect_equal(aa$stuff, 'things')

  webmockr::disable("httr")
})

context("kat_fact: real requests after mocked requests")
test_that("kat_fact works", {
  aa <- kat_fact()

  expect_is(aa, "list")
  expect_named(aa, c('fact', 'length'))
  expect_is(aa$fact, 'character')
  expect_type(aa$length, 'integer')
})
