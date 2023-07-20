A = A_matrice();
imagesc(A);

function A=A_matrice()
deltarho=3.8;
step=0.005;
sigma2 = deltarho^2/(8*log(2));
taille_A=ceil(2.6*deltarho/step);
A=zeros(taille_A);

v=zeros(taille_A);

for i=1:taille_A
    phi=(i-ceil(taille_A/2))*step;
    v(i)=erf(phi/sqrt(2*sigma2));
end

max = abs(v(1)-v(taille_A));

for i=1:taille_A
    for j=1:i
        A(i,j)=abs(v(i)-v(j))/max;
    end
end
end



