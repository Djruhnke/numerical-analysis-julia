function fixedPoint(f, p0, tol, N0)
    #N0: max number of iterations
    #tol: "0" tolerance
    i = 0
    println("n", '\t', "p of n")
    while i < N0
        p = f(p0)
        println(i, '\t', p)
        if abs(p - p0) < tol
            return p
        end
        i = i + 1
        p0 = p
    end
end
