syms S;
frac = 5.52/(S^2 + 2.2*S + 4.4);
b = [5.52];
a = [1 2.2 4.4];
[coeffs roots] = residue(b, a);
coeffs 
roots
figure(1)
%plot(real(roots), imag(roots), "o"); grid on
xlabel('Re')
ylabel('Im')
%% Импульс и его изображение
syms s;
frac = 5.52/(s^2 + 2.2*s + 4.4);
syms t;
u1(t) = 3*heaviside(t) - 6*heaviside(t-1) + 3*heaviside(t-2);
fplot(imp, [0, 3]); grid on; 
xlabel("t"); ylabel("U");
imp_im  = laplace(u1(t))
u2(t) = vpa(ilaplace(frac*imp_image));
figure(2)
fplot(react, [0 7]); grid on; hold on
fplot(imp, [0 7]);
ylabel(["u2(t)" "u1(t)"])
xlabel("t")
legend("u2(t)", "u1(t)")
%% Передаточная функция и остальное
syms S;
H1(S) = 5.52/(S*(S^2 + 2.2*S + 4.4));
b = [5.52];
a = [1 2.2 4.4 0];
[coeffs roots] = residue(b,a)
syms t
h1(t) = vpa(ilaplace(H1))
figure;
fplot(h1, [0 10]); grid on
xlabel("t"); ylabel("h1(t)")
%% ИХ
syms S;
H(S) = 5.52/(S^2 + 2.2*S + 4.4);
h(t) = vpa(ilaplace(H(S)))
figure;
fplot(h(t)); grid on; 
xlabel("t"); 
ylabel("h(t)")
%% АЧХ ФЧХ;
u1(t) = 3*heaviside(t) - 6*heaviside(t-1) + 3*heaviside(t-2);
U1(S) = laplace(u1(t));
syms w;
figure
subplot(2,1,1)
fplot(abs(U1(1*i*w)), [0 10])
subplot(2,1,2)
fplot(angle(U1(1i*w)))

A(w) = abs(-6*exp(-1i*w)*(sin(1/2*w))^2)/w
F(w) = angle(-6*exp(-1i*w)*(sin(1/2*w)))
figure
fplot(A(w), [0, 5])
figure
fplot(F(w), [0 25])