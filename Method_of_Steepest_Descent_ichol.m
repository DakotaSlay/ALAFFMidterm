function [ x, niters ] = Method_of_Steepest_Descent_ichol( A, b, x0 )

    L = ichol(sparse(A), struct('type','ict','droptol',1e-3,'michol','off'));
    M = L * transpose(L);

    x = x0;
    niters = 0;

    residual = b - A*x;

    while norm(residual) >= eps * norm(b)
        p = M \ residual;

        q = A * p;

        a = (transpose(p) * residual) / (transpose(p) * q);

        x = x + a * p;

        residual = residual - a * q;

        niters = niters+1;
    end
end