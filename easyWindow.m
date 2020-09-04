function y = easyWindow(nSamples)
    y = ones(nSamples, 1);
    idx_beg = int32(nSamples / 20);
    idx_end = nSamples - idx_beg;
    ramp_up = 0:(1/double(idx_beg)):1;
    y(1:numel(ramp_up)) = ramp_up;
    ramp_down = 1:-(1/double(idx_beg)):0;
    y(nSamples - numel(ramp_down)+1:nSamples) = ramp_down;
end

