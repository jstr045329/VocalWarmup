function fout = upHalfStepEqTemp(fin, n)
    if nargin == 1
        n = 1;
    end
    
    if n <= 0
        fout = fin;
    elseif n == 1
        fout = fin * semitoneEqTemp();
    else
        fout = upHalfStepEqTemp(fin * semitoneEqTemp(), n - 1);
    end
end

