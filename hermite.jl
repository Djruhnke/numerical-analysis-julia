function hermite(x, fx, dfx)
    N = length(x)
    z = zeros(2*N,1)
    Q = zeros(2*N,2*N)
    for i = 1:N
        z[2*i-1] = x[i]
        z[2*i] = x[i]
        Q[2*i-1, 1] = fx[i]
        Q[2*i, 1] = fx[i]
        Q[2*i, 2] = dfx[i]
        if i != 1
            Q[2*i-1, 2] = (Q[2*i-1,1] - Q[2*i-2,1]) / (z[2*i-1] - z[2*i - 2])
        end
    end
    for i = 3:2*N
        for j = 3:i
            Q[i,j] = (Q[i,j-1] - Q[i-1,j-1]) / (z[i] - z[i-j+1])
        end
    end
    return diag(Q), z
end
