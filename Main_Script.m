%Get input paramerters
run("Input_Variables.mlx");
%Plant Characterization
sim("Plant_Characterization.slx",'ReturnWorkspaceOutputs', 'on');
out = ans;

%% Reference trajectory
Ts = 0.05;                 % sample time
Tf = 10;                   % sim time
t  = (0:Ts:Tf)';           % time vector

y_ref   = zeros(size(t));  % lateral position ref (m)
y_ref(t >= 1) = 3.5;       % step lane change, e.g., 3.5 m
psi_ref = zeros(size(t));  % yaw angle ref (rad)

reference = timeseries([y_ref psi_ref], t);  % 2 columns: [y psi]
% In the From Workspace block, set Data to: reference
%%
load('Params.mat')
