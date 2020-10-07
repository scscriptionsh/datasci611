test_that("multiplication works", {
    c <- new("Carrot",season="winter",grow_time=3);
    expect_equal(get_bite_sound(c),"crunch");
})
