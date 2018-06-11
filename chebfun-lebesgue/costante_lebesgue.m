function [leb_constant] = constante_lebesgue(pts)

rows_chebvand = length(pts);
V_pts = gallery('chebvand', rows_chebvand, pts);
M = max(5000, 10*rows_chebvand);
pts_leb = linspace(-1, 1, M);
V_leb = gallery('chebvand', rows_chebvand, pts_leb);
leb_constant = norm(V_pts\V_leb, 1);