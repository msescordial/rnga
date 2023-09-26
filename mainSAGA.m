clc
clear
tic

%------------------------------ Remarks: ----------------------------------
% Input: 
%  k = for k-shortest paths algorithm: this refers to the first k
%    shortest paths
%  s = no. of bus routes for the network
%  D = Travel Demand Matrix
%  T = Stop-to-Stop Time Matrix
%  d = Stop-to-Stop Distance Matrix 

% case 2
    %DistanceMatrix = [inf 5 10 15 20 inf; 5 inf 10 inf inf 5;10 10 inf 15 inf 10; 15 inf 15 inf 20 15;20 inf inf 20 inf 20; inf 5 10 15 20 inf];
        
     
% case: Mandl's network  

% d
DistanceMatrix = [0 8 inf inf inf inf inf inf inf inf inf inf inf inf inf;
                    8 0 2 3 6 inf inf inf inf inf inf inf inf inf inf;
                    inf 2 0 inf inf 3 inf inf inf inf inf inf inf inf inf;
                    inf 3 inf 0 4 4 inf inf inf inf inf 10 inf inf inf;
                    inf 6 inf 4 0 inf inf inf inf inf inf inf inf inf inf;
                    inf inf 3 4 inf 0 inf 9 inf inf inf inf inf inf 3;
                    inf inf inf inf inf inf 0 inf inf 7 inf inf inf inf 2;
                    inf inf inf inf inf 9 inf 0 inf 8 inf inf inf inf 2;
                    inf inf inf inf inf inf inf inf 0 inf inf inf inf inf 8;
                    inf inf inf inf inf inf 7 8 inf 0 5 inf 10 8 inf;
                    inf inf inf inf inf inf inf inf inf 5 0 10 5 inf inf;
                    inf inf inf 10 inf inf inf inf inf inf 10 0 inf inf inf;
                    inf inf inf inf inf inf inf inf inf 10 5 inf 0 2 inf;
                    inf inf inf inf inf inf inf inf inf 8 inf inf 2 0 inf;
                    inf inf inf inf inf 3 2 2 8 inf inf inf inf inf 0];

% D
TravelDemandMatrix = [0 400 200 60 80 150 75 75 30 160 30 25 35 0 0;
                      400 0 50 120 20 180 90 90 15 130 20 10 10 5 0;
                      200 50 0 40 60 180 90 90 15 45 20 10 10 5 0;
                      60 120 40 0 50 100 50 50 15 240 40 25 10 5 0;
                      80 20 60 50 0 50 25 25 10 120 20 15 5 0 0;
                      150 180 180 100 50 0 100 100 30 880 60 15 15 10 0;
                      75 90 90 50 25 100 0 50 15 440 35 10 10 5 0;
                      75 90 90 50 25 100 50 0 15 440 35 10 10 5 0;
                      30 15 15 15 10 30 15 15 0 140 20 5 0 0 0;
                      160 130 45 240 120 880 440 440 140 0 600 250 500 200 0;
                      30 20 20 40 20 60 35 35 20 600 0 75 95 15 0;
                      25 10 10 25 15 15 10 10 5 250 75 0 70 0 0;
                      35 10 10 10 5 15 10 10 0 500 95 70 0 45 0;
                      0 5 5 5 0 10 5 5 0 200 15 0 45 0 0;
                      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

% T
TimeMatrix = DistanceMatrix;

k = 4;                      % k shortest Paths for each node to node
s = 3;                      % no. of routes in a bus network
waiting_time = 0.5;
transfer_time = 5;
population_size = 200;       % for GA; must be divisible by 4


maxiter_SA = 5;              % maximum iterations per loop of SA
maxgen_GA = 20;              % maximum no. of generations of GA
max_T = 10;                   % temperature (T = 50)

n = size(DistanceMatrix,1);

% ----- INITIALIZATION -----
% Generate All Candidate Bus Routes    
[BusRouteID, AllPaths, AllCosts, TotalNoOfRoutes] = generateBusRoutes(DistanceMatrix,k);
fprintf('No. of routes generated is %d\n\n', TotalNoOfRoutes);

% Generate Initial Solution S0 
[S0,S0r] = generateInitialNetwork(DistanceMatrix, BusRouteID, TotalNoOfRoutes, s);
%disp(S0); disp(S0r);
fprintf('Initial Solution S0: \n\n'); displayRouteSet(S0,BusRouteID);

% ----- MAIN FLOWCHART -----
T = max_T; 
iter = 1;                   % iteration for SA

% Initialize Population for GA
init_pop_matrix = InitialPopulationforGA(population_size, S0r, s, n, BusRouteID, TotalNoOfRoutes, ...
    DistanceMatrix, TimeMatrix, TravelDemandMatrix, waiting_time, transfer_time);

while (T > 0)
    while (iter <= maxiter_SA)

        disp("iter"); disp(iter); disp("Temperature:"); disp(T);

        if (iter == 1 && T == max_T)
            SolutionTimeMatrix = TotalTime(S0r,s,TimeMatrix, waiting_time, transfer_time);
            E0 = ObjFuncVal(S0r,TravelDemandMatrix,DistanceMatrix,SolutionTimeMatrix,n);
            disp("E0"); disp(E0);

            % Determine New Solution S1 using GA           
            [S1] = GeneticAlgoforSAGA(init_pop_matrix, S0r, maxgen_GA, n, DistanceMatrix, TravelDemandMatrix, TimeMatrix, BusRouteID, ...
                TotalNoOfRoutes, s, waiting_time, transfer_time, population_size);  % obtain new solution with GA
        else
            S0r = StringtoRouteSet(S0,s,n); %disp("S0r"); disp(S0r);
            SolutionTimeMatrix = TotalTime(S0r,s,TimeMatrix, waiting_time, transfer_time);
            E0 = ObjFuncVal(S0r,TravelDemandMatrix,DistanceMatrix,SolutionTimeMatrix,n);
            disp("E0"); disp(E0);

            % Determine New Solution S1 using GA           
            [S1] = GeneticAlgoforSAGA(init_pop_matrix, S0r, maxgen_GA, n, DistanceMatrix, TravelDemandMatrix, TimeMatrix, BusRouteID, ...
                TotalNoOfRoutes, s, waiting_time, transfer_time, population_size);  % obtain new solution with GA
        end
        
        % Evaluate Objective Function Value, E1
        [S1r] = StringtoRouteSet(S1,s,n);
        fprintf('New Solution Set by GA: \n\n'); 
        for a=1:s
            fprintf('Route %d:', a); 
            br = BusRoute(S1r{a,1});
            displayBusRoute(br);
        end
        SolutionTimeMatrix = TotalTime(S1r,s,TimeMatrix, waiting_time, transfer_time);
        %disp("Time Matrix of the Solution"); disp(SolutionTimeMatrix);
        E1 = ObjFuncVal(S1r,TravelDemandMatrix,DistanceMatrix,SolutionTimeMatrix,n);   
        disp("E1"); disp(E1);

        iter = iter+1;

        if (T == 1 && iter == maxiter_SA+1)
            break;
        else
            % Simulated Annealing Part
            if (E1 < E0)
                S0 = S1;
            end
            if (E1 > E0)
                % P = exp(-(E1-E0)/T);
                P = exp(-(E1-E0)/(T));
                if (P > rand)
                    disp("P"); disp(P);
                    disp("Accept worse solution since P > rand");
                    S0 = S1;
                end
            end
        end
    end
        
    if (iter > maxiter_SA)
        % Change the Population in the GA process
        init_pop_matrix = InitialPopulationforGA(population_size, S0r, s, n, BusRouteID, TotalNoOfRoutes, ...
                DistanceMatrix, TimeMatrix, TravelDemandMatrix, waiting_time, transfer_time);
        T = T - 1;
        iter = 1;
    end
    
end

% T = 0, so output the final solution
if (E1 < E0)
    S_final = S1;
else
    S_final = S0;
end
[Sfr] = StringtoRouteSet(S_final,s,n);
fprintf('Final Route Set: \n\n'); 
for a=1:s
    fprintf('Route %d:', a); 
    br = BusRoute(Sfr{a,1});
    displayBusRoute(br);
end
SolutionTimeMatrix = TotalTime(Sfr,s,TimeMatrix, waiting_time, transfer_time);
%disp("Time Matrix of the Solution"); disp(SolutionTimeMatrix);
E_final = ObjFuncVal(Sfr,TravelDemandMatrix,DistanceMatrix,SolutionTimeMatrix,n);   
disp("Objective Function Value"); disp(E_final);


toc;
















