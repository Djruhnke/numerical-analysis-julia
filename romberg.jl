function romberg(f, a, b, tol)
    kmax = 10
    h = b-a
    R = zeros(kmax, kmax)
    R[1,1] = (f(a) + f(b)) * h / 2
    for k = 2:kmax
        #composite trapezoid rule
        temp = 0
        for i = 1:2^(k-2)
            temp = temp + f(a + ((((2 * i) - 1) * h) / 2^(k-1)))
        end
        R[k,1] = 0.5 * R[k-1,1] + (h/2^(k-2)) * temp / 2

        #Extrapolation
        for j = 2:k
            R[k,j] = R[k,j-1] + (R[k,j-1] - R[k-1,j-1]) / (4^(j-1) - 1)
        end

        #Print how procedure error decrease
        println(abs(R[k,k] - R[k-1,k-1]))

        #Termination criteria
        if abs(R[k,k] - R[k-1,k-1]) < tol
            return R[k,k]
        end
    end
end
