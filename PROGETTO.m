%% PROGETTO Descrivere l’approccio attuariale alla misurazione del rischio operativo
clc
clear
%PARAMETRI A DISCREZIONE DELL'UTENTE
mu=1.5;
sigma=1;
lambda=5;
n=1000;
alpha=0.99;

k = poissrnd(lambda,n,1);

prova=sort(k);
%le variabili x hanno distribuzione log normale
s=1;
max=max(k);
x=zeros(max,max);
for i=1:n
        x(1:k(i),s)=lognrnd(mu,sigma,k(i),1);
        s=s+1;     
        if s==n+1
            break
        end
end
L=sum(x);
L_sort=sort(L);
L_var=quantile(L_sort,alpha);



figure
subplot(2,2,1);
histogram(prova);
subplot(2,2,2);
% m = 0:.01:10;
% f = poisspdf(m,lambda);
% plot(m,f,'g')

subplot(2,2,3);
histogram(L_sort);
hold on
plot([L_var,L_var],[0 250],'r');
hold off




