syms S;
frac = 5.52/(S^2 + 2.2*S + 4.4);
b = [5.52];
a = [1 2.2 4.4];
[coeffs roots] = residue(b, a);
coeffs 
roots
figure(1)
plot(real(roots), imag(roots), "o"); grid on
xlabel('Re')
ylabel('Im')
%% Импульс и его изображение
syms s;
frac = 5.52/(s^2 + 2.2*s + 4.4);
syms t;
u1(t) = 3*heaviside(t) - 6*heaviside(t-1) + 3*heaviside(t-2);
fplot(imp, [0, 3]); grid on; 
xlabel("t"); ylabel("U");
imp_image = laplace(imp);
laplace(imp)
u2(t) = vpa(ilaplace(frac*imp_image));
figure(2)
fplot(react, [0 7]); grid on; hold on
fplot(imp, [0 7]);
ylabel(["u2(t)" "u1(t)"])
xlabel("t")
legend("u2(t)", "u1(t)")
%% Реакция  




