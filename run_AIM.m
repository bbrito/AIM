%***************************************************************************************%
%                               Copyright ESA, S.A. 2015                                %
%***************************************************************************************%
% Template V 0.0            *     FUNCTION : run_AIM
%****************************     AUTHOR   : #BB
% TEC-ECN                   *     PROJECT  : AIM
%                           *     MATLABV  : (R2015a)
%****************************************************************************************
%
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%    X                                                                         X
%    X                    Run Simulation                       X
%    X                                                                         X
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%
%************************************DESCRIPTION******************************************
%
% DESCRIPTION  :  AIM Mission Simulator
%
% USE          :  start_AIM
%
% SYSTEM       :  Windows 7. No system calls, no paths identifiers and no special chars used.
%
% HISTORY      :  V 0.0: 5/10/2015 -#BB- created
%
%****************************************************************************************

close all;

%% Initialise libraries directories
startup_AIM;

if ~exist('openmodel','var')
    openmodel               = true ;        % Flag to open Simulink model 
end

%% Initialisation
disp('---------------------------------------------');
disp('Initialisation...');

%%Simulator name
simulator_model_name     = 'AIM_v0';

%% Solvers
    solver_type             = 'ode4';

% Loading System
disp('[1] Loading Simulink Models');
% Load models into memory
if openmodel      
    open_system ([simulator_model_name '.slx']);
end

% Attempt to refresh the blocks.  This highlights if any models pointed to
% by 'simulator_model_name' (usually EAGLE_Simulator.mdl) are not on the
% current path.  (which probably implies that the EAGLE_Simulator has been
% saved when working on a different project).
% If an error is thrown, then the backup EAGLE_Simulator is loaded instead,
% as this one only contains links to default blocks which are in
% system_lib.
try
    model_obj = get_param(simulator_model_name,'Object');
    model_obj.refreshModelBlocks
catch
    
        error('Custom simulator used, and some library models are not on the path!  Please check the paths for required models');
end

set_param(simulator_model_name, 'Solver', solver_type);
model_obj = get_param(simulator_model_name,'Object');

%% Initialisation Configuration Files
disp('[1]Initialisation Files');
stop_time=60000;
set_param(simulator_model_name, 'StopTime', 'stop_time');

target_config;
chaser_config;

%%FIND LAGRANGIAN POINTS

% find_lagrangian_points;

sim([simulator_model_name '.slx']);

plot_AIM;