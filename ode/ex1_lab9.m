%function of two variables
f= @(x,y) 0*x + (cos(y)).^2;
y0 = 0;    %initial value
t0 = 0;    
t_end = 10;

h = 0.2;    %step
[t1, y1] = eulero_esplicito(t0, y0, t_end, h, f); 

exact_sol_1 = [];    %contains samples of the exact solution (tan-1(x))
for x = 0:0.2:10
    exact_sol_1 = [exact_sol_1, atan(x)]; %fill the array with sample values
end

%###############################

h = 0.1;    %step
[t2, y2] = eulero_esplicito(t0, y0, t_end, h, f);

exact_sol_2 = [];
for x = 0:0.1:10
    exact_sol_2 = [exact_sol_2, atan(x)];
end

%##############################

h = 0.05;   %step
[t3, y3] = eulero_esplicito(t0, y0, t_end, h, f); 

exact_sol_3 = [];
for x= 0:0.05:10
    exact_sol_3 = [exact_sol_3, atan(x)];
end

%##############################

%absolute and relative error with h = 0.2
fprintf("ABSOLUTE ERROR [STEP = 0.2]: ");
abs_err_1 = abs(exact_sol_1' - y1)'
fprintf("RELATIVE ERROR [STEP = 0.2]: ");
rel_err_1 = abs_err_1 ./ abs(exact_sol_1')'

%absolute and relative error with h = 0.1
fprintf("ABSOLUTE ERROR [STEP = 0.1]");
abs_err_2 = abs(exact_sol_2' - y2)'
fprintf("RELATIVE ERROR [STEP = 0.1]:");
rel_err_2 = abs_err_2 ./ abs(exact_sol_2')'

%absolute and relative error with h = 0.05
fprintf("ABSOLUTE ERROR [STEP = 0.05]");
abs_err_3 = abs(exact_sol_3' - y3)'
fprintf("RELATIVE ERROR [STEP = 0.05]:");
rel_err_3 = abs_err_3 ./ abs(exact_sol_3')'

%##############################
%for some x's, measure the ratio between the errors

%x = 10, ratio between error with h = 0.2 and error with h = 0.1
ratio1 = abs_err_1(end) / abs_err_2(end);
fprintf("RATIO BETWEEN ERRORS AT x = 10 [h = 0.2 -> h = 0.1]: %f\n", ratio1);

%x = 10, ratio between error with h = 0.1 and error with h = 0.05
ratio2 = abs_err_2(end) / abs_err_3(end);
fprintf("RATIO BETWEEN ERRORS AT x = 10 [h = 0.1 -> h = 0.05]: %f\n", ratio2);
