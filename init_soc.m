function [soc0p,soc0n]=init_soc(V,k)

maxiter=100;
tol=1e-6;

load remain_li.mat;
% remain_li(k)=0.9123459;
Lpos=183e-6;
Lsep=52e-6;
Lneg=100e-6;

epsspos=0.297;
epssneg=0.471;

csmaxpos=22860;
csmaxneg=26390;

x_high=0.9;
x_low=0.1;
x(1)=0.5;
for i=1:maxiter
socp=x(i);
lipos=Lpos*epsspos*csmaxpos*x(i);
lineg=remain_li(k)-lipos;
socn=lineg/Lneg/epssneg/csmaxneg;
dv(i)=Eeq_pos(socp)-Eeq_neg(socn)-V;

if abs(dv(i))<=tol
    break;
elseif dv(i)<=0
    x_high=x(i);
else
    x_low=x(i);
end
x(i+1)=(x_high+x_low)/2;

end
soc0p=socp;
soc0n=socn;

end