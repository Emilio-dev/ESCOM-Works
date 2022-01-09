#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define imageWidth 1000
#define imageHeight 1000
#define background "0 0 0 " //black
#define pixel "255 0 0 " //red
int mat[imageWidth][imageHeight] = {0};

typedef struct
{
  int x;
  int y;
} data;

void Check_Of_Memory(const void* p);
void Draw_Line_Bresenham(int x1, int y1, int x2, int y2);
void Create_Curve(data *vertex_array, int Nlines);
void Make_2D(data *vertex_array, int nv);
void Store_ppm();