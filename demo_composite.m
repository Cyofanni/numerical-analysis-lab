N=11; %choose it odd.
a=-1;
b=1;
f=inline('x.^20');
% a=0; b=1; f=inline('exp(x)');
N_trap=N-1; % COMPOSITE TRAPEZOIDAL RULE.
[x_trap,w_trap]=trapezoidal_composite(N_trap,a,b);
fx_trap=feval(f,x_trap); 
I_trap=w_trap'*fx_trap;  
N_simpson=(N-1)/2; % COMPOSITE CAV.SIMPSON.
[x_simp,w_simp]=simpson_composite(N_simpson,a,b);
fx_simp=feval(f,x_simp);
I_simp=w_simp'*fx_simp;             
fprintf('\n\t [TPZ.COMP.][PTS]: %4.0f',length(x_trap));
fprintf('\n\t [TPZ.COMP.][RIS]: %14.14f',I_trap);
fprintf('\n\t [CS.COMP.][PTS]: %4.0f',length(x_simp));
fprintf('\n\t [CS.COMP.][RIS]: %14.14f \n\n',I_simp);
