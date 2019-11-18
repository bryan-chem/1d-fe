%  applyBcs

function [Kd,fd] = applyBcs(K,f,bcs)
    %  For now, only use Diriclet boundary conditions on left and right end
    %  points.
    
    Kd = K(2:end-1,2:end-1); %  Identify coeffcients for unknown dofs
    fd = f(2:end-1) - K(2:end-1,1)*bcs(1) - K(2:end-1,end)*bcs(2);  %  Subtract known dofs + coefficients
end