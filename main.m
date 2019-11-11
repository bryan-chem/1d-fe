%  main
%  Script will specify finite element space/mesh, material properties, and
%  BCs and call oneDFE function

%  Generate mesh
X

%  Material properties
E = zeros(size(X)-1);
rho = zeros(size(X)-1);

%  BCs
bc = [1;0];

%  Frequency
omega = 0;

%  Solve for time-harmonic solution
oneDFE(X, E, rho, omega, bcs)