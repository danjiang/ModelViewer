// This is a .c file for the model: cube

#include "cube.h"

const int cubeVertices = 36;

const float cubePositions[108] = 
{
1, 1, -0.999999, 
1, -1, 1, 
1, -1, -1, 
1, 1, -0.999999, 
0.999999, 1, 1, 
1, -1, 1, 
1, -1, -1, 
-1, 1, -1, 
1, 1, -0.999999, 
1, -1, -1, 
-1, -1, -1, 
-1, 1, -1, 
0.999999, 1, 1, 
-1, -1, 1, 
1, -1, 1, 
0.999999, 1, 1, 
-1, 1, 1, 
-1, -1, 1, 
1, -1, 1, 
-1, -1, -1, 
1, -1, -1, 
1, -1, 1, 
-1, -1, 1, 
-1, -1, -1, 
-1, -1, 1, 
-1, 1, -1, 
-1, -1, -1, 
-1, -1, 1, 
-1, 1, 1, 
-1, 1, -1, 
-1, 1, -1, 
0.999999, 1, 1, 
1, 1, -0.999999, 
-1, 1, -1, 
-1, 1, 1, 
0.999999, 1, 1, 
};

const float cubeTexels[72] = 
{
0.3756, 0.2519, 
0.6244, 0.5006, 
0.3756, 0.5006, 
0.3756, 0.2519, 
0.6244, 0.2519, 
0.6244, 0.5006, 
0.1269, 0.7494, 
0.3756, 0.9981, 
0.1269, 0.9981, 
0.1269, 0.7494, 
0.3756, 0.7494, 
0.3756, 0.9981, 
0.8731, 0.9981, 
0.6244, 0.7494, 
0.8731, 0.7494, 
0.8731, 0.9981, 
0.6244, 0.9981, 
0.6244, 0.7494, 
0.6244, 0.5006, 
0.3756, 0.7494, 
0.3756, 0.5006, 
0.6244, 0.5006, 
0.6244, 0.7494, 
0.3756, 0.7494, 
0.6244, 0.7494, 
0.3756, 0.9981, 
0.3756, 0.7494, 
0.6244, 0.7494, 
0.6244, 0.9981, 
0.3756, 0.9981, 
0.3756, 0.0031, 
0.6244, 0.2519, 
0.3756, 0.2519, 
0.3756, 0.0031, 
0.6244, 0.0031, 
0.6244, 0.2519, 
};

const float cubeNormals[108] =
{
    1, 0, 0,
    1, 0, 0,
    1, 0, 0,
    1, 0, 0,
    1, 0, 0,
    1, 0, 0,
    0, 0, -1,
    0, 0, -1,
    0, 0, -1,
    0, 0, -1,
    0, 0, -1,
    0, 0, -1,
    -0, -0, 1,
    -0, -0, 1,
    -0, -0, 1,
    -0, -0, 1,
    -0, -0, 1,
    -0, -0, 1,
    0, -1, 0,
    0, -1, 0,
    0, -1, 0,
    0, -1, 0,
    0, -1, 0,
    0, -1, 0,
    -1, -0, -0,
    -1, -0, -0,
    -1, -0, -0,
    -1, -0, -0,
    -1, -0, -0,
    -1, -0, -0,
    0, 1, 0,
    0, 1, 0,
    0, 1, 0,
    0, 1, 0,
    0, 1, 0,
    0, 1, 0,
};

const int cubeMaterials = 6;

const int cubeFirsts[6] = 
{
0,
6,
12,
18,
24,
30,
};

const int cubeCounts[6] = 
{
6,
6,
6,
6,
6,
6,
};

const float cubeDiffuses[6][3] = 
{
1, 0, 1, 
1, 0, 0, 
0, 0, 0.5, 
0, 0.5, 0.5, 
0, 0, 0, 
0, 0, 0, 
};

const float cubeSpeculars[6][3] = 
{
0, 0, 0, 
0, 0, 0, 
1, 1, 1, 
1, 1, 1, 
0, 1, 0, 
1, 1, 0, 
};

