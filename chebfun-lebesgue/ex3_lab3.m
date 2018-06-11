%costante_lebesgue.pdf ex. 3
function ex3_lab3

format long e;

leb_equi = [];    %lebesgue constants for equispaced nodes
leb_cheb = [];    %lebesgue constants for gauss-cheb nodes
estimates_equi = [];
estimates_cheb = [];
GAMMA = 0.57721566490153286;

for n = 10:10:100
    [equispaced_nodes, gauss_cheb_nodes] = compute_nodes(n);  %get arrays of nodes
    leb_equi = [leb_equi  costante_lebesgue(equispaced_nodes)];
    estimates_equi = [estimates_equi  2^(n+1) / exp(1)*n*log(n)];
    leb_cheb = [leb_cheb  costante_lebesgue(gauss_cheb_nodes)];
    estimates_cheb = [estimates_cheb  (2/pi)*(log(n+1) + GAMMA + log(8/pi))];
end

fprintf("ESTIMATE'S ERROR (EQUISPACED NODES)\n");
abs(leb_equi - estimates_equi)

fprintf("ESTIMATE'S ERROR (GAUSS-CHEBYSHEV NODES)");
abs(leb_cheb - estimates_cheb)
