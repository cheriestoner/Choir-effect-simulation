function Sig = phaseShift(orgSig, theta)
% leftChannel = orgSig(:,1);
% rightChannel = orgSig(:,2);
L = length(orgSig);
pZ = fft(orgSig);
% Extracting phases using fft
pAmp = abs(pZ);
pPhase = angle(pZ);

% Phase shift
im = sqrt(-1);
for n=1:L
    pPhase(1) = pPhase(1)+theta;
    if n>1
        pPhase(n) = pPhase(n)+theta;
        pPhase(L-n+2) = pPhase(L-n+2)-theta;
    end
end
pZ = pAmp.*exp(im*pPhase);
% for n=1:L
%     pZ(1) = pZ(1)*exp(im*theta);
%     if n>1
%         pZ(n) = pZ(n)*exp(im*theta);
%         pZ(L-n+2) = pZ(L-n+2)*exp(-im*theta);
%     end
% end
Sig = real(ifft(pZ)); % Inverse fft

% close all;
% figure
% plot(stereoSig)
% title('is real?')
end