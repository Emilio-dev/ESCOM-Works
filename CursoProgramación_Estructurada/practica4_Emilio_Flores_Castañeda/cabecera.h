#include <conio.h>
#include <stdio.h>
#include <windows.h>
#include <stdlib.h>


int gotoxy(int x, int y){
     HANDLE hcon;  
      hcon = GetStdHandle(STD_OUTPUT_HANDLE);  
      COORD dwPos;  
      dwPos.X = x;  
      dwPos.Y= y;  
      SetConsoleCursorPosition(hcon,dwPos);  
}