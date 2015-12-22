function newton(f, fderiv, p0, tol, N0)
    #N0: max number of iterations
    #tol: "0" tolerance
    i = 1
    while i <= N0
        p = p0 - f(p0) / fderiv(p0)
        println(i, '\t', p)
        if abs(p - p0) < tol
            return p
        end
        i = i + 1
        p0 = p
    end
end
