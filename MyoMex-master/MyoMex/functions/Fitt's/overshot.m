function [output] = overshot(overshoots,gotIt)%targetset)

L = sum(gotIt);%length(createTargetset(targetset));

output = sum(overshoots)/L;