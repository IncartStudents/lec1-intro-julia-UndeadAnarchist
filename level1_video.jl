# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции
#=println("Shitf+Enter to Run Line or button Run (Run Cells, Run Cells and Select Below etc)")
println("I`m so scared to learn Julia)")
my_answer = 42
typeof(my_answer)
my_pi = 3.14159
typeof(my_pi) #если не писать type of, чего будет
my_name = "Tiba"
typeof(my_name)
my_answer = my_pi
большие коммы
=#
sum = 3+7
a = 2
b = 4
typeof(a)
typeof(b)
sum = a+b
println(sum)
difference = b-a
product = a * b
quotient = b/a
power = b^a
modulus = b%a
println(difference," ", product," ", quotient," ", power," ", modulus)


s1 = "I am a string (no)"
s2 = """I am true string"""
s3 = """ Look, it "works" """
println(s3)
println(typeof('a'))
name = "Tiba"
num_fingers = 10
num_toes = 10
println("Hi, my name is $name")
println("I have $num_fingers fingers and $num_toes toes, That is $(num_fingers+num_toes) digits")

string("How many cats", "are too many cats?")
string("I don`t know, but", "are too few")
s3 = "How many cats"
s4 = "are too many cats?"
s3*s4

book = Dict("Tiba" => "88005553535", "Ghostbusters" => "234987-2347")
book["Kramer"] = "2347-OOps"
book
book["Tiba"]
pop!(book, "Kramer")
book
animals = ("hedges", "Spiders", "dogs")
animals[1]
friends = ["Balgor", "Balgor 2.0", "Balgor 3.0"]
fibonacci = [1, 1, 2, 3, 5, 8, 13]
mix = [1,44,"ddd"]
mix[2]
mix
friends[3] = "Polya"
friends
push!(fibonacci, 21)
fibonacci
pop!(fibonacci)
fibonacci

favs = [["eggs", "dogs"],["hedges","two eggs"]]
numbers = [[1,2,3],[4,5],[6,7,8,9]]
rand(4,3)
rand(4,3,2)

n = 0
while n < 10
    n += 1
    println(n)
end

friends = ["Balgor", "Balgor 2.0", "Balgor 3.0"]
i = 1
while i <= length(friends)
    friend = friends
    println("Hi $friend, I`m so tired")
    i += 1
end
for m in 1:10
    println(m)
end
friends = ["Balgor", "Balgor 2.0", "Balgor 3.0"]
for friend in friends
    println("aaaaaaaa, my $friend")
end
m, n =3, 2
A = zeros(m, n)
for i in 1:m
    for j in 1:n
A[i, j] = i + j
    end    
end
A
B = zeros(m, n)
for i in 1:m, j in 1:n
    B[i, j] = i + j
end
B
C = [i + j for i in 1:m, j in 1:n]
C
for n in 1:10
    A = [i + j for i in 1:n, j in 1:n]
    display(A)
end
A 

x = 25
y = 8

if x > y
    println("$x > $y ")
elseif y > x
    println("$y > $x")
else 
    println("$x = $y")
end


if x > y 
    x
else
    y 
end

(x > y) ? x : y

(x > y) && println("$x > $y")
(x < y) && println("$y > $x")

function sayhi(name)
    println("hi $name, lalala")
end

function f(x)
    x^2
end

sayhi("R2D2")

f(42)

sayhi(name) = println("hi $name, f")
f2(x)=x^2
sayhi2("steal")
f2(42)

sayhi3 = name -> println("Stop $name")
f3 = x -> x^2
sayhi("Chyi")
f3(42)

sayhi(234646493180)
A = rand(3, 3)
f(A)

v = rand(3)

v = [3, 5, 2]
sort(v)
sort!(v)
v

A = [i + 3*j for j in 0:2, i in 1:3]
f(A)
B=f.(A)
A[2, 2]
A[2, 2]^2
B[2, 2]
v = [1, 2, 3]
f.(v)


#Pkg.add("Example")
#using Example


#hello("its me. I was wondering if after all these years ypud like to meet")
#using Colors
#palette = distinguishable_colors(100)
#rand(palette, 3, 3)
using Pkg
Pkg.add("Plots")
using Plots

x= -3:0.1:3
f(x) = x^2

y = f.(x)
gr()
plot(x, y, label="line")
scatter!(x, y, label="points")

plotlyjs()

globaltemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]

numpirates = [45000, 20000, 15000, 5000, 400, 17]
plot(numpirates,globaltemperatures,legend=false)
scatter!(numpirates,globaltemperatures,legenf=false)
xflip!()
xlabel!("Number of pirates")
ylabel!("Global Temperature")
title!("Influence of pirate population on global warming")

p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1,p2,p3,p4,layout=(2,2),legend=false)
title!("i hate my life")

methods(+)
@which 3+3
@which 3.0+3.0
@which 3+3.0
import Base: +
"hello"+"world!"
+(x::String, y::String) = string(x, y)
"hello" + " world!"
@which "hello"+"world"
foo(x, y) = println("duck-typed fpp")
foo(x::Int, y::Float64) = println("foo feln")
foo(x::Float64, y::Float64) = println("2 floats")
foo(x::Int, y::Int)=println("foo with 2 integers floats")
foo(1,1)
foo(1., 1.)
foo(1, 1.0)
foo(true,false)

A = rand(1:4,3,3)
B=A
C=copy(A)
[B C]

A[1]=17
[B C]

x=ones(3)
b=A*x
Asym=A+A'
Apd=A'A 
A\b

Atall=A[:,1:2]
display(Atall)
Atall\b

A=randn(3,3)
[A[:,1] A[:,1]]\b

Ashort=A[1:2,:]
display(Ashort)
Ashort\b[1:2]