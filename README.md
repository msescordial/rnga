# route-network-genetic-algo

The Matlab script files above generate the "optimal" _s_ routes of a road network using Genetic Algorithm and/or Simulated Annealing, where _s_ is predefined no. of routes. The main file is mainGAwithTerminals.m which contains the inputs of the road network. To generate candidate routes for initializing the route network, k-Shortest Path and Dijkstra's algorithms are used, in which the source code came from https://www.mathworks.com/matlabcentral/fileexchange/32513-k-shortest-path-yen-s-algorithm and the file is kSP.m.

Below are the descriptions for each file:
1. BusRoute.m - finalizes the substring representation of a route
2. GeneticAlgo.m - main code for genetic algorithm
3. GeneticAlgoforSAGA. m - main code for genetic algorithm under simulated annealing 
4. InitialPopulationforGA.m - generates the initial population for genetic algorithm
5. ObjFuncVal.m - code for the objective function value
6. StringtoRouteSet.m - converts the string representation to a set of routes
7. TotalTime.m - outputs the total time matrix of the solution
8. case1feasible.m - converts the infeasible route to a feasible one using Case 1 of the method from the work of (Buba and Lee, 2016)
9. case2feasible.m - converts the infeasible route to a feasible one using Case 2 of the method from the work of (Buba and Lee, 2016)
10. checkAllNodes.m - checks if all nodes are in the solution; outputs 1 if true and 0 if otherwise
11. common_nodes.m - outputs the common nodes of two routes
12. displayBusRoute.m - displays a route
13. displayPopulationSolution.m - displays the string representation of the population of solutions for genetic algorithm
14. displayRouteSet.m - displays a set of routes
15. displaySolution.m - displays the string representation of a solution
16. generateBusRoutes.m - generates the candidate routes
17. generateBusRoutesWithTerminals.m - generates the candidate routes where the terminals are specified
18. generateInitialNetwork.m - generates an initial solution
19. intra_crossover_main.m - main code for intra-crossover
20. intra_crossover_operation.m - subcode for intra-crossover operation
21. kSP.m - generates the shortest paths using k-Shortest Path and Dijkstra's algorithms
22. mainGA.m - main code for genetic algorithm where the terminals are not specified
23. mainGAWithTerminals.m - main code for genetic algorithm where the terminals are specified
24. mainSAGA.m - main code for genetic algorithm and simulated annealing where the terminals are not specified
25. mutation_op.m - main code for mutation operation
26. network_india.m - contains the details of the network of a city in India, from the work of Suman and Bolia (2019)
27. network_mandl.m - contains the details of Mandl's network
28. node_position.m - outputs the position of a node in a route
29. repair_infeasibility.m - main code for repairing an infeasible solution
30. testing.m - file used for testing some codes
31. tijCase1.m - computes the travel time between two nodes in a network where no transfer is needed
32. tijCase2.m - computes the travel time between two nodes in a network where one transfer is needed
33. tijCase3.m - computes the travel time between two nodes in a network where two transfers are needed
