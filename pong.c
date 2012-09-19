#include <ncurses.h>
typedef struct{short int x,y,c; bool movhor,movver;}object;

int main(int argc, char **argv){	
	object scr; int i,cont=0; bool fin=false;
	initscr();					
	start_color();
	init_pair(1,COLOR_BLUE,COLOR_BLACK);	
	keypad(stdscr,true);
	noecho();
	curs_set(0);						
	getmaxyx(stdscr,scr.y,scr.x);
	object b1={scr.x-2,scr.y/2,0,false,false},b2={1,scr.y/2,0,false,false},b={scr.x/2,scr.y/2,0,false,false};
	mvprintw(4,5,"          oooooooooo                                  "); 
	mvprintw(5,5,"          888    888  ooooooo    ooooooo    oooooooo8");
	mvprintw(6,5,"          888oooo88 888     888 888   888  888    88o ");
	mvprintw(7,5,"          888       888     888 888   888   888oo888o ");
	mvprintw(8,5,"         o888o        88ooo88  o888o o888o 888     888");
	mvprintw(9,5,"                                            888ooo888");
	mvprintw(11,5,"Any questions please send me at vicente.bolea@gmail.com");
	mvprintw(14,scr.x/4,"Player 1 your controls are 'a' and 'q'");
	mvprintw(15,scr.x/4,"Player 2 your controls are the arrows of the keyboard");
	mvprintw(17,scr.x/4,"Push ANY key to start, 'p' for pause and ESC to quit");
	getch();
	for (nodelay(stdscr,1); !fin; usleep(4000)) {
		if (++cont%16==0){
			if ((b.y==scr.y-1)||(b.y==1)) 
				b.movver=!b.movver;
			if ((b.x>=scr.x-2)||(b.x<=2)){
				b.movhor=!b.movhor;
				if ((b.y==b1.y)||(b.y==b2.y)){}
				else if ((b.y==b1.y-1)||(b.y==b2.y-1)) 
					b.movver=false;
				else if ((b.y==b1.y+1)||(b.y==b2.y+1)) 
					b.movver=true;
				else if (b.x>=scr.x-2){
					b1.c++; 
					b.x=scr.x/2; 
					b.y=scr.y/2;
				}
				else{
					b2.c++; 
					b.x=scr.x/2; 
					b.y=scr.y/2;
				}
			}
			b.x=b.movhor ? b.x+1 : b.x-1;
			b.y=b.movver ? b.y+1 : b.y-1;
			if (b1.y<=1) 
				b1.y=scr.y-2;
			if (b1.y>=scr.y-1) 
				b1.y=2;
			if (b2.y<=1) 
				b2.y=scr.y-2; 
			if (b2.y>=scr.y-1) 
				b2.y=2;
		}
		switch (getch()) {
			case KEY_DOWN:	b1.y++; break;
			case KEY_UP: 	b1.y--; break;
			case 'q':	b2.y--; break;
			case 'a':	b2.y++; break;
			case 'p':	getchar(); break;
			case 27: endwin(); fin++; break;
		}
		erase();
		mvprintw(2,scr.x/2-2,"%i | %i",b1.c,b2.c);
		mvvline(0,scr.x/2,ACS_VLINE,scr.y);
		attron(COLOR_PAIR(1));
			mvprintw(b.y,b.x,"o");
			for(i=-1;i<2;i++){
				mvprintw(b1.y+i,b1.x,"|");
				mvprintw(b2.y+i,b2.x,"|");}
		attroff(COLOR_PAIR(1));
	}
}
