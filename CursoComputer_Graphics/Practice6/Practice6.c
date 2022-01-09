#include "Practice6_header.h"

int main()
{
    int Nlines;
    data *poli_data = ((data *)malloc(sizeof(data) * 4));
    Check_Of_Memory(poli_data);
    for (int i = 0; i < 4; i++)
    {
        printf("Input the %d of x,y,z", i);
        scanf("%d,%d,%d", &poli_data[i].x, &poli_data[i].y, &poli_data[i].z);
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

void Create_Curve(data *poli_data, int Nlines)
{
    float t = 1, x, y, z, p;
    t = t / Nlines;
    p = t;
    vertex *vertex_array = ((vertex *)malloc(sizeof(vertex) * (Nlines + 2)));
    Check_Of_Memory(vertex_array);
    for (int i = 0; i <= Nlines; i++)
    {
        t = i * p;
        x = (poli_data[0].x * pow(t, 3) + poli_data[1].x * pow(t, 2) + poli_data[2].x * t + poli_data[3].x);
        y = (poli_data[0].y * pow(t, 3) + poli_data[1].y * pow(t, 2) + poli_data[2].y * t + poli_data[3].y);
        z = (poli_data[0].z * pow(t, 3) + poli_data[1].z * pow(t, 2) + poli_data[2].z * t + poli_data[3].z);
        vertex_array[i].x = x;
        vertex_array[i].y = y;
        vertex_array[i].z = z;
    }
    Make_3D(vertex_array, Nlines + 1);
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

void setProjectionMatrix(const float *angleOfView, const float *near, const float *far, float M[4][4])
{
    float scale = 1 / tan(*angleOfView * 0.5 * M_PI / 180);
    M[0][0] = scale;
    M[1][1] = scale;
    M[2][2] = -*far / (*far - *near);
    M[3][2] = (-*far * *near) / (*far - *near);
    M[2][3] = -1;
    M[3][3] = 0;
}

vertex multPointMatrix(vertex in, float M[4][4])
{
    vertex out;
    out.x = in.x * M[0][0] + in.y * M[1][0] + in.z * M[2][0] + M[3][0];
    out.y = in.x * M[0][1] + in.y * M[1][1] + in.z * M[2][1] + M[3][1];
    out.z = in.x * M[0][2] + in.y * M[1][2] + in.z * M[2][2] + M[3][2];
    float w = in.x * M[0][3] + in.y * M[1][3] + in.z * M[2][3] + M[3][3];

    if (w != 1)
    {
        out.x /= w;
        out.y /= w;
        out.z /= w;
    }
    return out;
}

void Make_3D(vertex *vertex_array, int nv)
{
    float M[4][4] = {{1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {0, 0, 0, 1}}, Camera[4][4] = {{1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {0, 0, 0, 1}};
    float angleOfView = 90;
    float near = 0.1;
    float far = 100;
    int x = 0, y = 0;
    vertex vertCamera, projectedVert;
    Camera[3][1] = -10;
    Camera[3][2] = -20;
    vertex *vertex_array_3D = ((vertex *)malloc(sizeof(vertex) * nv));
    Check_Of_Memory(vertex_array_3D);
    setProjectionMatrix(&angleOfView, &near, &far, M);
    for (int i = 0; i < nv; i++)
    {
        vertCamera = multPointMatrix(vertex_array[i], Camera);
        projectedVert = multPointMatrix(vertCamera, M);
        x = (imageHeight - (projectedVert.x + 1) * 0.5 * (imageHeight));
        y = (imageWidth - (projectedVert.y + 1) * 0.5 * (imageWidth));
        vertex_array_3D[i].x = y;
        vertex_array_3D[i].y = x;
    }
    Make_2D(vertex_array_3D, nv - 1);
}

void Make_2D(vertex *vertex_array, int nv)
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