
function lebesgue_const

fprintf('\n \t LEBESGUE CONSTANTS, CHEBYSHEV NODES');
max_deg=50;
em=0.57721566490153286060651209008240243104215933593992; %EULER-MASCH.
for deg=1:max_deg
    x=chebpts(deg);
    [L,Lconst]=lebesgue(x);
    lebesgue_constants(deg)=Lconst;
    est(deg)=(2/pi)*(log(deg+1)+em+log(8/pi));
    fprintf('\n \t DEG: %3.0f LEBESGUE CONST.: %1.4e EST.:% 1.4e',...
        deg,Lconst,est(deg));
end

plot(1:max_deg,lebesgue_constants,'ro-');

fprintf('\n \n');

