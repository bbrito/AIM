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

%% Plot Bodys
n=100; %number of points
[x,y,z] = ellipsoid(Target.ModelData.re(1),Target.ModelData.re(2),Target.ModelData.re(3),Target.ModelData.Secondary.dim(1),Target.ModelData.Secondary.dim(2),Target.ModelData.Secondary.dim(3),n) 
surf(x,y,z);

[x,y,z] = sphere(n);
x = Target.ModelData.Primary.dim*x;
y = Target.ModelData.Primary.dim*y;
z = Target.ModelData.Primary.dim*z;
surf(x+Target.ModelData.rs(1),y+Target.ModelData.rs(2),z+Target.ModelData.rs(3));

%% Plot lagrangian points
find_lagrangian_points;

plot(x3,0,'+');
plot(x2,0,'+');
plot(x1,0,'+');
%% Compare SC Trajectories in both frames
