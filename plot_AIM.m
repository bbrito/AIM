%% Primary and Secondary Body X-Y Trajectory
figure;
x=pos_CB_BC.Data(:,1);
y=pos_CB_BC.Data(:,2);
plot(x,y);
hold on;

x=pos_SB_BC.Data(:,1);
y=pos_SB_BC.Data(:,2);
plot(x,y);
hold on;

%% Compare SC Trajectories in both frames
figure;

figure;
