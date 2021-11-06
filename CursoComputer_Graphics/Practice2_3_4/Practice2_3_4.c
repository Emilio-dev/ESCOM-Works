#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

#define imageWidth 1920
#define imageHeight 1080
int mat[imageWidth][imageHeight]={0};

typedef struct{
  float x;
  float y;
  float z;
}vertex;

typedef struct{
  int a;
  int b;
  int c;
}faces;

typedef struct{
  int a;
  int b;
}edges;

void count_vertexes_faces(int* nv,int* nf);
void Draw_Line_Bresenham(int x1,int y1,int x2,int y2);
void Convert_to_VLF(vertex* vertex_array,faces* faces_array,int nv,int nf );
void setProjectionMatrix(const float* angleOfView, const float* near, const float* far,float M[4][4]); 
vertex multPointMatrix(vertex in, float M[4][4]); 
void Read_OBJ();
void Make_2D(vertex* vertex_array,faces* faces_array,int nf );
void Make_3D(vertex* vertex_array,faces* faces_array,int nv,int nf);
void Draw_ppm();
void Draw_Segment_Console();

int main()
{
  Read_OBJ();
  Draw_Segment_Console();
  return 1;
}

void count_vertexes_faces(int* nv,int* nf)
{
  FILE *input;
  char k[20];
  input = fopen("objeto.obj","r");
  if(input == NULL)
  {
    printf("Error:file can´t be opened\n");
    exit(1);
  }
  while(!feof(input)){
    fgets(k,20,input);
    if(k[0]=='v') *nv=*nv+1;
    if(k[0]=='f') *nf=*nf+1;
  }
  fclose(input);
  free(input);
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

void Convert_to_VLF(vertex* vertex_array,faces* faces_array,int nv,int nf )
{
  FILE *output;
  output=fopen("VLF.flv","a");
  int edg=1;
  fprintf(output,"Vertexes\n");
  for(int i=0;i<nv;i++)
  {
    fprintf(output,"%d.-%f %f %f\n",i+1,vertex_array[i].x,vertex_array[i].y,vertex_array[i].z);
  }
  edges *edges_array=(( edges *)malloc(sizeof( edges)*(nf*3)));
  fprintf(output,"Edges\n");
  for(int i=0;i<nf;i++){
    fprintf(output,"%d %d %d\n",edg,faces_array[i].a,faces_array[i].b);
    edges_array[edg-1].a=edg,faces_array[i].a;
    edges_array[edg-1].b=edg,faces_array[i].b;
    edg++;
    fprintf(output,"%d %d %d\n",edg,faces_array[i].b,faces_array[i].c);
    edges_array[edg-1].a=edg,faces_array[i].b;
    edges_array[edg-1].b=edg,faces_array[i].c;
    edg++;
    fprintf(output,"%d %d %d\n",edg,faces_array[i].c,faces_array[i].a);
    edges_array[edg-1].a=edg,faces_array[i].c;
    edges_array[edg-1].b=edg,faces_array[i].a;
    edg++;
  }  
  fprintf(output,"Faces\n");
  for(int i=0;i<nf-1;i++){
    fprintf(output,"%d %d %d %d\n",i+1,faces_array[i].a,faces_array[i].b,faces_array[i].c);
  }


}

void setProjectionMatrix(const float* angleOfView, const float* near, const float* far,float M[4][4]) 
{ 
    float scale = 1 / tan(*angleOfView * 0.5 * M_PI / 180); 
    M[0][0] = scale; 
    M[1][1] = scale; 
    M[2][2] = -*far / (*far - *near); 
    M[3][2] = (-*far * *near) / (*far - *near); 
    M[2][3] = -1; 
    M[3][3] = 0; 
} 

vertex multPointMatrix(vertex in,float M[4][4]) 
{ 
   vertex out;
    out.x   = in.x * M[0][0] + in.y * M[1][0] + in.z * M[2][0] + /* in.z = 1 */ M[3][0]; 
    out.y   = in.x * M[0][1] + in.y * M[1][1] + in.z * M[2][1] + /* in.z = 1 */ M[3][1]; 
    out.z   = in.x * M[0][2] + in.y * M[1][2] + in.z * M[2][2] + /* in.z = 1 */ M[3][2]; 
    float w = in.x * M[0][3] + in.y * M[1][3] + in.z * M[2][3] + /* in.z = 1 */ M[3][3]; 

    if (w != 1) { 
        out.x /= w; 
        out.y /= w; 
        out.z /= w; 
    }
 return out;
} 

void Draw_ppm()//aun no
{
  FILE *output;	
  output = fopen("image.ppm", "a");	
  fprintf(output, "P3\n");
  fprintf(output, "1920 1080\n");
  fprintf(output, "255\n");
  for(int i=0;i<1920;i++)
  {
    for(int j=0;j<imageHeight;j++)
    {
      if(mat[i][j]==1) fputs("255 255 255 ",output);
      else fputs("0 0 0 ",output);
    }
    fprintf(output,"\n");
  }
  printf("\nImage correctly rendered\n");
  fclose(output);
  free(output);
}

void Read_OBJ()
{
  FILE *input;
  float x,y,z;
  char k[1];
  int  a,b,c,xmin=0,ymin=0,nv=0,nf=0;
  count_vertexes_faces(&nv,&nf);
  vertex *vertex_array=(( vertex *)malloc(sizeof( vertex)*nv));
  faces *faces_array=(( faces *)malloc(sizeof( faces)*nf));
  input = fopen("objeto.obj","r");
  if(input == NULL)
  {
          printf("Error:file can´t be opened\n");
          exit(1);
  }
  for(int i=0;i<nv;i++)
  {		
    fscanf(input, "%s %f %f %f",k,&x,&y,&z );		
      if (k[0]=='v'){
          if(x<xmin) xmin=x;
          if(y<ymin) ymin=y;
          vertex_array[i].x=x;
          vertex_array[i].y=y; 
          vertex_array[i].z=z; 
      }
  } 
  for(int i=0;i<nv;i++)
  {
    vertex_array[i].x-=xmin;
    vertex_array[i].y-=ymin;
  }
  for(int i=0;i<nf;i++)
  {
    fscanf(input,"%s %d %d %d",k,&a,&b,&c);
    if(k[0] =='f')
    {
          faces_array[i].a=a;
          faces_array[i].b=b;
          faces_array[i].c=c;
    }  
  }
  a=0;
  printf("3D==1 2D==2\n");
  scanf("%d",&a);
  if(a==1) Make_3D(vertex_array,faces_array,nf,nv);
  else if(a==2) Make_2D(vertex_array,faces_array,nf);
  else printf("Not a valid option bye");
  Convert_to_VLF(vertex_array,faces_array,nv,nf);
  fclose(input);
  free(vertex_array);
  free(faces_array);
  free(input);
}

void Make_2D(vertex* vertex_array,faces* faces_array,int nf )
{
  int a,b,c;
  for(int i=0;i<nf;i++)
  {
    a=faces_array[i].a;
    b=faces_array[i].b;
    c=faces_array[i].c;
    Draw_Line_Bresenham(vertex_array[a-1].x,vertex_array[a-1].y,vertex_array[b-1].x,vertex_array[b-1].y);
    Draw_Line_Bresenham(vertex_array[b-1].x,vertex_array[b-1].y,vertex_array[c-1].x,vertex_array[c-1].y);
    Draw_Line_Bresenham(vertex_array[c-1].x,vertex_array[c-1].y,vertex_array[a-1].x,vertex_array[a-1].y);  
  }
  //Draw_ppm();
}

void Make_3D(vertex* vertex_array,faces* faces_array,int nf,int nv)
{
  float M[4][4]= {1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1},Camera[4][4]={1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1};
  float angleOfView = 90; 
  float near = 0.1; 
  float far = 100; 
  int x=0,y=0;
  vertex vertCamera, projectedVert;
  Camera[3][1] = -10;
  Camera[3][2] = -20;
  vertex *vertex_array_3D=(( vertex *)malloc(sizeof( vertex)*nv));
  setProjectionMatrix(&angleOfView,&near,&far,M); 
  for (int i = 0; i < nv; i++) {    
        vertCamera=multPointMatrix(vertex_array[i],Camera);
        projectedVert=multPointMatrix(vertCamera,M);
        if (projectedVert.x < -1 || projectedVert.x > 1 || projectedVert.y < -1 || projectedVert.y > 1) continue;
        x = (projectedVert.x + 1) * 0.5 * 20;
        y = (1 - (projectedVert.y + 1) * 0.5) * 20;
        vertex_array_3D[i].x=x;
        vertex_array_3D[i].y=y;
    }
  Make_2D(vertex_array_3D,faces_array,nf); 
  //Draw_ppm();
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

void Rotation()
{

}

void Translation()
{
  
}

void Ilumination()
{

}

