function fout = downHalfStepEqTemp(fin, n)
    if nargin == 1
        n = 1;
    end
    
    if n <= 0
        fout = fin;
    elseif n == 1
        fout = fin / semitoneEqTemp();
    else
        fout = downHalfStepEqTemp(fin / semitoneEqTemp(), n - 1);
    end
end
