#include "DrawingFlag_header.h"

int main()
{
	FILE *f;
	f = fopen("flag.ppm", "a");
	int i, j;

	char *r = "255  0   0 ";
	char *w = "255 255 255";
	char *g = " 0  255  0 ";

	fprintf(f, "P3\n");
	fprintf(f, "1920 1080\n");
	fprintf(f, "255\n");
	for (i = 0; i < 1080; i++)
	{
		for (j = 0; j < 1920; j++)
		{
			if (j < 640)
			{
				fprintf(f, "%s ", g);
			}
			if (j >= 640 && j < 1280)
			{
				fprintf(f, "%s ", w);
			}
			if (j >= 1280)
			{
				fprintf(f, "%s ", r);
			}
		}
		fprintf(f, "\n");
	}
	fclose(f);
	return 1;
}
