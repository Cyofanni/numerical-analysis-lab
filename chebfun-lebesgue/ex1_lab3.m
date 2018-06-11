%constante_lebesgue.pdf ex. 1
function ex1_lab3

format short e;

n = 100;
gauss_cheb_points = [];
ext_cheb_points = [];

for k = 1:n+1
    gauss_cheb_points(k) = cos(((2*k-1)*pi)/(2*(n+1)));
    ext_cheb_points(k) = cos(((2*k-1)*pi)/(2*(n+1))) * (1/(cos(pi/(2*(n+1)))));
end

fprintf("DIFFERENCE BETWEEN GAUSS-CHEB AND EXTENDED CHEB:");
gauss_cheb_points - ext_cheb_points
%opposite difference for the bounds