module For exposing (for)

{-| Give `for` function like that in other languages.


# For

@docs for

-}


{-| First `Int` (`i`) is to check how the for process.

Second `Int` (`n`) set the times of function `f`.

Type `outer` (`o`) is the data used.

`( Int->  io -> io)`(`f`) set a function which use `i` as index of the `for` function to map from `io` to `io`.

C++ style code :
    for (int index = i ; index < n ; index++) o=f(index,o);

Example :
    For.for
        0
        10
        (\i ( list, added ) ->
            ( (i
                + added
              )
                :: list
            , added
            )
        )
        ( []
        , 10
        )
        == ( [ 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10 ], 10 )

-}
for : Int -> Int -> (Int -> io -> io) -> io -> io
for i n f x =
    if i > n then
        x

    else
        for
            (i + 1)
            n
            f
            (f
                i
                x
            )
