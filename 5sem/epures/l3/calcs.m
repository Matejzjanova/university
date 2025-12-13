
% ls = linspace(0, 175, 100);
% Un = [2.9 2.8 2.5 2.1 1.7 1.4 1.388] ;
% a = [0 30 60 90 120 150 175];
% Kp = 1/4*sqrt(1 - cosd(a))
% UnNorm = Un/Un(1)
% pk1 = polyfit(a, Kp, 2);
% Kp2 = polyval(pk1, ls);
% plot(a, Kp, 'o');
% hold on;
% plot(ls, Kp2);
% ylabel("K_{п}");
% xlabel("\alpha")
% hold off
% figure
% pu1 = polyfit(a, UnNorm, 3);
% Unn2 = polyval(pu1, ls);
% plot(a, UnNorm, 'o')
% hold on;
% ylabel("U_n(\alpha)/{U_n(0)}")
% xlabel("\alpha")
% plot(ls, Unn2)

ls = linspace(0, 90, 100);
Un = [5.785 5.5 5.2 4.7 4  3.2 2.3 1.9 1.6 1.262 ] ;
a = [0 10 20 30 40 50 60 70 80 90];
Kp = 1/4*sqrt(1 - cosd(a))
UnNorm = Un/Un(1)
pk1 = polyfit(a, Kp, 2);
Kp2 = polyval(pk1, ls);
plot(a, Kp, 'o');
hold on;
plot(ls, Kp2);
ylabel("K_{п}");
xlabel("\alpha")
hold off
figure
pu1 = polyfit(a, UnNorm, 3);
Unn2 = polyval(pu1, ls);
plot(a, UnNorm, 'o')
hold on;
ylabel("U_n(\alpha)/{U_n(0)}")
xlabel("\alpha")
plot(ls, Unn2)

% ils = linspace(0, 100, 100);
% In = [2.04 34.74 57 79 98];
% Un = [9.6 7.195 5.185 3.2 2.9];
% plot(In, Un, 'o');
% hold on
% pu = polyfit(Un, In, 1);
% vu = polyval(pu, ils);
% plot(vu, ils);
% xlabel("I_н, мА");
% ylabel("U_н, В");
% 
% In90 = [4.08 6.13 8.17 9 10.21];
% Un90 = [4.4 1.9 1.3 0.736 0.462];
% plot(In90, Un90, 'square');
% hold on
% pu90 = polyfit(Un90, In90, 1);
% vu90 = polyval(pu90, ils);
% plot(vu90, ils, "--");
% legend('\alpha = 0^{\circ}','\alpha = 0^{\circ}','\alpha = 90^{\circ}', '\alpha = 90^{\circ}');


