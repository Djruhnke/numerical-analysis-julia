function euler(f, a, b, N, initial)
    h = (b - a) / N
    t = a
    w = initial
    println("(", t, ", ", w, ")")
    for i = 1:N
        w = w + h * f(t, w)
        t = a + i * h
        println("(", t, ", ", w, ")")
    end
end
