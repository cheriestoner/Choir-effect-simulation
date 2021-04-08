close all;
Fs = 16000;
volume = 0.01;
time = 3;
L = time*Fs;

wn = wgn(L, 1, 0); % Gaussian white noise
%% time domain
dt = 1/Fs;
t = (0:dt:time-dt);
figure
plot(t, wn);
xlabel('time (s)')
title('time domain')
%% fft - frequency domain
df = Fs/L;
f = (0:df:Fs-df);
Z = fft(wn);
Amp = abs(Z);
p = Amp/L;
figure
plot(f, p)
title('fft freq-amp')
% a = audioplayer(wn*volume, Fs);
% a.play;

% Phase shift
theta = pi;
Phase = angle(Z);   % in radians
%Phase = angle(Z)*180.0/pi; % in degrees
figure
plot(f, Phase)
title('fft freq-phase')
shiftPhase = Phase - theta; 
im = sqrt(-1);  % imaginary unit
% newZ = Amp.*(cos(shiftPhase) + im*sin(shiftPhase));
% newZ = Amp.*exp(im*shiftPhase);
for n=1:L
    Phase(1) = Phase(1)+theta;
    if n>1
        Phase(n) = Phase(n)+theta;
        Phase(L-n+2) = Phase(L-n+2)-theta;
    end
end
Z = Amp.*exp(im*Phase);
% for n=1:L
%     Z(1) = Z(1)*exp(im*pi);
%     if n>1
%         Z(n) = Z(n)*exp(im*pi);
%         Z(L-n+2) = Z(L-n+2)*exp(-im*pi);
%     end
% end
testifft = ifft(Z);