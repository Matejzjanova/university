syms S;
frac = 1.38/(S^2 + 1*S + 1.5);
b = [1.38];
a = [1 1 1.5];
[coeffs roots] = residue(b, a);
coeffs 
roots
figure(1)
plot(real(roots), imag(roots),  "*", "LineWidth", 5); grid on
xlabel('Re')
ylabel('Im')
%% Импульс и его изображение
set(groot, 'DefaultAxesFontSize', 12);            % Размер шрифта цифр градации
set(groot, 'DefaultAxesLabelFontSizeMultiplier', 1.2);  % Множитель для подписей осей
warning("off")
syms s;
frac = 1.38/(s^2 + 1*s + 1.5);
syms t;
u1(t) = 3*heaviside(t) - 6*heaviside(t-1.5) + 3*heaviside(t-3);
fplot(u1, [0, 4]); grid on; ylim([-4 4])
xlabel("t"); ylabel("U");
imp_image  = laplace(u1(t))
% frac*imp_image;
u22(t) = vpa(ilaplace(frac*imp_image), 3);
vpa(ilaplace(frac*imp_image), 2)
u22_periodic = u22(t);
figure(2)
fplot(u22_periodic, [0 7]); grid on; hold on; ylim([-4 4])
fplot(u1(t), [0 7]);
ylabel(["u(t)"])
xlabel("t")
legend("u_2(t)", "u_1(t)")
%% 
syms s t;
frac1 = 5.38*3/s/(s^2 + 1*s + 1.5);
part1(t) = vpa(ilaplace(frac1), 3)
part2(t) = -vpa(ilaplace(frac1*2), 3);
part3(t) = part1;
u2 = part1(t)*heaviside(t) + part2(t-1)*heaviside(t-1) + part3(t-2)*heaviside(t-2);
fplot(u2);
%% Передаточная функция и остальное
syms S;
H1(S) = 1.38/(S*(S^2 + 1*S + 1.5));
b = [1.38];
a = [1 1 1.5 0];
[coeffs roots] = residue(b,a)
syms t
h1(t) = vpa(ilaplace(H1), 2)
figure;
fplot(h1, [0 10]); grid on; ylim([0 1.2])
xlabel("t"); ylabel("h_1(t)")


%% ИХ ФЧХ АЧХ

set(groot, 'DefaultAxesLineWidth',0.5);
syms S t;
H(S) = 1.38/(S^2 + S + 1.5);
h(t) = vpa(ilaplace(H(S)))*heaviside(t)
figure;
h_plot = fplot(h(t), [0 7]); grid on; ylim([-0.2 0.8])
xlabel("t"); 
ylabel("h(t)")

syms w;
H2 = H(1i*w);
AH(w) = abs(H2);
AF(w) = angle(H2);
H_func = @(w) -138/(25*abs(- w^2 + (w*11i)/5 + 22/5));
[Wmax, Amax] = fminbnd(H_func, 0, 10);
figure;
subplot(2,1,1)
fplot(w, AH(w), [0 10]); xlabel("\omega, Гц"); ylabel("A(\omega)"); hold on; grid on; ylim([0 1.5])
text(0, Amax/-sqrt(2) - 0.15, "0.707A_{max}")
plot([0, Wmax], [-Amax/sqrt(2), -Amax/sqrt(2)] , 'b--', 'LineWidth', 1.5); 
text(2.44, 0.1, "\omega_{пп}")
plot([Wmax, Wmax], [0, -Amax/sqrt(2)] , 'b--', 'LineWidth', 1.5); 

subplot(2,1,2)
fplot(w, rad2deg(AF(w)), [0 10]); xlabel("\omega, Гц"); ylabel("\Phi(\omega)"); hold on; grid on; 
plot([0 Wmax], [0 -100], "--b", 'LineWidth', 1.5)
t_delay = deg2rad(100)/Wmax
W_5 = [1 2 3 4 5];
A_discr = AH(W_5);
F_discr = AF(W_5);
figure;
TF = tf([1.38],[1 1 1.5]);
[re, im, wout] = nyquist(TF);
Re = squeeze(re); Im = squeeze(im);
H3 = H(1i*wout);
polarplot(angle(H3), abs(H3)); hold on;
polarplot(F_discr, A_discr, "o");
text(0, max(rlim), 'A(\omega)', 'HorizontalAlignment', 'right');
text(pi/2, max(rlim), '\Phi(\omega)', 'HorizontalAlignment', 'right');
text(0.1, 1.2, "\omega=0", HorizontalAlignment="left");
    %% АЧХ Ф
syms t;
syms S;
u1(t) = 3*heaviside(t) - 6*heaviside(t-1) + 3*heaviside(t-2);
U1(S) = laplace(u1(t));
syms w;
A(w) = 12*(sin(0.75*w))^2/w;

F(w) = angle(12*1i*exp(-1.5i*w)*(sin(0.75*w)^2));
figure
subplot(2,1,1)
h = fplot(A(w), [0 50]); xlabel("\omega"); ylabel("A(\omega)"); grid on; ylim([0 7])
maxY = max(h.YData)
subplot(2,1,2)
fplot(rad2deg(F(w)),([0 50])); xlabel("\omega"); ylabel("\Phi(\omega)"); grid on;
W = 0.1:0.1:15;
A2 = A(W); F2 = F(W);
%% Period
warning('off')
T = 6;
syms w;
A(w) = 12*(sin(0.75*w))^2/w;
w0 = 2*pi/T;
W = w0:w0:10*w0;
A2 = A(W);
figure;
stem(W, A2); grid on;
ylabel("A_k"); xlabel("\omega, Гц");

F(w) = angle(12*1i*exp(-1.5i*w)*(sin(0.75*w)^2));
F2 = F(W);
figure;
stem(W, rad2deg(F2)); grid on;
ylabel("\Phi_k"); xlabel("\omega, Гц")

syms t;
c(t) = cos(W*t + F2);
h(t) = 2/T*A2.*c(t);
u1(t) = sum(h(t));
figure;
fplot(t, u1(t), [0 10]); grid on; hold on;
tm = mod(t, 6);
u2(t) = 3*heaviside(tm) - 6*heaviside(tm-1.5) + 3*heaviside(tm-3);
fplot(t, u2(t), [0 10]);
ylabel("U"); xlabel("t");


figure;
c1(t) = A2(1).*cos(W(1)*t + F2(1));
c2(t) = A2(2).*cos(W(2)*t + F2(2));
c3(t) = A2(3).*cos(W(3)*t + F2(3));
fplot(t, c1(t), [0 5]); grid on; hold on;
fplot(t, c2(t), [0 5]);
fplot(t, c3(t), [0 5]);

syms S t;
H(S) = 1.38/(S^2 + 1*S + 1.5);
syms w;
H2 = H(1i*w);
AH(w) = abs(H2);
AF(w) = angle(H2);
H_func = @(w) -138/(25*abs(- w^2 + (w*11i)/5 + 22/5));
[Wmax, Amax] = fminbnd(H_func, 0, 10);

syms s;
frac = 1.38/(s^2 + 1*s + 1.5);
syms t;
u1(t) = (3*heaviside(t) - 6*heaviside(t-1.5) + 3*heaviside(t-3));
xlabel("t"); ylabel("U");
imp_image  = laplace(u1(t))

AHk = AH(W)./2;
A_2 = A2.*AHk;
Phi_2 = AF(W) + F2;
c_2(t) = cos(W*t + Phi_2);
h_2(t) = A_2.*c_2(t);
f_2(t) = 1/2*sum(h_2(t));
figure;
fplot(t, f_2(t), [0 7]); hold on; grid on;

u2_periodic = u22(t) + u22(t-6)*heaviside(t-6) + u22(t-12)*heaviside(t-12);
fplot(t, u2_periodic, [0 7], "b--")
legend( "Приближенная РФ реакция","Идеальная реакция");
xlabel("t"); ylabel("U")
%% 

A_2_simple = vpa(A_2/2)
vpa(rad2deg(Phi_2))

Amax