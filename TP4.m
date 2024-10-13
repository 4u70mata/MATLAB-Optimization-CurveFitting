%Exercice 1 : Régression 
    %syntaxe'lsqcurvefit' to Solve nonlinear curve-fitting (data-fitting) problems in least-squares sense
%Patie 1:
clc,clear,close all,
xdata=[1999:2004];
ydata=[15,20,32,26,33,55];
x0=[1,1];
teta= lsqcurvefit(@fun,x0,xdata,ydata);
zfun=fun(teta,xdata);
figure(1),
plot(xdata,ydata,'*')
hold on
plot(xdata,zfun)
legend('Data','Fitted Line PLot')
xlabel('Année')
ylabel('Chiffre d’affaire enDH ')
title('L’évolution du chiffre d’affaire d’une entreprise sur plusieurs années.')
CA=fun(teta,2005)%Chiffre d'affaire a 2005 est de 53.4666DH
%Patie 2:
clc,clear,close all,
T=[0,21.1,37.8,54.4,71.1,87.8,100];
Mu=[1.79,1.13,0.696,0.519,0.338,0.321,0.296];
x0=[1,1,1,1];
A=lsqcurvefit(@fun1,x0,T,Mu);
zfun1=fun1(A,T);
figure(2),
plot(T,Mu,'O')
hold on
plot(T,zfun1);
legend('Data','Fitted Line PLot')
xlabel('Température T◦C')
ylabel('Viscosité cinématique de l’eau μ')
title(' μ de l’eau varie en fonction de la température T◦C')
Mu10=fun1(A,10)%μ(10◦)=1.434507178376483
Mu30=fun1(A,30)%μ(30◦)=0.888943874550171
Mu60=fun1(A,60)%μ(60◦)=0.436569740087430
Mu90=fun1(A,90)%μ(90◦)=0.301552983375203
%Exercice 2 : Optimisation linéaire
     %syntaxe 'linprog' to solve linear programming problems
clc,clear,close all,
% linear inequality constraints:
% inequality constraints matrix 
A = [5 -7 -25];
b =[0];
% linear equality constraint:
Aeq = [1 1 1];
beq = [18];
% Setting bounds:
lb = [0 0 0];
ub = [25 4 6];
% Objective Function:
f=[-900 -700 -500];
% Solve the linear program using the predefined function 'linprog()':
x = linprog(f,A,b,Aeq,beq,lb,ub) 
%le meilleurs bénéfice possible est de parametre 15 pour Producteur1,
%0 pour Producteur2 et 3 pour Producteur3
benif=-f*x 
%le meilleurs bénéfice possible est 15000DH

%Exercice 3 : Optimisation non-linéaire
     %Syntaxe 'fmincon' Find minimum of constrained nonlinear multivariable function
clc,clear,close all,
%There are no linear constraints, so set those arguments to [].
A=[];
b=[];
Aeq=[];
beq=[];
ub=[];
lb=[0,0,0];
% We choose an initial point satisfying all the constraints:
x0=[20,20,10] ;
x = fmincon(@Cmin,x0,A,b,Aeq,beq,lb,ub,@nonlincontraint)
% dim (a=41.6017; b=41.6017;h=2.3112)
coutminimiser=Cmin(x)
%le coût minimal de construction est de 1.0384 millions de Dh


