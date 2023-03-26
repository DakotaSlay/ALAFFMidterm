function [ x, niters ] = Method_of_Steepest_Descent( A, b , x0 )

    x = x0;
    niters = 0;

    residual = b - A*x;
    
    while norm(residual) >= eps * norm(b)
        p = residual;

        q = A * p;

        a = (transpose(p) * residual) / (transpose(p) * q);

        x = x + a * p;

        residual = residual - a * q;

        niters = niters+1;
    end

end