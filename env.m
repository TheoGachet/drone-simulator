
function  largeur = env()

hold off;

total = 0;
largeur(1,1) = 0;
largeur(2,1) = randi([0 255]);
i = 2;

% largeur entre 10mm et 100mm
% total = 4000mm

while total < 4000
    rd = randi([10 100],1,1);
    if total+rd > 4000
        rd = 4000-total;
    end
    largeur(1,i)=total+rd;
    total = total+rd;
    i = i+1;
end

[~,numCols] = size(largeur);
nb_bandes = numCols;

for j=2:nb_bandes
    largeur(2,j)=randi([0 255]);
end

for i=1:numCols-1
    x = [largeur(1,i) largeur(1,i+1) largeur(1,i+1) largeur(1,i)];
    y = [0 0 1 1];
    fill(x,y,[largeur(2,i)/255 largeur(2,i)/255 largeur(2,i)/255]);
    hold on;
end

% dernière bande
x = [largeur(1,end) 4000 4000 largeur(1,end)];
y = [0 0 1 1];
fill(x,y,[largeur(2,end)/255 largeur(2,end)/255 largeur(2,end)/255])
hold on;

% on enregistre le tableau pour l'utiliser ensuite
filename = 'C:\Users\theog\Documents\Mes Cours\Projet Matlab\FINAL\bandes.mat';
save(filename, 'largeur');

end

