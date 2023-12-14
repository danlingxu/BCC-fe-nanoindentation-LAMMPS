data_file_path = 'C:\Users\Danling\Desktop\mse316\test\disp_load_ppp.txt';

data = importdata(data_file_path);

displacement = data.data(:, 1);  % disp
load = data.data(:, 2);          % load

figure;
plot(displacement, load, 'b-', 'LineWidth', 2);
xlabel('nanoindentation depth (A)');
ylabel('load (eV/A)');
title('load-displacement curve - Set Up 1');
grid on;

unload_start = 28;
unload_end = 30;
unload_range = displacement > unload_start & displacement < unload_end; % unload region
P = polyfit(displacement(unload_range), load(unload_range), 1); % lin regression
S = P(1); % S = P(1) = dF/dh

disp(P(1))
