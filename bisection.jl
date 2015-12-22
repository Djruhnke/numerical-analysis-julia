function bisection(f, a, b, tol, N0)
    #N0: max number of iterations
    #tol: "0" tolerance
    i = 0
    while i <= N0
        p = (a+b)/2
        println(i, '\t', p, '\t', f(p))
        if abs(f(p)) < tol
            return p
        elseif f(p) * f(b) < 0
            a = p
        elseif f(p) * f(a) < 0
            b = p
        end
        i = i + 1
    end
end
