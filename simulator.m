YRef = out.simout.Data(:,1);      % 58x1 double
vx = double(vx(1));   % ensure it's scalar double

XRef = out.simout.Time .* vx;     % 58x1 double if vx is scalar
% waypoints = [XRef YRef zeros(length(YRef),1)];
waypoints = [XRef, YRef, zeros(size(YRef))];
simulationTime = 10;
simulateScenario(simulationTime,waypoints,vx,150);

assignin('base','waypoints',waypoints)


scenario = drivingScenario;

% 3. Add an ego vehicle
ego = vehicle(scenario, 'ClassID', 1);

% 4. Assign trajectory to vehicle
speed = 10; % m/s (constant speed)
trajectory(ego, waypoints, speed);

