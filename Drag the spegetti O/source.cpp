#include <iostream>
#include <termios.h>
using namespace std;
void set_no_buffer() {
     struct termios term;
     tcgetattr(0, &term);
     term.c_lflag &= ~ICANON;
     tcsetattr(0, TCSANOW, &term);
}
bool gameOver;
int width = 7, height = 5, x, y, goalX=3, goalY, boxX, boxY, score, poop;
void setup() {
	gameOver = false;
	srand (time(NULL));
	goalX=rand() % 5 + 1;
	boxY=rand() % 3 + 2;
	srand (time(NULL));
	goalY=rand() % 5, boxX=rand() % 4 + 2;
	x=1, y=0;
}
void draw() {
		system("clear");
	for (int i=0; i<width; i++) {
		cout << "# "; }
	cout << endl;

	for (int i=0; i<height; i++) {
			
		for (int j=0; j<width-1; j++) {
			
			if (j == 0)
				cout << "# ";
				
			else if (j == x && i == y && j == goalX && i == goalY) {
				cout << "xI"; }	

			else if (j == x && i == y)
				cout << "I ";
			
			else if (j == goalX && i == goalY)
				cout << "x ";
				
			else if (j == boxX && i == boxY)
				cout << "O ";
				
			else
				cout << "  ";
		}
	cout << "#" << endl;
	}
	
	for (int i=0; i<width; i++) {
		cout << "# "; }
		cout << endl;
		
}
void input() {
char key;
    cin >> key;
    switch (key)
    {
    case 'a':
		if (x - 1 < 1) {break;}
		if (x - 1 == boxX && boxY == y) {if (boxX-1<1) {break;} else {x--; boxX--; break;}}
		else x--;
        //LEFT;
        break;
    case 'A':
		if (x - 1 < 1) {break;}
		if (x - 1 == boxX && boxY == y) {break;}
		if (x + 1 == boxX && boxY == y) {x--; boxX--; break;}
		else x--;
        //LEFT;
        break;
    case 'd':
		if (x + 1 > 5) {break;}
		if (x + 1 == boxX && boxY == y) {if (boxX+1>5) {break;} else {x++; boxX++; break;}}
		else x++;
        //dir = RIGHT;
        break;
    case 'D':
		if (x + 1 > 5) {break;}
		if (x + 1 == boxX && boxY == y) {break;}
		if (x - 1 == boxX && boxY == y) {x++; boxX++; break;}
		else x++;
	    break;
    case 'w':
		if (y - 1 < 0) {break;}
		if (y - 1 == boxY && boxX == x) if (boxY-1<0) {break;} else {y--; boxY--; break;}
		else y--;
        //dir = UP;
        break;
    case 'W':
		if (y - 1 < 0) {break;}
		if (y - 1 == boxY && boxX == x) {break;}
		if (y + 1 == boxY && boxX == x) {y--; boxY--; break;}
		else y--;
		break;
    case 's':
		if (y + 1 > 4) {break;}
		if (y + 1 == boxY && boxX == x) if (boxY+1>4) {break;} else {y++; boxY++; break;}
		else y++;
        //dir = DOWN;
        break;
    case 'S':
		if (y + 1 > 4) {break;}
		if (y + 1 == boxY && boxX == x) {break;}
		if (y - 1 == boxY && boxX == x) {y++; boxY++; break;}
		else y++;
		break;
    case 'x':
        setup();
        break;
    }


}
void logic() {
	if (boxX == goalX && boxY == goalY) {
		score++;
		setup();
	}
}
int main() {
	setup();
	set_no_buffer();
	while (gameOver == false) {
	draw();
	input();
	logic();
}
}
