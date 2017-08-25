function [hg,hcb]=tersurf(m,n,p,d,mlbl,nlbl,plbl)
%FUNCTION [HG,HCB]=TERSURF(m,n,p,d,mlbl,nlbl,plbl) plots the values in the vector d 
% as a pseudo color plot in a ternary diagram in altitude method.
% The three vectors m,n,p define the position of a data value within the
% ternary diagram in altitude method.
% The ternary system is created within the function.
% Axis label can be added using the xlbl values.
% The function returns two handels: hg can be used to modify the main plot,
% and hcb is the handle for the colorbar.
%
% Mehran Spitmaan, Dartmouth College
% (c) 2017
%


if nargin < 4
    error('Error: Not enough input arguments.');
    return
end
if (length(m)+length(n)+length(p))/length(m) ~=3
    error('Error: all arrays must be of equal length.');
    return
end

if nargin < 7
    mlbl = 'm';
    nlbl = 'n';
    plbl = 'p';
end

% Check if the data need to be normalized
if max(m+n+p)>1
    for i=1:length(m)
        m(i)=m(i)/(m(i)+n(i)+p(i));
        n(i)=n(i)/(m(i)+n(i)+p(i));
        p(i)=p(i)/(m(i)+n(i)+p(i));
    end
end

hg = figure;
hold on

% Calculate the position of the data points in the ternary diagram
y = m;

l1 = m/sin(pi/3);
l2 = n/tan(pi/3);
k = sqrt(n.^2 + (l1 + l2).^2);
x = sqrt(k.^2 - m.^2);

endPoint = sqrt(1 + (1/tan(pi/3)).^2);

gap = .02;

text(0-2*gap, 0-gap,zlbl,'fontsize',30)
text((endPoint/2)-gap, 1+2*gap,xlbl,'fontsize',30)
text(endPoint+gap,0-gap,ylbl,'fontsize',30)

axis([0 endPoint 0 1])
axis off

set(gca,'Visible','off')

% Create short vectors for the griding
tri=delaunay(x,y);
trisurf(tri,x,y,d);
shading interp
hcb = colorbar;