function rk3(f, a, b, IC, h)
    #initialize...
    N = int((b - a) / h)
    t = a:h:b #vector from a to b with increment of h
    w = zeros(N+1,1) #solution vector
    w[1] = IC

    #Main loop
    for i=1:N
        k1 = h * f(t[i], w[i])
        k2 = h * f(t[i] + (h / 3), w[i] + (k1 / 3))
        k3 = h * f(t[i] + ((2 * h) / 3), w[i] + ((2 * k2) / 3))
        w[i+1] = w[i] + ((k1 + 3 * k3) / 4)
    end
    return w
end

function rk4(f, a, b, IC, h)
    #initialize...
    N = int((b - a) / h)
    t = a:h:b #vector from a to b with increment of h
    w = zeros(N+1,1) #solution vector
    w[1] = IC

    #Main loop
    for i=1:N
        k1 = h * f(t[i], w[i])
        k2 = h * f(t[i] + (h / 2), w[i] + (k1 / 2))
        k3 = h * f(t[i] + (h / 2), w[i] + (k2 / 2))
        k4 = h * f(t[i] + h, w[i] + k3)
        w[i+1] = w[i] + ((k1 + (2 * k2) + (2 * k3) + k4) / 6)
    end
    return w
end

function rk4m(f, a, b, IC, h)
    #initialize...
    dim = length(IC)
    N = int((b - a) / h)
    t = a:h:b #vector from a to b with increment of h
    w = zeros(dim,N+1) #solution vector
    w[:,1] = IC

    #Main loop
    for i=1:N
        k1 = h * f(t[i], w[:,i])
        k2 = h * f(t[i] + (h / 2), w[:,i] + (k1 / 2))
        k3 = h * f(t[i] + (h / 2), w[:,i] + (k2 / 2))
        k4 = h * f(t[i] + h, w[:,i] + k3)
        w[:,i+1] = w[:,i] + ((k1 + (2 * k2) + (2 * k3) + k4) / 6)
    end
    return w'
end
