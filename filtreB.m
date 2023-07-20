
function [b,a] = filtreB
freq = 2000; % la fréquence d'échantillonnage est fournie par l'énonce
[b,a] = butter(2, [20,116]/(freq/2));
end
