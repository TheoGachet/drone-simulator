function [ph1,ph2]=sorties_photorecepteurs(x,y,I,A)
% importation du tableau d'environnement
%I = bandes;
%x = 500;
%y = 1000;
[~,nb_bandes]=size(I);
xn = I(1,:);
In = I(2,:);
deltarho=3.8;
thetamax = 2.6*deltarho;
% création du tableau contenant les angles
theta=zeros(1,nb_bandes);
for i=1:nb_bandes
    theta(i)=rad2deg(atan2(-y,xn(i)-x));
end

%réduction du tableau aux champs perçus par les deux photorécepteurs,
%respectivement :

%photorécepteur 1
index1a= -90 - (1.3*deltarho) - (deltarho/2);
index1b= -90 - (deltarho/2) + (1.3*deltarho);
idxchamp=find((theta>=index1a)&(theta<=index1b));
theta1 = theta(idxchamp);
[~,taille1] = size(theta1);
%reacalibration numérique 1
for i=1:taille1
   theta1(i) = abs(theta1(i)+90+(deltarho/2)+(1.3*deltarho))/thetamax*1976;
end
%calcul final pour ph1
ph1=0;
if taille1>1
    for i=1:taille1-1
        if(i==1)
          ph1 = ph1+ In(idxchamp(i))*A(ceil(theta1(i)),1);
        elseif(i==taille1-1)
          ph1 = ph1+ In(idxchamp(i))*A(1976,ceil(theta1(i)));
        else
          ph1 = ph1 + In(idxchamp(i))*A(ceil(theta1(i+1)),ceil(theta1(i)));
        end
    end
elseif taille1==1
     ph1 = ph1+ In(idxchamp(1))*A(ceil(theta1(1)),1);
     ph1 = ph1+ In(idxchamp(1))*A(1976,ceil(theta1(1)));
else
    ph1 = 0;
end

%photorecepteur 2
index2a= -90 - (1.3*deltarho) + (deltarho/2);
index2b= -90 + (deltarho/2) + (1.3*deltarho);

idxchamp2=find((theta>=index2a)&(theta<=index2b));
theta2 = theta(idxchamp2);
[~,taille2]=size(theta2);

%reacalibration numérique 2
for i=1:taille2
   theta2(i) = abs(theta2(i)+90-(deltarho/2)+(1.3*deltarho))/thetamax*1976;
end

%calcul final pour ph2
ph2=0;
if taille2>1
    for i=1:taille2-1
       if(i==1)
         ph2= ph2+ In(idxchamp2(i))*A(ceil(theta2(i)),1);
       elseif(i==taille2-1)
         ph2 = ph2+ In(idxchamp2(i))*A(1976,ceil(theta2(i)));
       else
         ph2 = ph2 + In(idxchamp2(i))*A(ceil(theta2(i+1)),ceil(theta2(i)));
       end
    end
elseif taille2==1
     ph2 = ph2+ In(idxchamp2(1))*A(ceil(theta2(1)),1);
     ph2 = ph2+ In(idxchamp2(1))*A(1976,ceil(theta2(1)));
else
    ph2 = 0;
end
end
