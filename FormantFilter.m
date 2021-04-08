function partial = FormantFilter(noise, Fct, Fs, ratio)
% Second-order formant filter, from the JoLi cheat sheet

% Coefficients
T = 1/Fs;
Q = 5.0;

% The resonance frequency is proportional to the centre freq of the
% corresponding bandpass filter with a default ratio = 0.01
% ratio = 0.01;   % change the perceptual size of the choir
Fb = ratio * Fct;

beta = Fb * 2 * pi;
beta0 = beta * sqrt(1 + 1/(4*Q^2));
alpha = beta0 / (2*Q);
a1 = -2 * exp(-alpha*T) * cos(beta*T);
a2 = exp(-2*alpha*T);
G = 1 + a1 + a2;

% The recursive formula
partial = noise;
partial(1) = 0.0;
partial(2) = 0.0;
for n=3:length(noise)
    partial(n) = G*partial(n) - a1*partial(n-1) - a2*partial(n-2);
end

end