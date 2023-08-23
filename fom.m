function [dsocp_surf,dsocn_surf]=fom(rp,rn,Dsp,Dsn,I,Qp,Qn)
taup=rp^2/Dsp;
taun=rn^2/Dsn;

ap=[1,0.142570867246456*sqrt(taup)];
an=[1,0.142570867246456*sqrt(taun)];

na=[0,0.5];
b=0.244188370659625;
nb=0;

tfp=fotf(ap,na,b,nb);
tfn=fotf(an,na,b,nb);

dsocp_surf=lsim(tfp,I,1:length(I))*taup/3600/Qp/3;
dsocn_surf=lsim(tfn,I,1:length(I))*taun/3600/Qn/3;
end