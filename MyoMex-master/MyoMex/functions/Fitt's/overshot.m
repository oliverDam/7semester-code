function [output] = overshot(overshoots,targetset)

L = length(createTargetset(targetset));

output = sum(overshoots)/L;