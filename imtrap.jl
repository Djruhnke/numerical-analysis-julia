function imtrap(f, dfdy, a, b, IC, h, maxiter, tol)
    N = int((b-a)/h)
    t = (a:h:b)
    w = zeros(N+1, 1)
    w[1] = IC
    for i = 1:N
        k1 = w[i] + h*f(t[i], w[i])/2
        w0 = k1 #initial guess for newton's method
        w1 = w0
        for j = 1:maxiter #Newton's iteration
            w1 = w0 - (w0 - h*f(t[i+1], w0)/2 - k1)/(1-h*dfdy(t[i+1],w0)/2)
            if abs(w1 - w0) < tol
                break
            else
                w0 = w1
            end
        end
        w[i+1] = w1
    end
    return w
end
