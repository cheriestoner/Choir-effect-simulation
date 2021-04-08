%% Source solo signal

% 10 seconds with one vowel and 4 pitches
addpath('/audio/');
filename = 'Vocal_kth';

[vocal_Sara, Fsamp] = audioread(strcat('/audio/',filename, '.wav')); 
% two channels, size = L * 2

L = length(vocal_Sara);
Time = L/Fsamp;
dt = 1/Fsamp;
t = (0:dt:Time-dt);
df = Fsamp/L;
f = (0:df:Fsamp-df);
%% Mixing partials with beats

% Varying the scaling factor changes the size of the "chorus"
% with ratio = 0.01, 0.015, 0.02, 0.025

t1 = round(0.25*L);
t2 = 2*t1;
t3 = 3*t1;
out1 = Mix(vocal_Sara(1:t1, :), Fsamp, 0.01);
out2 = Mix(vocal_Sara(t1+1:t2, :), Fsamp, 0.015);
out3 = Mix(vocal_Sara(t2+1:t3, :), Fsamp, 0.02);
out4 = Mix(vocal_Sara(t3+1:L, :), Fsamp, 0.025);
pOut = [out1;out2;out3;out4];

% Stable voice without changing the size

% pOut = Mix(vocal_Sara, Fsamp, 0.01);
%% Play without stereo

% volume = 1.0;
% sound(pOut, Fsamp);
% audiowrite(strcat('/audio/',filename, '_chorus.wav'), pOut, Fsamp);
%% Stereo
% Tried several ways:
% 1. Using what's called ping-pong delay, not working well
%    plus it's super slow

% addpath('stereo/');
% pOut_pingpong = ping_pong(pOut, Fsamp);
% audiowrite(strcat(filename, '_chorus_pingpong.wav'), pOut_pingpong, Fsamp);

% 2. Phase shift

% addpath('/stereo/');
% leftChannel = pOut(:,1);
% rightChannel = pOut(:,2);
% rightChannel = phaseShift(rightChannel, pi);
% 
% pOut_stereo = [leftChannel rightChannel];

% 3. Alternatively counterphase?
% using function phaseShift, but it did not work well perceptually
% pOut_stereo = pOut;

% 4. 2D stereo

period_b = 1.5;   % period of beat in second
x = (2*pi/period_b)*t;
x = x';
x1 = 0.8*sin(x);
x1 = x1 + 1;
x2 = 0.8*sin(x+pi);
x2 = x2 + 1;
p_sin = [pOut(:, 1).*x1, pOut(:, 2).*x2];

sound(p_sin, Fsamp);
% audiowrite(strcat('/audio/',filename, '_chorus_stereo.wav'), p_sin, Fsamp);