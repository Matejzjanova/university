A0 = repmat(-15.8, 1, 7);
A0V = sqrt(1e-3*10.^(A0./10));
A2 = [-30 -33 -34 -34 -34 -46 -47];
A2V = sqrt(1e-3*10.^(A2./10));
m1 = A2V./A0V;
f = [ 8 16 24 32 40 48 56];

% A0 = repmat(-15.2, 1, 8);
% A0V = sqrt(1e-3*10.^(A0./10));
% A2 = [-27.1 -28 -29 -30 -33 -35 -36 -38];
% A2V = sqrt(1e-3*10.^(A2./10));
% m1 = A2V./A0V;
% f = [4 8 16 24 32 40 48 56];

fLin = linspace(8, 56, 1000);
Pm1 = polyfit(f, m1, 2);
Vm1 = polyval(Pm1, fLin);
plot(f, m1, "o"); hold on; grid on;
plot(fLin, Vm1);
% xlim([4 56])
xlim([8 56])
xlabel("F, кГц")
ylabel("m")


