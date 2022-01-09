#include "Practice5_header.h"

int main()
{
  int Nlines;
  data *poli_data = ((data *)malloc(sizeof(data) * 4));
  Check_Of_Memory(poli_data);
  for (int i = 0; i < 4; i++)
  {
    printf("Input %d of x,y", i);
    scanf("%d,%d", &poli_data[i].x, &poli_data[i].y);
  }
  printf("Input the number of lines");
  scanf("%d", &Nlines);
  Create_Curve(poli_data, Nlines);
  Store_ppm();
  return 0;
}

void Check_Of_Memory(const void* p)
{
    if (!p)
    {
        printf("ERROR! Out of memory!\n");
        exit(1);
    }
}

void Draw_Line_Bresenham(int x1, int y1, int x2, int y2)
{
  int x, y, dx, dy, dx1, dy1, px, py, xe, ye;
  dx = x2 - x1;
  dy = y2 - y1;
  dx1 = fabs(dx);
  dy1 = fabs(dy);
  px = 2 * dy1 - dx1;
  py = 2 * dx1 - dy1;
  if (dy1 <= dx1)
  {
    if (dx >= 0)
    {
      x = x1;
      y = y1;
      xe = x2;
    }
    else
    {
      x = x2;
      y = y2;
      xe = x1;
    }
    mat[x][y] = 1;
    for (int i = 0; x < xe; i++)
    {
      x = x + 1;
      if (px < 0)
      {
        px = px + 2 * dy1;
      }
      else
      {
        if ((dx < 0 && dy < 0) || (dx > 0 && dy > 0))
        {
          y = y + 1;
        }
        else
        {
          y = y - 1;
        }
        px = px + 2 * (dy1 - dx1);
      }
      mat[x][y] = 1;
    }
  }
  else
  {
    if (dy >= 0)
    {
      x = x1;
      y = y1;
      ye = y2;
    }
    else
    {
      x = x2;
      y = y2;
      ye = y1;
    }
    mat[x][y] = 1;
    for (int i = 0; y < ye; i++)
    {
      y = y + 1;
      if (py <= 0)
      {
        py = py + 2 * dx1;
      }
      else
      {
        if ((dx < 0 && dy < 0) || (dx > 0 && dy > 0))
        {
          x = x + 1;
        }
        else
        {
          x = x - 1;
        }
        py = py + 2 * (dx1 - dy1);
      }
      mat[x][y] = 1;
    }
  }
}

void Create_Curve(data *poli_data, int Nlines)
{
  float t = 1, x, y, p;
  t = t / Nlines;
  p = t;
  data *vertex_array = ((data *)malloc(sizeof(data) * Nlines));
  Check_Of_Memory(vertex_array);
  for (int i = 0; i < Nlines; i++)
  {
    t = i * p;
    x = (poli_data[0].x * pow(t, 3) + poli_data[1].x * pow(t, 2) + poli_data[2].x * t + poli_data[3].x);
    y = (poli_data[0].y * pow(t, 3) + poli_data[1].y * pow(t, 2) + poli_data[2].y * t + poli_data[3].y);
    vertex_array[i].x = ((x + 1) * 0.05 * (imageHeight));
    vertex_array[i].y = ((y + 1) * 0.05 * (imageWidth));
  }
  Make_2D(vertex_array, Nlines - 1);
}

void Make_2D(data *vertex_array, int nv)
{
  for (int i = 0; i < nv; i++)
    Draw_Line_Bresenham(vertex_array[i].x, vertex_array[i].y, vertex_array[i + 1].x, vertex_array[i + 1].y);
}

void Store_ppm()
{
  FILE *output;
  int x = 0;
  output = fopen("image.ppm", "a");
  fprintf(output, "P3\n");
  fprintf(output, "%d %d\n", imageHeight, imageWidth);
  fprintf(output, "255\n");
  for (int i = 0; i < imageHeight; i++)
  {
    for (int j = 0; j < imageWidth; j++)
    {
      if (mat[i][j] == 1)
      {
        fputs(pixel, output);
        x++;
      }
      else
        fputs(background, output);
    }
    fprintf(output, "\n");
  }
  printf("Image correctly rendered\n");
  fclose(output);
  free(output);
}