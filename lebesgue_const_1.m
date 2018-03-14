
function lebesgue_const_1

d = [-1, 1];

fprintf('\n \t LEBESGUE CONSTANTS, EQUISPACED NODES');
max_deg=50;
%em=0.57721566490153286060651209008240243104215933593992; %EULER-MASCH.
for deg=1:max_deg
    l_bound = 2^(deg-2) / deg^2;
    u_bound = 2^(deg+3) / deg;

    x = linspace(-1, 1, deg+1);
    [L,Lconst]=lebesgue(x);
    lebesgue_constants(deg)=Lconst;
    est(deg) = 2^(deg+1) / exp(1)*deg*log(deg);  %estimate for equispaced points

    fprintf('\n \t DEG: %3.0f LEBESGUE CONST.: %1.4e EST.:% 1.4e',...
        deg,Lconst,est(deg));
    if (Lconst >= l_bound) | (Lconst <= u_bound)
	   fprintf(' BOUNDS ARE OK');
    else 
       fprintf(' BOUNDS ARE NOT OK');
    end
end
fprintf('\n')

plot(1:max_deg,lebesgue_constants,'ro-');

