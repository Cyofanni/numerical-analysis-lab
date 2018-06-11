%approximating the square wave with algebraic polynomials
%chebfun.pdf pag. 38
function ex5_lab3

warning off;

N1 = 5; 
f1 = chebfun(@(t) -sign(abs(t)-pi/2), [-pi pi], N1+1);
maxN1=max(f1);

N2 = 15;
f2 = chebfun(@(t) -sign(abs(t)-pi/2), [-pi pi], N2+1);
maxN2 = max(f2);

N3 = 25; 
f3 = chebfun(@(t) -sign(abs(t)-pi/2), [-pi pi], N3+1); 
maxN3 = max(f3);

fprintf('\n \t GIBBS SIZE (%3.0f): %1.5e', N1, maxN1)
fprintf('\n \t GIBBS SIZE (%3.0f): %1.5e', N2, maxN2)
fprintf('\n \t GIBBS SIZE (%3.0f): %1.5e', N3, maxN3)

xx = linspace(-pi, pi, 1000);
yy = -sign(abs(xx) - pi/2);

clf;
hold on;
plot(xx,yy,'r-');
plot(f1, 'k-', 'LineWidth', 2);
hold off;
fprintf('\n \t PAUSE');
pause;

clf;
hold on;
plot(xx,yy,'r-');
plot(f2,'k-','LineWidth', 2);
hold off;
fprintf('\n \t PAUSE');
pause;

clf;
hold on;
plot(xx,yy,'r-');
plot(f3,'k-','LineWidth', 2);
hold off;
fprintf('\n \t PAUSE');
pause;

fprintf('\n \n');
