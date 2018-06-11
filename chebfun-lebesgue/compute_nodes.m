function [equispaced_nodes, gauss_cheb_nodes] = compute_nodes(n)

equispaced_nodes = [];
gauss_cheb_nodes = [];

for k = 0:n
   equispaced_nodes = [equispaced_nodes  (-1+(2*k/n))];
end

for k = 1:n+1
    gauss_cheb_nodes = [gauss_cheb_nodes  cos(((2*k-1)*pi)/(2*(n+1)))];
end
