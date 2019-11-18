%  localElement
%  Calculate element-wise stiffness matrix using linear shape functions
%  Calls: linHat

function K_elem = localElement(a,b,E,rho,omega)

    %  Map to natural coordinates
    sf = (b-a)/2;                   %  Scale factor
    xi = [-1/sqrt(3); 1/sqrt(3)];   %  Quadrature points
    
    %  Evaluate function at quadrature points (weights are equal to 1 for
    %  n=2)
    Nq1 = linHat(xi(1));    %  Shape functions evaluated at quad pt 1
    Nq2 = linHat(xi(2));    %  Shape functions evaluated at quad pt 2
    Nxq1 = linHat_x(xi(1));   %  Shape fcn derivative evaluated at quad pt 1
    Nxq2 = linHat_x(xi(2));   %  Shape fcn derivative evaluated at quad pt 2
    
    %  'Integrate'
    Kaa = E/sf*(Nxq1(1)*Nxq1(1) + Nxq2(1)*Nxq2(1)) ...
            - rho*omega^2*sf*(Nq1(1)*Nq1(1) + Nq2(1)*Nq2(1));
    Kab = E/sf*(Nxq1(1)*Nxq1(2) + Nxq2(1)*Nxq2(2)) ...
            - rho*omega^2*sf*(Nq1(1)*Nq1(2) + Nq2(1)*Nq2(2));
    Kbb = E/sf*(Nxq1(2)*Nxq1(2) + Nxq2(2)*Nxq2(2)) ...
            - rho*omega^2*sf*(Nq1(2)*Nq1(2) + Nq2(2)*Nq2(2));
    
    K_elem = [Kaa, Kab; Kab, Kbb];
end