function [ x, niters ] = PCG( A, b, x0 )

    L = ichol(sparse(A), struct('type','ict','droptol',1e-3,'michol','off'));
    M = L * transpose(L);
    x = x0;
    niters = 0;

    residual = b - A*x;
    
    while norm(residual) >= eps * norm(b)
        z = M \ residual;

        if niters == 0
            p = z;
        else
            g = (transpose(residual) * z) / (transpose(oldResidual) * oldZ);
            p = z + g * p;
        end
        q = A * p;
            
        a = (transpose(residual) * z) / (transpose(p) * q);

        x = x + a * p;

        oldZ = z;
        oldResidual = residual;
        residual = residual - a * q;

        niters = niters+1;
    end
end