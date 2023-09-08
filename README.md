# route-network-genetic-algo

The Matlab script files above generate the "optimal" _s_ routes of a road network using Genetic Algorithm, where _s_ is predefined no. of routes. The main file is mainGA.m which contains the inputs of the road network. The test case is the Mandl's Network, and no terminals are predetermined. To generate candidate routes for initializing the route network, k-Shortest Path and Dijkstra's algorithms are used, in which the source code came from https://www.mathworks.com/matlabcentral/fileexchange/32513-k-shortest-path-yen-s-algorithm and the file is kSP.m.
