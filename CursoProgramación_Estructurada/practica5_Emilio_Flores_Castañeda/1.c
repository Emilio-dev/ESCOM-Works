#include "1cabecera.h"

int main(void)
{
	int col,fil,x,y;
	system("cls");

	printf("Ingresa Columnas: ");
	scanf("%d",&col);
	printf("Ingresa Filas: ");
	scanf("%d",&fil);
	for( y = 0;y < fil;y++)
	{
		for( x = 0;x < col;x++)
		{
			printf("Valor actual [%d][%d] : ",y,x);
			scanf("%d",&matrix[y][x]);
		}
	}
	printf("Matriz original\n");
	for(y = 0;y < fil;y++)
	{
		for(x = 0;x < col;x++)
		{
			printf("%d",matrix[y][x]);
		}
		printf("\n");
	}
	printf("Matriz transpuesta\n");
	for(y = 0;y < fil;y++)
	 {
		for(x = 0;x < col;x++)
		{
			printf("%d",matrix[x][y]); 
		}
		printf("\n");
	 }
	system("pause");
	return 0;
}