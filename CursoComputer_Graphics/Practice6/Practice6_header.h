#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define imageWidth 1920
#define imageHeight 1920
#define background "0 0 0 " //black pixel color
#define pixel "255 0 0 " //red pixel color
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
void Draw_Line_Bresenham(int x1, int y1, int x2, int y2);
void Create_Curve(data *vertex_array, int Nlines);
void setProjectionMatrix(const float *angleOfView, const float *near, const float *far, float M[4][4]);
vertex multPointMatrix(vertex in, float M[4][4]);
void Make_3D(vertex *vertex_array, int nv);
void Make_2D(vertex *vertex_array, int nv);
void Store_ppm();
