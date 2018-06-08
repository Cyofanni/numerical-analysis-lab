%chebfun.pdf pag. 21
function ex4_lab2

format long e;
d = [-1, 1];

fprintf('\n \t COSTANTI DI LEBESGUE, NODI EQUISPAZIATI');
max_deg = 50;
lebesgue_constants = [];  %stores lebesgue constants
est = [];
%em=0.57721566490153286060651209008240243104215933593992; %EULERO-MASCH.
for deg = 1:max_deg
    l_bound = 2^(deg-2) / deg^2;
    u_bound = 2^(deg+3) / deg;

    x = linspace(-1, 1, deg+1);
    [L, Lconst] = lebesgue(x);
    lebesgue_constants(deg) = Lconst;
    est(deg) = 2^(deg+1) / (exp(1)*deg*log(deg));  %asymptotic estimate for equispaced points

    fprintf('\n \t DEG: %3.0f / LEBESGUE CONST.: %1.4e / ASYMPT. EST.:% 1.4e',...
        deg, Lconst, est(deg));
    if (Lconst >= l_bound) && (Lconst <= u_bound)
	  fprintf(' / BOUNDS ARE OK\n')	
    end
end

