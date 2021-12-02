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

## Two points formula

<p align="center">
<img src="https://user-images.githubusercontent.com/65224852/144458182-4d744402-4a64-43f5-81ec-2710b996acc1.PNG">
</p>

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

## Three points formula

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

## Part IV- Linear Systems
