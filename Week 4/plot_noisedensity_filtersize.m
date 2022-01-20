close all, clear all, clc

Noise_density = 0.1:0.1:1
Filter_size = [3 5 5 7 7 9 12 16 30 32]

scatter(Noise_density, Filter_size),title('Filter Size VS Noise Density')
xlabel('Noise Density')
ylabel('Median Filter Size')