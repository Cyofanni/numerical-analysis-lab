N=11; 
a=-1;b=1; 
Iex=1.7791436546919097925911790299941;
g=inline('exp(x).*sqrt(1-x)'); 
f=inline('exp(x)');
[xt,wt]=trapezoidal_composite(N,a,b); % TPZ.
fxt=feval(g,xt);
It=wt'*fxt;
et=abs(Iex-It);
[xcs,wcs]=simpson_composite(N,a,b); % C.S.
fxcs=feval(g,xcs);Ics=wcs'*fxcs;ecs=abs(Iex-Ics);
[xgl,wgl]=gauss_jacobi(N,0,0); % G.L.
fxgl=feval(g,xgl);
Igl=wgl'*fxgl;
egl=abs(Iex-Igl);
[xj,wj]=gauss_jacobi(N,0.5,0); % G.J.
fxj=feval(f,xj);
Ij=wj'*fxj;
ej=abs(Iex-Ij);
fprintf('\n [TPZ]: %1.1e [CS]: %1.1e ',et,ecs); 
fprintf('[GL]: %1.1e [GJ]: %1.1e \n\n',egl,ej); 
