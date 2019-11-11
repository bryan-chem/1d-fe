%  oneDFE takes a finite element space, stiffnesses and densities, and
%  boundary conditions to solve the 1D elastodynamics equations

function u = oneDFE(X, E, rho, omega, bcs)

%  Initialize
ndofs = size(X);
f = zeros(ndofs);

%  Assemble global stiffness matrix
K = globalAssembleStiffness(X, E, ndofs);

%  Assemble global mass matrix
M = globalAssembleMass(X, rho, omega);

%  Applying the boundary condition
[K,M,f] = applyBcs(K,M,f,bcs);
    
%  Solve system
u = feSolve(K,M,f);

end