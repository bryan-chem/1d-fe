%  globalAssembleStiffness
%  Assemble the global stiffness matrix
%  Calls:  localElement

function K = globalAssembleStiffness(X, E, ndofs)
    %
    K = zeros(ndofs, ndofs);
    
    %  In a for loop
    %  Probs should pass in element number and end points
    for i = 1:ndofs-1
        K_elem = localElement(X(i), X(i+1), E(i));
        K(i:i+1, i:i+1) = K_elem;
    end
    
end