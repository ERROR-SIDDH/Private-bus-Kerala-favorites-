clc 
clear all 
close all 
syms t x y 
f=input('Enter the f vector as i and j order in vector form:');%[x^2 -x*y] 
rbar=input('Enter the r vector as i and j order in vector form:'); %[cos(t) sin(t)] 
lim=input('Enter the limit of integration:');%[0 pi/2] 
vecfi=input('Enter the vector field range:');%[0 2] 
drbar=diff(rbar,t); 
sub=subs(f,[x,y],rbar); 
f1=dot(sub,drbar) 
int(f1,t,lim(1),lim(2)) 
P=inline(vectorize(f(1)),'x','y'); 
Q=inline(vectorize(f(2)),'x','y') 
x=linspace(vecfi(1),vecfi(2),10); 
y=x; 
[X Y]=meshgrid(x,y); 
U=P(X,Y) 
V=Q(X,Y) 
quiver(X,Y,U,V) 
hold on 
fplot(rbar(1),rbar(2),[lim(1),lim(2)]) 
axis on 
xlabel('x') 
ylabel('y')

%% 
clc 
clear all 
close all 
syms t x y z 
f=input('Enter the f vector as i j and k order in vector form:');%[y+z x+z x+y] 
rbar=input('Enter the r vector as i j and k order in vector form:'); %[1+2*t 4*t 2*t] 
lim=input('Enter the limit of integration:');%[0 1] 
vecfi=input('Enter the vector field range:');%[-2 2] 
drbar=diff(rbar,t); 
sub=subs(f,[x,y,z],rbar); 
f1=dot(sub,drbar) 
int(f1,t,lim(1),lim(2)) 
P=inline(vectorize(f(1)),'x','y','z'); 
Q=inline(vectorize(f(2)),'x','y','z'); 
R=inline(vectorize(f(2)),'x','y','z'); 
x=linspace(vecfi(1),vecfi(2),10); 
y=x; 
z=x; 
[X Y Z]=meshgrid(x,y,z); 
U=P(X,Y,Z); 
V=Q(X,Y,Z); 
W=R(X,Y,Z); 
quiver3(X,Y,Z,U,V,W) 
hold on 
t=linspace(lim(1),lim(2),50); 
a=subs(rbar(1),t); 
b=subs(rbar(2),t); 
c=subs(rbar(3),t); 
plot3(a,b,c); 
axis on 
xlabel('x') 
ylabel('y') 
zlabel('z')

%% 
clc 
clear all 
close all 
syms x y r t 
F=input('Enter the F vector as i and j order in vector form:')%[3*y-exp(sin(x)) 
7*x+sqrt(y^4+1)] 
integrand=diff(F(2),x)-diff(F(1),y); 
polarint=r*subs(integrand,[x,y],[r*cos(t),r*sin(t)]) 
sol=int(int(polarint,r,0,3),t,0,2*pi) 
P=inline(vectorize(F(1)),'x','y'); 
Q=inline(vectorize(F(2)),'x','y'); 
x=linspace(-3.2,3.2,10); 
y=x; 
[X Y]=meshgrid(x,y); 
U=P(X,Y) 
V=Q(X,Y) 
quiver(X,Y,U,V) 
hold on 
fplot(3*cos(t),3*sin(t),[0,2*pi]) 
axis equal