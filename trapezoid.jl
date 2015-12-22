function trapezoid(f, a, b, n)
    h = (b - a) / n
    XI0 = f(a) + f(b)
    XI1 = 0
    for i = 1:(n-1)
        X = a + i * h
        XI1 = XI1 + f(X)
    end
    XI = h * (XI0 + 2 * XI1) / 2
    return XI
end
