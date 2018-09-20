// This is a .c file for the model: starship

#include "starship.h"

const int starshipVertices = 66;

const float starshipPositions[198] = 
{
-0.215379, -0.018131, 0.254635, 
-0.130827, -0.03062, -0.229209, 
-0.605928, 0.226597, 0.656825, 
-0.130827, -0.03062, -0.229209, 
-0.457512, -0.151435, 0.173292, 
-0.605928, 0.226597, 0.656825, 
-0.130827, -0.03062, -0.229209, 
-0.215379, -0.018131, 0.254635, 
-0.457512, -0.151435, 0.173292, 
-0.457512, -0.151435, 0.173292, 
-0.215379, -0.018131, 0.254635, 
-0.605928, 0.226597, 0.656825, 
-0.457512, -0.151435, 0.173292, 
-0.215379, -0.018131, 0.254635, 
-0.301224, -0.276743, 0.205711, 
0.219197, -0.018172, 0.253044, 
0.605928, 0.226597, 0.656825, 
0.134193, -0.030673, -0.229209, 
0.134193, -0.030673, -0.229209, 
0.605928, 0.226597, 0.656825, 
0.457512, -0.151435, 0.173292, 
0.457512, -0.151435, 0.173292, 
0.219197, -0.018172, 0.253044, 
0.134193, -0.030673, -0.229209, 
0.457512, -0.151435, 0.173292, 
0.605928, 0.226597, 0.656825, 
0.219197, -0.018172, 0.253044, 
0.301224, -0.276743, 0.205711, 
0.219197, -0.018172, 0.253044, 
0.457512, -0.151435, 0.173292, 
-0.301224, -0.276743, 0.205711, 
-0.762492, -0.313925, 0.985007, 
-0.457512, -0.151435, 0.173292, 
-0.301224, -0.276743, 0.205711, 
-0.215379, -0.018131, 0.254635, 
-0.762492, -0.313925, 0.985007, 
-0.762492, -0.313925, 0.985007, 
-0.215379, -0.018131, 0.254635, 
-0.457512, -0.151435, 0.173292, 
0.001113, 0.122996, 0.372016, 
0.219197, -0.018172, 0.253044, 
0.012398, 0.313925, 0.213513, 
0.012398, 0.313925, 0.213513, 
-0.215379, -0.018131, 0.254635, 
0.001113, 0.122996, 0.372016, 
0.001113, -0.050108, -0.985007, 
-0.215379, -0.018131, 0.254635, 
0.012398, 0.313925, 0.213513, 
0.219197, -0.018172, 0.253044, 
0.001113, -0.050108, -0.985007, 
0.012398, 0.313925, 0.213513, 
0.219197, -0.018172, 0.253044, 
-0.215379, -0.018131, 0.254635, 
0.001113, -0.050108, -0.985007, 
0.301224, -0.276743, 0.205711, 
0.457512, -0.151435, 0.173292, 
0.762492, -0.313925, 0.985007, 
0.301224, -0.276743, 0.205711, 
0.762492, -0.313925, 0.985007, 
0.219197, -0.018172, 0.253044, 
0.762492, -0.313925, 0.985007, 
0.457512, -0.151435, 0.173292, 
0.219197, -0.018172, 0.253044, 
0.001113, 0.122996, 0.372016, 
-0.215379, -0.018131, 0.254635, 
0.219197, -0.018172, 0.253044, 
};

const float starshipTexels[132] = 
{
0.80337, 0.558166, 
0.81902, 0.647724, 
0.73108, 0.483722, 
0.767232, 0.88906, 
0.789595, 0.949528, 
0.719622, 0.977, 
0.581876, 0.736858, 
0.566226, 0.826416, 
0.521408, 0.81136, 
0.533119, 0.828372, 
0.577937, 0.843428, 
0.505647, 0.917873, 
0.866665, 0.826555, 
0.911483, 0.801881, 
0.895593, 0.849749, 
0.825057, 0.558461, 
0.870363, 0.483722, 
0.822743, 0.647724, 
0.840763, 0.976377, 
0.793144, 0.88906, 
0.863116, 0.916531, 
0.71645, 0.963562, 
0.672338, 0.978323, 
0.656604, 0.88906, 
0.625285, 0.883059, 
0.652756, 0.97256, 
0.581174, 0.897821, 
0.930543, 0.835986, 
0.915361, 0.788125, 
0.959472, 0.812791, 
0.959683, 0.489722, 
0.874303, 0.633968, 
0.930754, 0.483722, 
0.649513, 0.736858, 
0.697382, 0.745914, 
0.642631, 0.881104, 
0.892341, 0.635923, 
0.99361, 0.771113, 
0.948792, 0.786169, 
0.474469, 0.009653, 
0.54845, 0.12269, 
0.307351, 0.080678, 
0.252763, 0.082693, 
0.01227, 0.122925, 
0.086477, 0.011623, 
0.247367, 0.9955, 
0.01227, 0.122925, 
0.252763, 0.082693, 
0.54845, 0.12269, 
0.310909, 0.997262, 
0.307351, 0.080678, 
0.727495, 0.712881, 
0.647056, 0.713176, 
0.687128, 0.483722, 
0.803956, 0.65568, 
0.832884, 0.64968, 
0.889335, 0.799926, 
0.591765, 0.881104, 
0.584882, 0.736858, 
0.639625, 0.872342, 
0.80095, 0.736858, 
0.744499, 0.887104, 
0.700387, 0.872342, 
0.687128, 0.734903, 
0.647056, 0.713176, 
0.727495, 0.712881, 
};

const float starshipNormals[198] = 
{
0.588526, 0.8043, 0.082085, 
0.193934, -0.743086, 0.640479, 
0.588526, 0.8043, 0.082085, 
-0.774133, 0.361102, -0.519927, 
0.777665, 0.356782, -0.517633, 
-0.774133, 0.361102, -0.519927, 
0.453233, -0.88553, 0.10206, 
-0.270659, 0.089597, -0.958497, 
0.453233, -0.88553, 0.10206, 
0.193934, -0.743086, 0.640479, 
-0.480937, 0.87674, -0.005192, 
0.193934, -0.743086, 0.640479, 
0.271729, 0.091046, -0.958057, 
-0.823307, 0.545207, -0.157847, 
0.271729, 0.091046, -0.958057, 
-0.594033, 0.800046, 0.083968, 
0.538745, -0.763868, -0.355331, 
-0.594033, 0.800046, 0.083968, 
0.777665, 0.356782, -0.517633, 
1.17097e+16, 4.59163e-41, 0.687128, 
0.777665, 0.356782, -0.517633, 
-0.458759, -0.882484, 0.103739, 
0.558166, 0.81902, 0.647724, 
-0.458759, -0.882484, 0.103739, 
-0.199995, -0.741166, 0.640839, 
0.719622, 0.977, 0.581876, 
-0.199995, -0.741166, 0.640839, 
-0.270659, 0.089597, -0.958497, 
0.828372, 0.577937, 0.843428, 
-0.270659, 0.089597, -0.958497, 
-0.538745, -0.763868, -0.355331, 
0.895593, 0.849749, 0.825057, 
-0.538745, -0.763868, -0.355331, 
0.811241, -0.356906, 0.463148, 
0.976377, 0.793144, 0.88906, 
0.811241, -0.356906, 0.463148, 
-0.480937, 0.87674, -0.005192, 
0.656604, 0.88906, 0.625285, 
-0.480937, 0.87674, -0.005192, 
0.637297, 0.469581, 0.611021, 
0.835986, 0.915361, 0.788125, 
0.637297, 0.469581, 0.611021, 
-0.642687, 0.511493, 0.570375, 
0.930754, 0.483722, 0.649513, 
-0.642687, 0.511493, 0.570375, 
-0.823307, 0.545207, -0.157847, 
0.930754, 0.483722, 0.649513, 
-0.823307, 0.545207, -0.157847, 
0.846183, 0.507623, -0.16215, 
0.635923, 0.99361, 0.771113, 
0.846183, 0.507623, -0.16215, 
0, -0.999667, 0.025787, 
0.588526, 0.8043, 0.082085, 
0, -0.999667, 0.025787, 
0.538745, -0.763868, -0.355331, 
0.307351, 0.080678, 0.252763, 
0.538745, -0.763868, -0.355331, 
-0.81516, -0.343915, 0.466087, 
0.9955, 0.310909, 0.997262, 
-0.81516, -0.343915, 0.466087, 
0.486085, 0.873877, -0.0077, 
0.889335, 0.799926, 0.591765, 
0.486085, 0.873877, -0.0077, 
0.002747, -0.641946, 0.766745, 
0.588526, 0.8043, 0.082085, 
0.002747, -0.641946, 0.766745, 
};

const int starshipMaterials = 3;

const int starshipFirsts[3] = 
{
0,
30,
63,
};

const int starshipCounts[3] = 
{
30,
33,
3,
};

const float starshipDiffuses[3][3] = 
{
0, 0, 0.75, 
0.75, 0.75, 0.75, 
1, 0.5, 0, 
};

const float starshipSpeculars[3][3] = 
{
0, 0.25, 0.25, 
1, 1, 1, 
0.5, 0, 0, 
};

