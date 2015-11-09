function dif_pot=lagragian(pos,Target)

x=pos-Target.ModelData.re(1);
y=-Target.ModelData.re(2);
z=-Target.ModelData.re(3);

%Gravitational coeficients
c20=Target.ModelData.Secondary.g.c20 ;
c22=Target.ModelData.Secondary.g.c22 ;
c40=Target.ModelData.Secondary.g.c40 ;
c42=Target.ModelData.Secondary.g.c42 ;
c44=Target.ModelData.Secondary.g.c44 ;

%Gravitational parameter of the body

%Spherical coordinates

r=sqrt(x^2+y^2+z^2);
delta=asin(z/r);
lambda=atan2(y,x);
r0=124;
%Associated legendre functions

P20 = 0.5*(3*sin(delta)^2-1);
P21 = 3*sin(delta)*sqrt((1-sin(delta)^2));
P22 = 3*(1-sin(delta)^2);
P40 = 1/8*(35*sin(delta)^4-30*sin(delta)^2+3);
P41 = 5/2*(7*sin(delta)^3-3*sin(delta))*sqrt(1-sin(delta)^2);
P42 = 15/2*(7*sin(delta)^2-1)*(1-sin(delta)^2);
P43 = 105*sin(delta)*(sqrt((1-sin(delta)^2))^3);
P44 = 105*(1-sin(delta)^2)^2;


%Potencial calculation

grav_gradient_r=-(Target.ModelData.Secondary.GravitationalConstant/(r^2))*(1+3*((r0/r)^2)*P20*c20 + c22*3*((r0/r)^2)*P22*cos(2*lambda) + c40*5*((r0/r)^4)*P40 + c42*5*((r0/r)^4)*P42*cos(2*lambda)+c44*5*((r0/r)^4)*P44*cos(4*lambda));

grav_gradient_delta=(Target.ModelData.Secondary.GravitationalConstant/r)* ((r0/r)^2*(P21*c20-2*tan(delta)*P22*c22*cos(2*lambda)) + (r0/r)^4*(P41*c40+(P43-2*tan(delta)*P42)*c42*cos(2*lambda)-4*tan(delta)*P44*c44*cos(4*lambda)));

grav_gradient_lambda=-(Target.ModelData.Secondary.GravitationalConstant/r)*((r0/r)^2*2*P22*c22*sin(2*lambda)+(r0/r)^4*2*P42*c42*sin(2*lambda)+(r0/r)^4*4*P44*c44*sin(4*lambda));

grav_gradient_x=cos(delta)*cos(lambda)*grav_gradient_r-(sin(delta)*cos(lambda))/r*grav_gradient_delta-sin(lambda)/cos(delta)/r*grav_gradient_lambda;

grav_gradient_y=cos(delta)*sin(lambda)*grav_gradient_r-(sin(delta)*sin(lambda))/r*grav_gradient_delta-cos(lambda)/cos(delta)/r*grav_gradient_lambda;

grav_gradient_z=sin(delta)*grav_gradient_r-cos(delta)/r*grav_gradient_delta;

pot_e=[grav_gradient_x;grav_gradient_y;grav_gradient_z];

%% Spherical potencial

r=[pos;0;0]-Target.ModelData.rs;

pot_s=-Target.ModelData.Primary.GravitationalConstant*r/(sqrt(sum(r.^2)))^3;

dif_pot=pot_s+pot_e-cross(Target.ModelData.Secondary.Rotation.w0,cross(Target.ModelData.Secondary.Rotation.w0,[pos;0;0]));

dif_pot=dif_pot(1);