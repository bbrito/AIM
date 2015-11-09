%***************************************************************************************%
%                               Copyright ESA, S.A. 2015                                %
%***************************************************************************************%
% Template V 0.1            *     FUNCTION : target_config
%****************************     AUTHOR   : #BB
% TEC-ECN                   *     PROJECT  : AIM
% Date: 9/11/2015                           *     MATLABV  : (R2015a)
%****************************************************************************************
%
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%    X                                                                         X
%    X                    Target body configuration file                       X
%    X                                                                         X
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%
%************************************DESCRIPTION******************************************
%
% DESCRIPTION  :  Target body configuration file 
%                 Updated according with AIM Didymos Reference Modeln-
%                 Version 10, October 22,2015
%
%************************************VARIABLES*******************************************
%
% INPUTS       :  N/A
%
% OUTPUTS      :  
%
% GLOBAL       :  N/A
%
% PERSISTENT   :  N/A
%
%*************************************FUNCTIONS******************************************
%
% EXTERNAL FUN :  N/A
%
% INTERNAL FUN :  N/A
%
%***************************************FILES********************************************
%
% INPUT FILES  :  N/A 
%
% OUTPUT FILES :  N/A
%
%****************************************************************************************

%%Intitialize Ellipsoid Gravity Model

%Asteroid ellipsoid dimensions parameters

%Normalized Distance for bynary System


%% Primary Asteroid Parameters
Target.ModelData.Primary.density=2146; %kgm-3
Target.ModelData.Primary.dim=775/2; %Spherical model
Target.ModelData.Primary.mass=4/3*pi*Target.ModelData.Primary.dim^3*Target.ModelData.Primary.density;

%% LOAD main body ephemeris
%Start= 2020-10-8
%Finish=2020-10-11
traj=dlmread('aim.txt',',',33,2)*1000; %to m/s
for i=1:1:length(traj)
    if(traj(i,1)==0)
        break;
    end
end
Target.ModelData.Primary.Trajectory=timeseries(traj(1:i-1,1:6),0:60:60*length(traj(1:i-2,1:6)));

Target.ModelData.Primary.Rotation.w0=[0;0;2*pi/(2.2593*60*60)]; %rad/s

Target.ModelData.Primary.I=eye(3)*2/5*Target.ModelData.Primary.mass*Target.ModelData.Primary.dim^2;

Target.ModelData.Primary.GravitationalConstant=6.672633792942276e-11*Target.ModelData.Primary.mass;



%% Secondary Asteroid Parameters
Target.ModelData.Secondary.density=Target.ModelData.Primary.density;

Target.ModelData.Secondary.dim=[163 163/1.3 163/1.3/1.2];

Target.ModelData.Secondary.mass=4/3*pi*Target.ModelData.Secondary.dim(1)*Target.ModelData.Secondary.dim(2)*Target.ModelData.Secondary.dim(3)*Target.ModelData.Secondary.density;

alfa=Target.ModelData.Secondary.dim(1);
beta=Target.ModelData.Secondary.dim(2);
gama=Target.ModelData.Secondary.dim(3);

Target.ModelData.Secondary.r0=max(Target.ModelData.Secondary.dim); %Normalized distance (Could be the average)

%% Two Body Problem Initial Conditions

Target.ModelData.MassRatio = Target.ModelData.Primary.mass/(Target.ModelData.Primary.mass+Target.ModelData.Secondary.mass);

%%Vector pointing from the center of sphere to elipsoid
Target.ModelData.rt=[1180;0;0];
Target.ModelData.rs=Target.ModelData.rt*(1-Target.ModelData.MassRatio);
Target.ModelData.re=-Target.ModelData.rt*Target.ModelData.MassRatio;


%% Gravitational coeficients
Target.ModelData.Secondary.g.c20 = 1/(5*Target.ModelData.Secondary.r0^2)*(gama^2-(alfa^2+beta^2)/2);
Target.ModelData.Secondary.g.c22 = 1/(20*Target.ModelData.Secondary.r0^2)*(alfa^2-beta^2);
Target.ModelData.Secondary.g.c40 = 15/7*(Target.ModelData.Secondary.g.c20^2+2*Target.ModelData.Secondary.g.c22^2);
Target.ModelData.Secondary.g.c42 = 5/7*Target.ModelData.Secondary.g.c20*Target.ModelData.Secondary.g.c22;
Target.ModelData.Secondary.g.c44 = 5/28*Target.ModelData.Secondary.g.c22^2;

Target.ModelData.Secondary.I=0.2*Target.ModelData.Secondary.mass*[beta^2+gama^2 0 0;0 alfa^2+gama^2 0;0 0 alfa^2+beta^2];

Target.ModelData.Secondary.r0=max(Target.ModelData.Secondary.dim); %Normalized distance (Could be the average)

Target.ModelData.Secondary.GravitationalConstant=6.672633792942276e-11*Target.ModelData.Secondary.mass;


Target.ModelData.Secondary.Rotation.w0=[0;0;sqrt((Target.ModelData.Secondary.GravitationalConstant+Target.ModelData.Primary.GravitationalConstant)/norm(Target.ModelData.rt)^3)];

% % JPL ephemerides Mars (Mars Equator and node at epoch)
% Didymos


%% Barycenter Body Frame
Target.ModelData.Secondary.x0=Target.ModelData.re;
Target.ModelData.Secondary.v0=cross(Target.ModelData.Secondary.Rotation.w0,Target.ModelData.Secondary.x0);

Target.ModelData.Primary.x0=Target.ModelData.rs;
Target.ModelData.Primary.v0=cross(Target.ModelData.Secondary.Rotation.w0,Target.ModelData.Primary.x0);

%Initial Positions for two-body problem
Target.ModelData.x0=Target.ModelData.rt;
Target.ModelData.v0=cross(Target.ModelData.Secondary.Rotation.w0,Target.ModelData.x0);%% Rotational velocity of the secondary around primary

Constant.Gravity = 6.672633792942276E-11;

Constant.SunGravity=1.327124399355000e+20;
Constant.SRP=1e8;

Sim.Ts=1;



