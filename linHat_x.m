%  linHat_x
%  derivative of 'hat' function
%  Given a position x in natural (element based) coordinates i.e. [-1,1],
%  linHat returns the values f of the linear interpolation functions in that
%  element (N_{-1} and N_{1})

function f = linHat_x(x)
    f = zeros(2,1);
    if abs(x)<=1
        f(1) = -1/2; %  N_{-1}
        f(2) = 1/2; %  N_{1}
    end 
end