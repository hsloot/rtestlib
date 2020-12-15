test_that("simple is implemented correct", {
  expect_equal(simple(1, 2), testutils.rtestlib::simple2(1, 2))
  expect_equal(simple(1, 2, 3), testutils.rtestlib::simple3(1, 2, 3))
  expect_equal(simple(1, 2, 3, 4), testutils.rtestlib::simple4(1, 2, 3, 4))
  expect_equal(simple(1, 2, 3, 4, 5, 6, 7), testutils.rtestlib::simple_alt(1, 2, 3, 4, 5, 6, 7))
})
