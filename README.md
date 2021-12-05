# Numerical_Analysis

## Table of contents
* [Introduction](#Introduction)
* [Part I- Interpolation](#Part-I--Interpolation)
* [Part II- Derivation](#Part-II--Derivation)
* [Part III- Integration](#Part-III--Integration)
* [Part IV- Linear Systems](#Part-IV--Linear-Systems)

## Introduction
*The aim of this repository is not to cover the full course but rather explaining quickly the use of some algorithms in order to solve mathematical problems in an IT environment.*

We will focus on the branch of applied mathematic studying the developpement of tools/methods to compute approximations for scientific calculus with a computer.

## Part I- Interpolation

Numerical analysis is opposed to formal calculus because computers obviously doesn't understand functions such as cosinus, they are made of binary values: 0 and 1, they are limited in memory, thus they cannot understand infinity which is why we need to transition from a continuous set to a discrete set.

In order to do so we need a new way to represent functions, converting functions to polynomials is the easiest way to do so.
From only a set of points we are able to approximate functions as polynomials, this operation is called interpolation.

We will only study a few implementations of these interpolations such as Lagrange, Newton and Hermite.

### Lagrange:

The first and most basic interpolation of all is Lagrange's interpolation, it works fine but doesn't take into account the derivative of the function or the addition of newer points in the equation for better accuracy (and lower loss).

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144330999-2ae40090-3c18-4f78-a686-83466e2c9862.PNG">
</p>

We will try the Matlab function Lagrange() given in this repository:

```
>> X=[-pi -pi/2 0 pi/2 pi]
>> Y=cos(X)
>> P=@(x) Lagrange(x, X, Y)
>> x=-5:0.1:5;
>> plot(x, cos(x))
>> hold on
>> plot(x, P(x))
>> legend('cos', 'interpol')
```

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144335036-0dc351bf-3268-4165-a809-3760b79fe876.PNG">
</p>

As we can see at the edge of the interpolation the function is exploding !

This is called the <a href='https://en.wikipedia.org/wiki/Runge%27s_phenomenon'>Runge's phenomenon</a> it is a problem of oscillation at the edges of an interval that occurs when using polynomial interpolation with polynomials of high degree over a set of equispaced interpolation points.

### Newton:

In Lagrange's base the calculation of the interpolation polynomial Pk of a function f associated with points x0,...,xk is of no use for the calculation of the interpolation polynomial Pk+1 of f associated with points x0,...,xk+1 which is why we need a new base capable of calculating Pk+1 easily.

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144345669-dfdd2f56-bb33-4bb0-8ba1-34fb745b4b7e.PNG">
</p>

Now let's try the function Newton() with a set of points chosen from Tchebychev:

```
>> X=Tchebychev(-pi, pi, 5)
>> Y=sin(X)
>> P=@(x) Newton(x, X, Y)
>> x=-5:0.1:5;
>> plot(x, sin(x))
>> hold on
>> plot(x, P(x))
>> legend('sin', 'newton')
```

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144344986-fd3db571-2bcc-4bdb-bdcf-f08a4b359747.png">
</p>

### Hermite:

All the interpolations seen before doesn't take into account the derivative of f, which is why we need a new base in order to represent those derivatives.

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144450804-1badc1c4-ad58-473c-85d7-5956bf74ef57.PNG">
</p>

Let's now try it with a set of points between 0 and 10 chosen from Tchebychev, the function is called Hermite() and take into parameter the derivative Y2 here.

```
>> X=Tchebychev(0, 10, 100);
>> Y=cos(X);
>> Y2=sin(X);
>> P=@(x) Hermite(x, X, Y, Y2);
>> x=0:0.1:10;
>> plot(x, cos(x))
>> hold on
>> plot(x, P(x))
>> legend('cos', 'hermite')
```

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144447345-b5b8c9a5-a7a3-4475-8e2c-2becc21bb0f5.PNG">
</p>

The error is much higher because Hermite's interpolation is designed for small intervals.

## Part II- Derivation

In order to approach the derivative f' of a function f we don't necessarily have an explicit formula, or it is too complicated which is why we need to derivate the interpolation polynomial in a set of points xi where the function is supposed to be known.

We won't cover all the demonstrations, the goal is to show the different algorithms.

### Two points formula:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144458182-4d744402-4a64-43f5-81ec-2710b996acc1.PNG">
</p>

Now that we have the formula, let's try it on cosinus(x) with the function Derivate2Points() linked in this repository. We know that the derivative of cosinus(x) is -sinus(x).

```
>> X=0:0.1:10;
>> f=@(x) cos(x);
>> Y=f(X);
>> G=Derivate2Points(X, Y);
>> plot(X, -sin(X))
>> hold on
>> stem(X(2:n), G, 'LineStyle', 'none')
>> legend('-sin(x)', 'approximation')
```

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144468791-56c76aab-e97f-4009-8abf-6b223b5c599c.PNG">
</p>

Here we used the decentred right formula, and we can see the approximation's curve is slightly off on the right, the next formula will address this issue.

### Three points formula:

This formula is more accurate than the last (the error is lower).

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144460928-4b6bad09-9665-481b-b167-33c042e5cc52.PNG">
</p>

```
>> X=0:0.1:10;
>> f=@(x) cos(x);
>> Y=f(X);
>> G=Derivate3Points(X, Y);
>> plot(X, -sin(X))
>> hold on
>> stem(X(2:n-1), G, 'LineStyle', 'none')
>> legend('-sin(x)', 'approximation')
```

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144470669-e8ea99e8-9c08-484e-bcce-26c983442712.PNG">
</p>

## Part III- Integration

In this part we will be focusing on looking for an approximation of Riemann's integral.

We can notice through the formula of Chasles that:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144512116-778ef2e4-69ba-47b6-a83d-44ab1e0ed48a.PNG">
</p>

We then replace f by a weighted average:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144516876-983b406c-e9a1-4dd7-a005-ecd23083fe55.PNG">
</p>

This is what we call the elementary quadrature method.

### Middle points' method:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144641885-21bbef34-1509-4dd3-94bf-03780d0cf45e.png">
</p>

If we try MiddlePoint() on cos(x) with x between [0, 10]

```
>> X = [0:0.1:10]
>> Y = @(x) cos(x)
>> MiddlePoint(X, Y)
ans = -0.5442
```

### Trapezium's method:

This method is more accurate than the last.

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144642669-2c28547a-9dfc-4fdb-8c64-9786fe2b09a4.png">
</p>

Let's try Trapeze() on the same function, cos(x):

```
>> X = [0:0.1:10]
>> Y = @(x) cos(x)
>> Trapeze(X, Y)
ans = -0.5436
```

### Simpson's method:

This method contrary to the two last has an order of 3, meaning it can approximate functions of degree 3 like f^3.

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144644169-3d6f3c4d-8ab0-4010-b385-7f9df77cf0a9.png">
</p>

Finally with Simpson():

```
>> X = [0:0.1:10]
>> Y = @(x) cos(x)
>> Simpson(X, Y)
ans = -0.5440
```

## Part IV- Linear Systems

In this part the goal is to solve the equation Ax = b.

### Iterative Method:

We are going to construct a sequence of functions f(xk) and the goal is to find the fixed point of this function.

The idea is as follow:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144722190-3d979811-0fa8-4135-bc91-b3a69732b94f.png">
</p>

*To make it work you need to verify that the spectral radius of your matrix A is less than 1 but I won't cover this kind of demonstration here.*

#### Jacobi's Method:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144729577-eab622dc-5228-489f-b80c-95cc397cacea.png">
</p>

If A is strictly diagonally dominant, then the Jacobi's method associated with A converge.

```
>> A = [5 -1 1; 2 8 -1; -1 1 4];
>> b = [10 11 3].';
>> x0 = [0, 0, 0].';
>> Jacobi(A, b, x0, 10^-5, 10^3)
ans =
  2.0000
  1.0000
  1.0000
```

#### Gauss-Seidel's Method:

Gauss-Seidel has a rate of convergence faster than Jacobi because we compute approximations sooner in the sequence.

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144730311-263445e2-a7db-4865-bf05-4cbfefe97da4.png">
</p>

Just like Jacobi's method, Gauss-Seidel's method converge if A is strictly diagonally dominant.

```
>> A = [5 -1 1; 2 8 -1; -1 1 4];
>> b = [10 11 3].';
>> x0 = [0, 0, 0].';
>> GaussSeidel(A, b, x0, 10^-5, 10^3)
ans =
  2.0000
  1.0000
  1.0000
```

#### Relaxation's Method:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144730664-b9b58774-06ec-41a0-a9c2-40d647d2c101.png">
</p>

```
>> A = [5 -1 1; 2 8 -1; -1 1 4];
>> b = [10 11 3].';
>> w = 1/2;
>> x0 = [0, 0, 0].';
>> Relaxation(A, b, x0, w, 10^-5, 10^3)
ans =
  2.0000
  1.0000
  1.0000
```

### Direct Method:

It is possible to solve Ax = b for matrixes A triangular, as shown by the following equations:

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144760140-5db630bb-6998-47e7-a77c-f13f93a5ee49.png">
<img src="https://user-images.githubusercontent.com/65224852/144760400-b3b368a8-ae16-4bf7-9105-be549f8cff8e.png">
</p>

This is called the escalation method, the same is possible with lower triangular matrixes.

```
>> A = [1 2 3; 0 3 4; 0 0 2]
>> b = [2 2 2].';
>> Resolution(A, b)
ans =
  0.3333
 -0.6667
  1.0000
```

#### LU's factorization

Let A belong to Mn(K), A admits a factorization (or decomposition) LU when there exist a pair of (L, U) elements of Mn(K) with L lower triangular and U upper triangular, such as: A = LU.

If all the principal minors of A are not null, then A admits a factorization LU.

In order to get the LU's factorization we need to apply Gauss' pivots method:

```
>> A = [1 2 3; 2 3 4; 1 3 2]
>> [L, U] = LU(A)
L = 
  1  0  0
  2  1  0
  1 -1  1
U = 
  1  2  3
  0 -1 -2
  0  0 -3
```

#### Cholesky's factorization

