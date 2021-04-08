function stereoSig = ping_pong(signal, Fs)
% Delays
delayMs = 250;
dL = fix(delayMs/1000 * Fs);
dR = dL;
% Delay buffers
bufferL = zeros(dL, 1);
bufferR = zeros(dR, 1);
% Ping-pong delay
for i=1:length(signal)
    leftChannel = 0.707*signal(i, 1) + bufferL(end, 1);
    rightChannel = 0.707*signal(i, 1) + bufferR(end, 1);
    
    bufferL = [signal(i, 1) + bufferR(end, 1); bufferL(1:end-1, 1)];
    bufferR = [bufferR(end, 1); bufferL(1:end-1, 1)];
    
    stereoSig(i, :) = [leftChannel, rightChannel];
end
volume = 0.5;
stereoSig = volume*stereoSig;
end