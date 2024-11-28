clc
clear all
syms x y lam real
f = x^2 + 2*y^2; % Corrected y2 to y^2
g = x^2 + y^2 - 1; % Corrected the comment
F = f - lam * g;

Fx = diff(F, x);
Fy = diff(F, y);
[ax, ay, alam] = solve([Fx, Fy, g], x, y, lam); % Corrected syntax for solve
ax = double(ax);
ay = double(ay);

% Collecting critical points
r = 1; % Corrected initialization
for k = 1:length(ax) % Changed size to length
    if ((imag(ax(k)) == 0) && (imag(ay(k)) == 0))
        ptx(r) = ax(k);
        pty(r) = ay(k);
        r = r + 1;
    end
end
ax = ptx;
ay = pty;
T = subs(f, {x, y}, {ax, ay}); % Corrected syntax for subs
T = double(T);
epx = 3;
epy = 3;
figure(1)
for i = 1:length(T)
    D = [ax(i) - epx, ax(i) + epx, ay(i) - epy, ay(i) + epy];
    fprintf('The critical point (x, y) is (%1.3f, %1.3f).\n', ax(i), ay(i)) % Added newline character
    fprintf('The value of the function is %1.3f\n', T(i)) % Corrected syntax for fprintf
    ezcontour(f, D)
    hold on
    h = ezplot(g, D);
    set(h, 'Color', [1, 0.7, 0.9])
    plot(ax(i), ay(i), 'k.', 'markersize', 15 + 2 * i)
end
f_min = min(T); % Corrected variable name and syntax
f_max = max(T); % Corrected variable name and syntax
