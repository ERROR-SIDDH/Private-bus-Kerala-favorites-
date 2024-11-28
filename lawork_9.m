% To Find Divergence,Gradient,Plotting Vector,Curl.
clc
clear all
close all
syms x y
F=[x y] %input('Enter the vector as i,and j order in vector form:-'); %[x y]
P=inline(vectorize(F(1)),'x','y');
Q=inline(vectorize(F(2)),'x','y');
x=linspace(-1,1,10);
y=x;
[X,Y]= meshgrid(x,y);
U=P(X,Y);
V=Q(X,Y);
quiver(X,Y,U,V,1)
axis on
xlabel('x')
ylabel('y')
%%
syms x y z 
F=[x -y z] %input('Enter the vector as i,j,k in order in vector form')
P=inline(vectorize(F(1)),'x','y','z');
Q=inline(vectorize(F(2)),'x','y','z');
R=inline(vectorize(F(3)),'x','y','z');
x=linspace(-1,1,5);
y=x;
z=x;
[X,Y,Z]=meshgrid(x,y,z);
U=P(X,Y,Z);
V=Q(X,Y,Z);
W=R(X,Y,Z);
quiver3(X,Y,Z,U,V,W,1.5)
axis on 
xlabel ('x')
ylabel ('y')
zlabel ('z')
%%
clc
clear all
close all
syms x y
f=x^2*y-y^3 %input('Enter the function f(x,y):');%x^2*y-y^3
F=gradient(f)
P=inline(vectorize(F(1)),'x','y');
Q=inline(vectorize(F(2)),'x','y');
x=linspace(-2,2,10);
y=x;
[X,Y]= meshgrid(x,y);
U=P(X,Y);
V=Q(X,Y);
quiver(X,Y,U,V,1)
axis on
xlabel('x')
ylabel('y')
hold on 
ezcontour(f,[-2,2])
%%
clc
clear all
syms x y z real
F=[x^2*y*z x*y^2*z x*y*z^2] %input('Enter the vector as i,jand k order in vector form:')% [x^2*y*z x*y^2*z x*y*z^2]
curl_F=curl(F, [x y z])
div_F= divergence(F, [x y z])
%%
% To Determine Weather The Vector field is Conservative
clc
clear all
syms x y z real
F=[y^2*z^3 2*x*y*z^3 3*x*y^2*z^2] %input('Enter the vector as i,jand k order in vector form:')% [y^2*z^3 2*x*y*z^3 3*x*y^2*z^2]
curl_F=curl(F, [x y z])
if (curl_F==[0 0 0])
    f=potential(F,[x y z])
else
    sprintf('curl_F is not equal to zero')
end