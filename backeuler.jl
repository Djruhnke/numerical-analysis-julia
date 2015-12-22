function modified_newtons(f, dfdy, h, w, t, maxiter, tol)
    j = 1
    p0 = w
    while j <= maxiter
        #Exectute modified Newton's Method
        p = p0 - ((w+(h*f(t, p0))-p0) / (h*dfdy(t, p0)-1))
        #Check if it within the required tolerance
        if abs(p - p0) < tol
            return p
        end
        j = j + 1
        p0 = p
    end
    #If never converges then return nothing
    return nothing
end

function backeuler(f,dfdy,a,b,alpha,N,maxiter,tol)
    #Set up h, t_0, and w_0
    h = (b - a) / N
    t = a
    wFinal = zeros(N+1,1)
    wFinal[1,1] = alpha
    for i = 1:N
        #Get t_i+1
        t = a + i * h

        #Run modified Newton's Method
        wFinal[i+1,1] = modified_newtons(f, dfdy, h, wFinal[i,1], t, maxiter, tol)
    end
    return wFinal
end
