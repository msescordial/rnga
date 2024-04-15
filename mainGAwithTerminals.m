clc
clear


% Inputs for GA:
maxiter = 10;                    % maximum iterations of GA (no. of generations)
population_size = 40;           % must be divisible by 4


[DistanceMatrix,TimeMatrix,TravelDemandMatrix,TerminalNodes,k,s,transfer_time]=network_manila_2();

n = size(DistanceMatrix,1);

tic
% ----- INITIALIZATION -----
% Generate All Candidate Bus Routes
[BusRouteID, AllPaths, AllCosts, TotalNoOfRoutes] = generateBusRouteswithTerminals(DistanceMatrix,k,TerminalNodes);
fprintf('No. of routes generated is %d\n\n', TotalNoOfRoutes);
toc

tic
% Generate Initial Network S0  
[S0,S0r,mn] = generateInitialNetwork(DistanceMatrix, BusRouteID, TotalNoOfRoutes, s);
fprintf('Initial Route Set S0: \n\n'); displayRouteSet(S0,BusRouteID);
toc

% Evaluate Objective Function Value
SolutionTimeMatrix = TotalTime(S0r,s,TimeMatrix, transfer_time, mn);
disp("Time Matrix of the Solution"); disp(SolutionTimeMatrix);
E0 = ObjFuncVal(S0r,TravelDemandMatrix,DistanceMatrix,SolutionTimeMatrix,n);   
disp("E0"); disp(E0);

tic
% Genetic Algorithm    
[S1] = GeneticAlgo(population_size, S0, S0r, maxiter, n, DistanceMatrix, TravelDemandMatrix, TimeMatrix, BusRouteID, ...
       TotalNoOfRoutes, s, transfer_time, mn);
[S1r] = StringtoRouteSet(S1,s,n); 
toc

% Evaluate Objective Function Value
fprintf('Final Route Set S1: \n\n'); 
for a=1:s
    fprintf('Route %d:', a); 
    br = BusRoute(S1r{a,1});
    displayBusRoute(br);
end
SolutionTimeMatrix = TotalTime(S1r,s,TimeMatrix, transfer_time, mn);
disp("Time Matrix of the Solution"); disp(SolutionTimeMatrix);
E1 = ObjFuncVal(S1r,TravelDemandMatrix,DistanceMatrix,SolutionTimeMatrix,n);   
disp("E1"); disp(E1);
