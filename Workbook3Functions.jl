#Question 1: Numerical differentiation

#Function for calculating the derivative of f(x)

function derivative(x, h)
    d = (4*(sin(exp(x + h))) - 1*sin(exp(x + 2h)) - 3*sin(exp(x)))/(2h)
end

#Question 2: Finding roots

#Bracketing Bisection algorithm

function bracketingbisection(a::Float64, b::Float64)
 j = 0
 xx = 0
 while (b - a) > (abs(a) + abs(b))*(5.0*10.0^(-16.0))/2.0
     j = j + 1
     xx = (a + b)/2.0
     if sin(exp(a)) * sin(exp(xx)) > 0
         a = xx
         b = b
     else
         a = a
         b = xx
     end
 error[j] = abs(log(pi) - xx)
 end
println("x = $(xx)")
println("Number of iterations = $(j)")
end

#Newton Rhapson algorithm

function newtonrhapson(z0::Float64)
  i = 0
  z[1] = z0
  error[1] = abs(log(pi)- z0)
  while abs(sin(exp(z[i+1]))) > 5.0*10.0^(-16.0)
    i = i + 1
    delta = -sin(exp(z[i]))/(exp(z[i])*cos(exp(z[i])))
    z[i+1] = z[i] + delta
    error[i+1] = abs(log(pi) - z[i+1])
    #print(x[i+1])
  end
  println("x = $(z[i+1])")
  println("Number of iterations = $(i + 1)")
end

#Question 3: Finding minima

#Golden Section Search algorithm

function goldensearch(a, b, c)
    w = (sqrt(5) - 1)/2
    It = 0
    Estimates = []
    Iterations = []
    while abs(c - a) > (abs(a) + abs(c))*(5.0*10.0^(-16.0))/2.0
        if abs(c - b) > abs(b - a)
            x = b + (1 - w)*(c - b)
            if sin(exp(b)) < sin(exp(x))
                c = x
            else
                b = x
                c = b
            end
        else
            x = b - (1 - w)*(b - a)
            if sin(exp(b)) < sin(exp(x))
                a = x
            else
                b = x
                c = b
            end
        end
        push!(Estimates, x)
        push!(Iterations, It)
        It = It + 1
    end
    return Iterations, Estimates
end
    
