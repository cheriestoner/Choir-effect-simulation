Fs = 44100;
centres = [100.0];
centre = 100.0;
f_1 = centre/nthroot(2, 6);
f_2 = nthroot(2, 3)*f_1;
f1s = [f_1];
f2s = [f_2];
while 1
    f_1 = f_2;
    centre = nthroot(2, 6)*f_1;
    f_2 = nthroot(2, 3)*f_1;
    if f_2 >= Fs/2
        break;
    end
    f1s = [f1s, f_1];
    f2s = [f2s, f_2];
    centres = [centres, centre];
end
%% centres
% 100 125 160 200 Hz
% 200 250 320 400
% 400 500 640 800
% 800 1000 1250 1600
% /Sten
% 1600 2000 2500 3200
% 3200 4000 5000 6400
% 6400 8000 10000 12800 16000

std_centres = [100, 125, 160, 200, 250, 320, 400, 500, 640, 800, 1000, 1250, 1600, 2000, 2500, 3200, 4000, 5000, 6400, 8000, 10000, 12800, 16000];
std_f1s = [];
std_f2s = [];
for i=1:length(std_centres)
    f1 = round(std_centres(i)/nthroot(2,6));
    f2 = round(nthroot(2,3)*f1);
    std_f1s = [std_f1s, f1];
    std_f2s = [std_f2s, f2];
end
