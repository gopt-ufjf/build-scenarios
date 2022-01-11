# build-scenarios

Please consider citing m-ISODATA with the following bibtex codes: 

@article{POHOM21,
author = {de Paula, Arthur Neves and de Oliveira, Edimar José and Honório, Leonardo de Mello and de Oliveira, Leonardo Willer and Moraes, Camile Arêdes},
title = {m-ISODATA: Unsupervised clustering algorithm to capture representative scenarios in power systems},
journal = {International Transactions on Electrical Energy Systems},
volume = {31},
number = {9},
pages = {e13005},
keywords = {clustering technique, power system expansion planning, power system simulation, probabilistic optimal power flow, renewable energy integration, scenario generation},
doi = {https://doi.org/10.1002/2050-7038.13005},
} 

@misc{GOPT_-_Optimization_Group_DMR-SOLVER_2021,
author = {{GOPT - Optimization Group}},
month = {12},
title = {{DMR-SOLVER}},
url = {https://github.com/gopt-ufjf/DMR-solver},
version = {1.0.0},
year = {2021}
}

----
k-means and HAC were implemented using the *Statistics and Machine Learning Toolbox* functions from MATLAB:
https://www.mathworks.com/help/stats/index.html

----
Data were obtained from Merrick [1] paper. Data files are in p.u. of bus demand or capacity of generation.

[1] James H. Merrick, *On representation of temporal variability in electricity capacity planning models*, Energy Economics, Vol. 59, 2016, pp. 261-274, https://doi.org/10.1016/j.eneco.2016.08.001.
