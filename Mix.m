function mix = Mix(solo, Fsamp, ratio)
coef = 10.0;    % volume of the white noise
len = length(solo);
%% Filtering
std_centres = [100, 125, 160, 200, 250, 320, 400, 500, 640, 800, 1000, 1250, 1600, 2000, 2500, 3200, 4000, 5000, 6400, 8000, 10000, 12800, 16000];
for i=1:length(std_centres)
    Fct = std_centres(i);
    noise = coef*wgn(len, 1, 0);    % generate independent white noises for each partial
    beat = FormantFilter(noise, Fct, Fsamp, ratio); % the resonance coming from the noise
    bpf = FilterBank(Fct, Fsamp); % bandpass filter centred at Fct
    formant = filter(bpf, solo); % output of the bandpass filter
    % two channels
    Left = beat.*formant(:, 1); % multiplied by the resonance
    Right = beat.*formant(:, 2);
%     % Plot the filter
%     if (Fct==500.0)
%         fvtool(bpf, 'Fs', Fsamp)
%         xlim([0 1.5])
%         title(sprintf('Bandpass filter centred at %i Hz', round(Fct)))
%     end
    if i==1
        mix = [Left Right];
    elseif mod(i, 2)==1
%         pLeft = beat.*phaseShift(formant(:, 1), pi); % multiplied by the resonance
        mix = mix + [Left Right];
    else
%         pRight = beat.*phaseShift(formant(:, 2), pi);
        mix = mix + [Left Right];
    end
end

end