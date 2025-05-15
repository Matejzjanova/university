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
fplot(u1, [0, 3]); grid on; 
xlabel("t"); ylabel("U");
imp_image  = laplace(u1(t))
u22(t) = vpa(ilaplace(frac*imp_image)); 
u22_periodic = u22(t) + u22(t-4)*heaviside(t-4);
figure(2)
fplot(u22_periodic, [0 7]); grid on; hold on
fplot(u1(t), [0 7]);
ylabel(["u2(t)" "u1(t)"])
xlabel("t")
legend("u2(t)", "u1(t)")
%% Передаточная функция и остальное
syms S;
H1(S) = 5.52/(S*(S^2 + 2.2*S + 4.4));
b = [5.52];
a = [1 2.2 4.4 0];
[coeffs roots] = residue(b,a);
syms t
h1(t) = vpa(ilaplace(H1));
figure;
fplot(h1, [0 10]); grid on
xlabel("t"); ylabel("h1(t)")


%% ИХ ФЧХ АЧХ
syms S t;
H(S) = 5.52/(S^2 + 2.2*S + 4.4);
h(t) = vpa(ilaplace(H(S)))
figure;
fplot(h(t)); grid on; 
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
fplot(w, AH(w), [0 10]); xlabel("\omega, Гц"); ylabel("A(\omega)"); hold on; grid on;
text(0, Amax/-sqrt(2) - 0.15, "0.707A_{max}")
plot([0, 2.44], [-Amax/sqrt(2), -Amax/sqrt(2)] , 'b--', 'LineWidth', 1.5); 
text(2.44, 0.1, "\omega_{пп}")
plot([2.44, 2.44], [0, -Amax/sqrt(2)] , 'b--', 'LineWidth', 1.5); 

subplot(2,1,2)
fplot(w, rad2deg(AF(w)), [0 10]); xlabel("\omega, Гц"); ylabel("\Phi(\omega)"); hold on; grid on; 
plot([0 2.44], [0 -100], "--b", 'LineWidth', 1.5)
t_delay = deg2rad(100)/2.44


figure;
TF = tf([5.52],[1 2.2 4.4]);
[re, im, wout] = nyquist(TF);
Re = squeeze(re); Im = squeeze(im);
H3 = H(1i*wout);
polarplot(angle(H3), abs(H3));
text(0, max(rlim), 'A(\omega)', 'HorizontalAlignment', 'right');
text(pi/2, max(rlim), '\Phi(\omega)', 'HorizontalAlignment', 'right');
text(-pi/2, 1.10, "\omega=2.1", HorizontalAlignment="left");
text(0.1, 1.2, "\omega=0", HorizontalAlignment="left");
    %% АЧХ Ф
syms t;
syms S;
u1(t) = 3*heaviside(t) - 6*heaviside(t-1) + 3*heaviside(t-2);
U1(S) = laplace(u1(t));
syms w;
A(w) = 6*(sin(1/2*w))^2/w;

F(w) = angle(6*1i*exp(-1i*w)*(sin(1/2*w)^2));
figure
subplot(2,1,1)
h = fplot(A(w), [0 50]); xlabel("\omega"); ylabel("A(\omega)"); grid on;
maxY = max(h.YData)
subplot(2,1,2)
fplot(rad2deg(F(w)),([0 50])); xlabel("\omega"); ylabel("\Phi(\omega)"); grid on;
W = 0.1:0.1:15;
A2 = A(W); F2 = F(W);
%% Period
warning('off')
T = 4;
syms w;
A(w) = 12*(sin(1/2*w))^2/w;
w0 = 2*pi/T;
W = w0:w0:10*w0;
A2 = A(W);
figure;
stem(W, A2); grid on;
ylabel("A_k"); xlabel("\omega, Гц");

F(w) = angle(12*1i*exp(-1i*w)*(sin(1/2*w)^2));
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
tm = mod(t, 4);
u2(t) = 3*heaviside(tm) - 6*heaviside(tm-1) + 3*heaviside(tm-2);
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
H(S) = 5.52/(S^2 + 2.2*S + 4.4);
syms w;
H2 = H(1i*w);
AH(w) = abs(H2);
AF(w) = angle(H2);
H_func = @(w) -138/(25*abs(- w^2 + (w*11i)/5 + 22/5));
[Wmax, Amax] = fminbnd(H_func, 0, 10);

syms s;
frac = 5.52/(s^2 + 2.2*s + 4.4);
syms t;
u1(t) = (3*heaviside(t) - 6*heaviside(t-1) + 3*heaviside(t-2));
xlabel("t"); ylabel("U");
imp_image  = laplace(u1(t))

AHk = AH(W);
A_2 = A2.*AHk;
Phi_2 = AF(W) + F2;
c_2(t) = cos(W*t + Phi_2);
h_2(t) = A_2.*c_2(t);
f_2(t) = 1/2*sum(h_2(t));
figure;
fplot(t, f_2(t), [0 7]); hold on; grid on;

u2_periodic = u22(t) + u22(t-4)*heaviside(t-4) + u22(t-8)*heaviside(t-8);
fplot(t, u2_periodic, [0 7], "b--")
legend( "Приближенная РФ реакция","Идеальная реакция");
xlabel("t"); ylabel("U")
%% 

A_2_simple = vpa(A_2/2)
vpa(rad2deg(Phi_2))

Amax