
function noise_correct = calculatePN(bg, summa)
    noise_correct = zeros(1, 10);
    for i=1:10
        dB = sum(i) - bg(i);
        dB = round(dB);
        if dB >= 10
            noise_correct(1, i) = summa(1, i);
        elseif dB >= 6
            noise_correct(1, i) = summa(1, i) - 1;
        elseif dB >= 4
            noise_correct(1, i) = summa(1, i) - 2;         
        elseif dB == 3
            noise_correct(1, i) = summa(1, i) - 3;
        elseif dB == 2
            noise_correct(1, i) = summa(1, i) - 5;
        elseif dB <= 1
            noise_correct(1, i) = summa(1, i) - 7;
        end
    end
end
fr = [31.5 63 125 250 500 1000 2000 4000 8000];
noise_bg = [53.3 63.1 46.3 50.3 45.4 32.4 28.1 20 17.4 45.6];
noise_src = [59.5 70.4 52.7 77.5 90.5 99.2 102.2 93.3 67.6 105.1];
pure_src_noise = calculatePN(noise_bg, noise_src);


in_case = [55.7 68.5 54.3  66.8 80.3 91.1 94.8 82.4 53.8 97.3];
p_in_case = calculatePN(noise_bg, in_case);

in_antinoise_case = [58.8 71.8 58.8 67.9 79.6 81.2 87.1 73 40.6 89.2];
p_in_antinoise_case = calculatePN(noise_bg, in_antinoise_case);

shield = [64.9 69.5 58.2 74.1 81 97.7 92.5 82.4 81.5 55.8 99.3];
p_shield = calculatePN(noise_bg, shield);

shield2 = [63 67.9 57.9 75.7 82.6 97.6 94.4 82.4 56.8 99.8];
p_shield2 = calculatePN(noise_bg, shield2);

shield3 = [64.1 68.1 65.1 77 84.1 96.9 92.7 81.4 53.9 104];
p_shield3 = calculatePN(noise_bg, shield3);

shield4 = [65.4 71.1 60.5 74.6 81.4 96.9 92.7 81.4 53.9 98.8];
p_shield4 = calculatePN(noise_bg, shield4);

case_and_shield = [64.5 68.5 59.9 63.6 67.3 74.4 77.6 65 30.6 80.2];
p_case_and_shield = calculatePN(noise_bg, case_and_shield);



limit_45 = [86 71 61 54 49 45 42 40 38 45];
over_limit45 = -limit_45 + noise_bg

limit_75 = [170 95 87 82 78 75 73 71 69 75];
over_limit_75 = -limit_75 + noise_src


figure;
semilogx(fr, p_shield(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Стальной щит", "ПС-75", "ПС-45")

figure;
semilogx(fr, pure_src_noise(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Шум источника с поправкой", "ПС-75", "ПС-45")

figure;
semilogx(fr, noise_bg(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Фоновый шум", "ПС-75", "ПС-45")

figure;
semilogx(fr, p_in_case(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Источник в кожухе", "ПС-75", "ПС-45")

figure;
semilogx(fr, p_in_antinoise_case(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Источник в кожухе с шумоподавлением", "ПС-75", "ПС-45")

figure;
semilogx(fr, p_shield2(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Источник за щитом из оргалита", "ПС-75", "ПС-45")

figure;
semilogx(fr, p_shield3(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Источник за щитом с отверстием", "ПС-75", "ПС-45")

figure;
semilogx(fr, p_shield4(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Источник за щитом с перфорацией", "ПС-75", "ПС-45")

figure;
semilogx(fr, p_case_and_shield(1:9), "--o", "LineWidth", 2); hold on; grid on;
semilogx(fr, limit_75(1:9), "--");
semilogx(fr, limit_45(1:9), "LineWidth",2);
xlim([35 8000]);
xlabel("Частота, Гц");
ylabel("Уровень шума, дБ");
xticks(fr);
legend("Источник в кожухе c шумоподавлением и за щитом", "ПС-75", "ПС-45")

case1 = pure_src_noise - p_in_case
case2 = pure_src_noise - p_in_antinoise_case
s1 = pure_src_noise - p_shield
s2 = pure_src_noise - p_shield2
s3 = pure_src_noise - p_shield3
s4 = pure_src_noise - p_shield4
cs = pure_src_noise - p_case_and_shield

figure; 
semilogx(fr, case1(1:9), "--o"); hold on; grid on;
semilogx(fr, case2(1:9), "--square"); 
semilogx(fr, s1(1:9), "--o", "LineWidth", 2);
semilogx(fr, s2(1:9), "--square", LineWidth=2);
semilogx(fr, s3(1:9), LineWidth=2);
semilogx(fr, s4(1:9), "--")
semilogx(fr, cs(1:9));
xlabel("Частота, Гц");
ylabel("Эффективность шумоглушения, дБ");
legend("В кожухе", "Кожух с шумоподавлением", "Металлический щит", "Оргалитовый щит", "Щит с большим отверстием", ...
    "Щит с перфорацией", "Щит и кожух с шумоподавлением", Location="northwest")
xticks(fr);
