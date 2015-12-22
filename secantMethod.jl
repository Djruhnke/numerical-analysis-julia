function secantMethod(f, p0, p1, tol, N0)
    #N0: max number of iterations
    #tol: "0" tolerance
    i = 2
    q0 = f(p0)
    q1 = f(p1)
    while i <= N0
        p = p1 - q1 * (p1 - p0) / (q1 - q0)
        println(i, '\t', p)
        if abs(p - p1) < tol
            return p
        end
        i = i + 1
        p0 = p1
        q0 = q1
        p1 = p
        q1 = f(p)
    end
end
