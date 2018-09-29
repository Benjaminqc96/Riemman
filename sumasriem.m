clear 
close all
clc
syms x
fu=input('Ingrese la funcion: ');
a=input('Ingrese el limite inferior: ');
b=input('Ingrese el limite superior: ');
fprima=diff(fu,x);
n=input('Ingrese el numero de intervalos: ');
delta=(b-a)/n;
puncrit=solve(fprima);
fbiprima=diff(fprima,x);
%puninf=solve(fbiprima);
%valoracion
for i=1:length(puncrit)
    valores(i)=double(subs(fbiprima,puncrit(i)));
    if valores (i)<0
        fprintf('Maximo en %f \n',puncrit(i))
        
      
    end
    if valores (i)>0
        fprintf('Minimo en %f \n',puncrit(i))
    end
    
end
for k=1:length(puncrit)
for i=1:n
    if valores (k)<0 && a<puncrit(k)
        apd(i)=a+(delta*(i-1));
        ape(i)=a+(delta*(i));
    elseif valores (k)>0 && a<puncrit(k)
         apd(i)=a+(delta*(i-1));
        ape(i)=a+(delta*(i));
    elseif valores (k)<0 && a>puncrit(k)
        apd(i)=a+(delta*(i));
        ape(i)=a+(delta*(i-1));
    elseif valores (k)>0 && a>puncrit(k)
         apd(i)=a+(delta*(i));
        ape(i)=a+(delta*(i-1));
    end
    
end
end
for j=1:n
    fx(j)=double(subs(fu,apd(j)));
    fx2(j)=double(subs(fu,ape(j)));
end
y=int(fu,a,b);
y1=sumari(delta, fx,n);
y2=sumari(delta, fx2,n);
epd=abs((y-y1)/y);
epe=abs((y-y2)/y);
disp(y)
disp(y1)
disp(y2)
fprintf('Error por defecto: %f \n',epd)
fprintf('Error por exceso: %f\n',epe)

