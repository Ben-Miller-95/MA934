#Question 1: Precision of floating point arithmetic

#Calculate first 80 terms using Float32

function recursion(n)
    A = Array{Float32}(n)
    A[1] = Float32(1)
    A[2] = Float32(2)/Float32(3)
    for i in 3:n
        A[i] = Float32(2)*A[i-1] - Float32(8)/Float32(9)*A[i-2]
    end
    return A
end

#Calculate first 80 terms using Float64

function recursion2(n)
    A = Array{Float64}(n)
    A[1] = Float64(1)
    A[2] = Float64(2)/Float64(3)
    for i in 3:n
        A[i] = Float64(2)*A[i-1] - Float64(8)/Float64(9)*A[i-2]
    end
    return A
end

#Calculate first 80 terms using BigFloat

function recursion3(n)
    A = Array{BigFloat}(n)
    A[1] = BigFloat(1)
    A[2] = BigFloat(2)/BigFloat(3)
    for i in 3:n
        A[i] = BigFloat(2)*A[i-1] - BigFloat(8)/BigFloat(9)*A[i-2]
    end
    return A
end


#Question 2: Computational complexity of the mergesort algorithm

#mergepresorted function

function mergepresorted(A::Array{Int64,1}, B::Array{Int64,1})
    if length(A) == 0
        return B
    elseif length(B) == 0
        return A
    elseif A[1] < B[1]
        return vcat([A[1]], mergepresorted(A[2:end], B))
    else
        return vcat([B[1]], mergepresorted(A, B[2:end]))
    end    
end

#Mergesort function for arrays of length n = 2^m

function mergesort(A)
    if length(A) == 1
        return(A)
    
    else
        m = Int(length(A)/2)
        return(mergepresorted(mergesort(A[1:m]),mergesort(A[m+1:length(A)])))
    end
end
