function [ x, niters ] = CG( A, b, x0 )
    x = x0;

    r = b - A*x;

    niters = 0;

    while norm(r) >= eps* norm(b)
        if niters == 0
            p = r;
        else
            g = (transpose(r) * r) / (transpose(oldR) * oldR);
            p = r + g * p;
        end
        q = A * p;
        a = (transpose(r) * r)/(transpose(p) * q);
        x = x + a * p;
        oldR = r;
        r = r - a * q;
        niters = niters + 1;
    end
end