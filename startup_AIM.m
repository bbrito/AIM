%***************************************************************************************%
%                               Copyright ESA, S.A. 2015                                %
%***************************************************************************************%
% Template V 0.0            *     FUNCTION : target_config
%****************************     AUTHOR   : #BB
% TEC-ECN                   *     PROJECT  : AIM
%                           *     MATLABV  : (R2015a)
%****************************************************************************************
%
%    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%    X                                                                         X
%    X                    Simulation Initialisation File                       X
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

clc

disp('============================================================================');
disp('============================================================================');
disp('==                                                                        ==');
disp('==                     Asteroid Impact Mission                          ==');
disp('==                                                                        ==');
disp('============================================================================');
disp('============================================================================');
                                    
disp('==  Resetting Paths                                                       ==');
restoredefaultpath;


disp('==  Setting Environment Variables                                         ==');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EDIT HERE - Set AIM environment variables appropriate to your system.
%              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
setenv('AIM_install', [pwd]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EDIT HERE - Set EMCD and PANGU environemtn variables; if these tools are
%             available.  If not, then please comment out these lines.
%              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% No further editing should be necessary from this point down...
disp(['==     AIM_install  : ' getenv('AIM_install') repmat(' ',1,50-length(getenv('AIM_install'))) '==']);

if ~isempty(getenv('PANGU_install'))
disp(['==     PANGU_install  : ' getenv('PANGU_install') repmat(' ',1,50-length(getenv('PANGU_install'))) '==']);
end

disp('==  Adding Paths                                                          ==');
addpath(genpath([getenv('AIM_install') '/library']));


% if exist([getenv('AIM_install') '/tools'],'dir');
% addpath([getenv('AIM_install') '/tools']);
% if exist([getenv('AIM_install') '/tools/addToolPaths.m'],'file');
% addToolPaths;
% end
% end

% Go back to starting point
cd(getenv('AIM_install'));

disp('==  Instalation Done                                                      ==');
disp('============================================================================');