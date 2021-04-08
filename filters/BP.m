% function Hd = BP()
%3OC Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.9 and Signal Processing Toolbox 8.5.
% Generated on: 11-Mar-2021 22:04:45

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

N   = 10;   % Order
Fc1 = 445;  % First Cutoff Frequency
Fc2 = 561;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]
%%
fvtool(hd)
% xlim([0 1.5])
% xt = get(gca, 'XTick');
% set(gca, 'XTick',xt, 'XTickLabel',xt*1E+3)
% xlabel('Frequency (Hz)')