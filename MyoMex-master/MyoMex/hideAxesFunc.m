function hideAxesFunc(handle);

axes(handle);
cla(handle);
set(gca,'Color',[0.94 0.94 0.94]);
ax = gca;
ax.Visible = 'off';