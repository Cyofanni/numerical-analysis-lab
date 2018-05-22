function [T, hist]=QR_method(T_input, maxit)
    
% QR METHOD FOR A SYMMETRIC TRIDIAGONAL MATRIX "T_input".

T=T_input;
hist=sort(diag(T));

for index=1:maxit
    [Q,R]=qr(T);
    T=R*Q;                     % NEW SIMILAR MATRIX.
    hist = [hist sort(diag(T))]; % IT STORES THE DIAGONAL ELEMENTS 
                               % OF THE "index" ITERATION.
end

