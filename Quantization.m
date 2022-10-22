% plot Waves(input signal , quantized signal , Quantization Error) in Time Domain

clear;close all;clc;

%% Input Signal Parameters 

fs = 100e6;                                 % Sampling Frequency
Ts = 1/fs;                                  % Sampling Period
cycle = 1801;                               % cycle = n * fin / fs
n = 32768;                                  % Number of FFT point
fin = 5.49621582e6;                         % Input frequency
Tin = 1/fin;                                % Input Period
A = 1;                                      % Input Amplitude
N = 15;                                     % number of ADC bits
t = linspace(0 , fs/fin ,n ) ;              % time axis to plot waves in one period

%% Definition of Input Signal

x = A*sin(2*pi*fin/fs*t);                   % linear sampler
% x = x + 0.1*x.^2 - 0.5*x.^3;              % non linear sampler

%% MID-Rise Quantization

N_samples=length(x);
xq_out=zeros(1,N_samples);
del = (2)/2.^N;                             % LSB or delta
vmax = 1-del/2;                             % maximum output
vmin = -1+del/2;                            % maximum output

for i = vmin:del:vmax
    for j = 1:N_samples
        if((i-del/2)<=x(j)&&(x(j)<=(i+del/2)))
           xq_out(j) = i;
        elseif(x(j)>vmax+del/2)
           xq_out(j) = vmax;
        elseif(x(j)<vmin-del/2)
           xq_out(j) = vmin;
        end   
    end   
end

%% Definition of Quantization Error

xe = xq_out - x;                    % Quantization error

%% Plot Input Signal,Quantized Signal and Quantization Noise in Time domain

figure(1);
plot( t ,x ,'b','linewidth',2)    
xlabel ('TIME(s)');
ylabel ('Amplitude(v)');
title ('Sin wave VS Time');
grid on;

figure(2);
plot( t ,xq_out ,'r','linewidth',2)   
xlabel ('TIME(s)');
ylabel ('Amplitude(v)');
title ('Quantized Input Signal')
grid on;

figure(3);
plot( t ,xe ,'m')  
xlabel ('TIME(s)');
ylabel ('Amplitude(v)');
title ('Quantization error')
grid on;
