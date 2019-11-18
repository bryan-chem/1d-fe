%  oneDFE takes a finite element space, stiffnesses and densities, and
%  boundary conditions to solve the 1D elastodynamics equations

function u = oneDFE(X, E, rho, omega, bcs)

%  Initialize
ndofs = length(X);
f = zeros(ndofs,1);

%  Assemble global stiffness matrix
K = globalAssembleStiffness(X, E, rho, omega, ndofs);

%  Applying the boundary condition
[K,f] = applyBcs(K,f,bcs);
    
%  Solve system
u = feSolve(K,f);

plot(X,[bcs(1);u;bcs(2)]);
end