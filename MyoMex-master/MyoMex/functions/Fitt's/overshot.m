function [output] = overshot(overshoots,gotIt)%targetset)

L = sum(gotIt);%length(createTargetset(targetset));

if L == 0
    output = sum(overshoots);
else
    output = sum(overshoots)/L;
end