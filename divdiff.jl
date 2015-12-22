function divdiff(x, y)
    N = length(x) #number of nodes
    F = zeros(N,N) #initialize the matrix F
    F[:,1] = y
    for i = 2:N
        for j = 2:i
            F[i,j] = (F[i,j-1] - F[i-1,j-1]) / (x[i] - x[i-j+1])
        end
    end
    return diag(F)
end
