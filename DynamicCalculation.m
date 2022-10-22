% calculation daynamic parameters(SNR,SNDR,SFDR,ENOB) and plot spectrum of
% Waves (Quantized signal , ADC output) in frequency domain
%%
clc;
clear;
close all;
%% Input Signal Parameters

n = 32768;                                  % Number of FFT point
fs = 100e6;                                 % Sampling Frequency
fin = 5.49621582e6;                         % Input frequency
t = linspace(1,1/fin,n);
cycle = 1801;                               % cycle = n * fin / fs
A = 0.1;                                    % Input Amplitude
N = 15;                                     % number of ADC bits


del  = 2/2.^N;                              % LSB or delta
vmax = 1-del/2;                             % maximum output
vmin = -1+del/2;                            % minimum output

%% Definition of Input Signal

x = A*sin(2*pi*fin/fs*(0 : n-1));          % linear sampler
% x = x + 0.1*x.^2 - 0.5*x.^3;               % non linear sampler

%% MID-Rise Quantization

N_samples=length(x);
xq_out=zeros(1,N_samples);

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

%% Calculate Dynamic Parameters(SNR,SNDR)

s = abs(fft(xq_out , n));           % Output specturm
s = s(1:end/2)/ n / A * 2 ;

sigbin1 = 1*cycle+1 ;
sigbin2 = 2*cycle+1 ;
sigbin3 = 3*cycle+1 ;

noise = [s(2:sigbin1-1) , s(sigbin1+1:end)];
sndr = 10*log10(s(sigbin1)^2/sum(noise.^2));
NOISE = [s(2:sigbin1-1), s(sigbin1+1:sigbin2-1), s(sigbin2+1:sigbin3-1) , s(sigbin3+1:end)];
snr = 10*log10(s(sigbin1)^2/sum(NOISE.^2));

%% Plot Output Spectrum in Frequency Domain and Calculation of (SFDR,ENOB)

f = (0 : n/2-1) / n;
s = 20*log10(s);
figure(1)
plot(f, s)
grid on
xlabel('Frequency[fin/fs]');
ylabel('DFT Magnitude [dbfs]');
title('Output spectrum'); 
[pks , locs] = findpeaks(s) ;
max1 = max(pks);                      % largest component
s(sigbin1) = [];             
s(1) = [];                   
max2 = max(s);                        % largest spurious 
sfdr = max1 - max2;
enob = (sndr -1.76)/6.02;

%% Plot Input Signal,Quantized Signal and Quantization Noise

figure(2)
plot(t,x,'b');
xlabel('Time[s]');
ylabel('Input Signal');
title('Input Signal');
grid on

figure(3)
plot(t,xq_out,'r');
xlabel('Time[s]');
ylabel('Quantized Signal');
title('Quantized Signal');
grid on

figure(4)
plot(t,xe,'g');
xlabel('Time[s]');
ylabel('Quantization Noise');
title('Quantization Noise');
grid on
