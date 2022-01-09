#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>

#define name "teapot.obj"
#define imageHeight 1920
#define imageWidth 1920
#define background "0 0 0 " // black
#define line "255 255 255 " // white
int mat[imageHeight][imageWidth] = {0};

typedef struct
{
  float x;
  float y;
  float z;
} vertex;

typedef struct
{
  int a;
  int b;
  int c;
} faces;

typedef struct
{
  int R;
  int G;
  int B;
} colors;

void Check_Of_Memory(const void* p);
void count_vertexes_faces(int *nv, int *nf);
void Convert_to_VLF(vertex *vertex_array, faces *faces_array, int nv, int nf);
vertex *Read_OBJ_vertex(int nv);
faces *Read_OBJ_faces(int nf, int nv);
void Draw_Line_Bresenham(int x1, int y1, int x2, int y2);
void setProjectionMatrix(const float *angleOfView, const float *near, const float *far, float M[4][4]);
vertex multPointMatrix(vertex in, float M[4][4]);
void Make_2D(vertex *vertex_array, faces *faces_array, int nf);
void Make_3D(vertex *vertex_array, faces *faces_array, int nv, int nf);
colors *GenerateColors();
void Store_ppm(int imagecounter, colors *vertex_colors);
void Translation(int pixels, char *direction);
void setRotationMatirx(const float xang, const float yang, const float zang, float M[3][3]);
vertex multPointRotationMatrix(vertex in, float M[3][3]);
vertex *Rotation(float xang, float yang, float zang, vertex *vertex_array, faces *faces_array, int nv, int nf);
void Make_Animation(int movement,int fotograms,vertex *vertex_array,faces *faces_array,int nv,int nf);