%  main
%  Script will specify finite element space/mesh, material properties, and
%  BCs and call oneDFE function

%  Generate mesh
X = [0:0.005:10];

%  Material properties
E = ones(length(X)-1,1);
E(X>4&X<6) = 1;
rho = ones(length(X)-1,1);
rho(X>4&X<6) = 1;

%  BCs
bcs = [1;0];

%  Frequency
f = 1;
omega = 2*pi*f;

%  Solve for time-harmonic solution
u = oneDFE(X, E, rho, omega, bcs);