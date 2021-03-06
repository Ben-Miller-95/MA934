#Question 1: Linear search using a linked list

#KVP recursive function

function kvp(list::Nullable{LList})
 if(isnull(list))
    return
        
 else
    println(get(list).data)
    return kvp(get(list).next)
 end
end

#Search function

function search(list::Nullable{LList}, k::Int64)
    if(isnull(list))
        return       
    elseif((get(list).data).key == k)
        # Better to have the search function return the key-value pair rather than just printing the value
        #println(get(list).data)
        #
        # Like this:
        return get(list).data
    else 
        #This line is probably the problem: you are overwriting the list as you search it:
        #get(list).next = search(get(list).next, k)
        #
        # Try this instead:
        return search(get(list).next, k)
    end
end

#Computational complexity of search function

function costsearch(z)
    x = 1:z
    x = 100*x
    time = zeros(length(x))
    #len = length(x)
    for i = 1:length(x)
        len = x[i]
        time2 = zeros(len)
        y = rand(rng, len)
        values = Array{KVPair}(len)
        for j in 1:len
         values[j] = KVPair(j,y[i])
        end
        list = Nullable{LList}()
        list = buildLList(values)
        for k = 1:len
            time2[k] = (@timed search(list, k))[2]
        end
        time[i] = mean(time2)
    end
    return time
end

function costsearch2(z)
    x = 1:z
    x = 100*x
    time = zeros(length(x))
    nsamples=1000
    #len = length(x)
    for i = 1:length(x)
        len = x[i]
        time2 = zeros(nsamples)
        y = rand(len)
        values = Array{KVPair}(len)
        for j in 1:len
         values[j] = KVPair(j,y[i])
        end
        list = Nullable{LList}()
        list = buildLList(values)
        searchkey = Array{Int64}(ceil.(rand(nsamples)*len))
        t = @timed for k = 1:nsamples
            search(list, searchkey[k])
        end
        time[i] = t[2]
    end
    return time
end


#Question 2: Interval membership

#Interval membership

function intervalmembership(list::Nullable{LList}, x::Float64)
    if((get(list).data).value < x)
        get(list).next = intervalmembership(get(list).next, x)
        
    elseif((get(list).data).value > x)
        print(get(list).data)
    end
end

#Interval membership using Fenwick tree

function Fenwick(FT::Nullable{FTree}, x::Float64)
    if (isnull(get(FT).right) && isnull(get(FT).left))
        return get(FT).data
        
    elseif (get(get(FT).left).data.value > x)
        Fenwick(get(FT).left, x)
        
    else
        Fenwick(get(FT).right, x - get(get(FT).left).data.value)
    end
end
