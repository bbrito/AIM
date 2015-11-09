%***************************************************************************************%
%                               Copyright ESA, S.A. 2015                                %
%**************************************************]]*************************************%
% Template V 0.0            *     FUNCTION : chaser_config
%****************************     AUTHOR   : #BB
% TEC-ECN                   *     PROJECT  : AIM
% Date: 9/11/2015                          *     MATLABV  : (R2015a)
%****************************************************************************************
%
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%    X                                                                         X
%    X                    Chaser body configuration file                       X
%    X                                                                         X
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%
%************************************DESCRIPTION******************************************
%
% DESCRIPTION  :  Chaser body configuration file 
%
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

%% Barycenter Initial conditions in Rotating Frame

 Chaser.ModelData.x0_BC=[-1.433399298673518e+03;0;0]; %L3 Point
%Chaser.ModelData.x0_SC_BC=[-9.240780985807878e+02;0;0]; %L2 Point
Chaser.ModelData.v0_BC=[0.0;0;0];

%% Spacecraft parameters

Chaser.ModelData.Parameters.solar_const=1358;
Chaser.ModelData.Parameters.astr_unit=1.495978700000000e+11;
Chaser.ModelData.Parameters.area=5;
Chaser.ModelData.Parameters.rad_press_coef=1.85;
Chaser.ModelData.Parameters.light_speed=299792458;
Chaser.ModelData.Parameters.mass=4.455;
Chaser.ModelData.Parameters.dim=[5;5;5];

