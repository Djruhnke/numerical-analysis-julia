function newtonbisection(f, df, a, b, tol)
    println("Method\ta\tb\tp\tf(p)")
    p = a
    while abs(f(p)) >= tol
        p = p - f(p) / df(p)
        if p < a || p > b
            p = (a + b) / 2
            print("Bisection\t")
        else
            print("Newton\t")
        end
        if f(p) * f(b) < 0
            a = p
        else
            b = p
        end
        println(a, '\t', b, '\t', p, '\t', f(p))
    end
    return p
end
