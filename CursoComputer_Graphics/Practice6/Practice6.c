#include<stdio.h>
#include<stdlib.h>
#include<math.h>


#define imageWidth 1920
#define imageHeight 1080
int mat[imageWidth][imageHeight]={0};

typedef struct{
  int x;
  int y;
  int z;
}vertex;

void Draw_Line_Bresenham(int x1,int y1,int x2,int y2);
void Create_Curve(vertex* vertex_array,int Nlines);
void Draw_Segment_Console();

void main()
{
  int Nlines;  
  vertex *vertex_array=(( vertex *)malloc(sizeof( vertex)*4));  
  /*for(int i=0;i<4;i++)
  {
      printf("Input the %d of x y y",i);
      scanf("%d %d",&vertex_array[i].x,&vertex_array[i].y);
  }*/
  vertex_array[0].x=-8;
  vertex_array[0].y=1;
  vertex_array[1].x=9;
  vertex_array[1].y=1;
  vertex_array[2].x=2;
  vertex_array[2].y=1;
  vertex_array[3].x=4;
  vertex_array[3].y=4;
  Nlines=10;
  /*printf("Input the number of lines");
  scanf("%d",&Nlines);*/
  Create_Curve(vertex_array,Nlines);
  Draw_Segment_Console();
}

void Draw_Line_Bresenham(int x1,int y1,int x2,int y2)
{
  int x,y,dx,dy,dx1,dy1,px,py,xe,ye;
  dx=x2-x1;
  dy=y2-y1;
  dx1=fabs(dx);
  dy1=fabs(dy);
  px=2*dy1-dx1;
  py=2*dx1-dy1;
  if(dy1<=dx1)
  {
    if(dx>=0)
    {
    x=x1;
    y=y1;
    xe=x2;
    }
    else
    {
    x=x2;
    y=y2;
    xe=x1;
    }
    mat[x][y]=1;
    for(int i=0;x<xe;i++)
    {
    x=x+1;
    if(px<0)
    {
      px=px+2*dy1;
    }
    else
    {
      if((dx<0 && dy<0) || (dx>0 && dy>0))
      {
      y=y+1;
      }
      else
      {
      y=y-1;
      }
      px=px+2*(dy1-dx1);
    }
    mat[x][y]=1;
    }
  }
  else
  {
    if(dy>=0)
    {
    x=x1;
    y=y1;
    ye=y2;
    }
    else
    {
    x=x2;
    y=y2;
    ye=y1;
    }
    mat[x][y]=1;
    for(int i=0;y<ye;i++)
    {
    y=y+1;
    if(py<=0)
    {
      py=py+2*dx1;
    }
    else
    {
      if((dx<0 && dy<0) || (dx>0 && dy>0))
      {
      x=x+1;
      }
      else
      {
      x=x-1;
      }
      py=py+2*(dx1-dy1);
    }
    mat[x][y]=1;
    }
  }
}

void Create_Curve(vertex* vertex_array,int Nlines)
{
    int j;
    float t=1,x2,y2,x1=vertex_array[3].x,y1=vertex_array[3].y,p;
    t=t/Nlines;
    p=t;
    j=1;
    for(int i=0;i<Nlines;i++)
    {
        j++;
        x2=(vertex_array[0].x*pow(t,3)+vertex_array[1].x*pow(t,2)+vertex_array[2].x*t+vertex_array[3].x);
        y2=(vertex_array[0].y*pow(t,3)+vertex_array[1].y*pow(t,2)+vertex_array[2].y*t+vertex_array[3].y);
        printf("%f,%f-%f,%f\n",x1,y1,x2,y2);
        printf("%f\n",t);
        Draw_Line_Bresenham(x1*5,y1*5,x2*5,y2*5);
        x1=x2;
        y1=y2;    
        t=p*j;
    }
}

void Draw_Segment_Console()
{
  for(int i=0;i<100;i++)
  {
    for(int j=0;j<100;j++)
    {
      printf("%d",mat[i][j]);
    }
    printf("\n");
  }
}
