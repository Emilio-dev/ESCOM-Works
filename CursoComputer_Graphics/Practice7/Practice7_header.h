#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define imageWidth 1920
#define imageHeight 1920
#define background "0 0 0 " // black
#define pixel "255 0 0 "    // red
int mat[imageWidth][imageHeight] = {0};

typedef struct
{
    float x;
    float y;
    float z;
} vertex;

typedef struct
{
    int x;
    int y;
    int z;
} data;

void Check_Of_Memory(const void* p);
vertex Calculate(float u, float v);
vertex CalculateV(float t, vertex *pnts);
vertex CalculateU(float t, int row);
void Draw_Line_Bresenham(int x1, int y1, int x2, int y2);
void setProjectionMatrix(const float *angleOfView, const float *near, const float *far, float M[4][4]);
vertex multPointMatrix(vertex in, float M[4][4]);
void Make_3D(vertex *vertex_array, int nv);
void Store_ppm();

/// 16 Control Points
vertex Points[4][4] = {
    {{10, 0, 10},
     {5, 0, 10},
     {-5, 0, 10},
     {-10, 0, 10}},
    {{10, 0, 5},
     {5, 6, 5},
     {-5, 6, 5},
     {-10, 0, 5}},
    {{10, 0, -5},
     {5, 6, -5},
     {-5, 6, -5},
     {-10, 0, -5}},
    {{10, 0, -10},
     {5, 0, -10},
     {-5, 0, -10},
     {-10, 0, -10}}};
