#include <ncurses.h>

typedef struct{short int x;  short int y; short int c; bool movhor; bool movver;}objeto;
bool cbool(bool a) {return a=(a==true) ? false : true;}
main(){	register objeto b1,b2,b,scr; register int i,cont=0; bool fin=false;	
	initscr();					
	start_color();
	init_pair(1,COLOR_BLUE,COLOR_BLACK);	
	keypad(stdscr,true);
	noecho();
	curs_set(0);						
	getmaxyx(stdscr,scr.y,scr.x);
	b1.x=scr.x-2; 	b2.x=1;		b.x=scr.x/2;
	b1.y=scr.y/2; 	b2.y=scr.y/2; 	b.y=scr.y/2;
	b1.c=0;		b2.c=0;
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
	nodelay(stdscr,1);
	while (fin != true) {
		usleep(4000);
		if (++cont%16==0){if((b.y==scr.y-1)||(b.y==1)) b.movver=cbool(b.movver);
			if ((b.x>=scr.x-2)||(b.x<=2)){
				b.movhor=cbool(b.movhor);
				if((b.y==b1.y-1)||(b.y==b2.y-1)) b.movver=false;
				if((b.y==b1.y+1)||(b.y==b2.y+1)) b.movver=true;
				if (((b.y > b1.y+1)||(b.y < b1.y-1))&&(b.x>=scr.x-2)) {b1.c++; b.x=scr.x/2; b.y=scr.y/2;}
				if (((b.y > b2.y+1)||(b.y < b2.y-1))&&(b.x<=2)) {b2.c++; b.x=scr.x/2; b.y=scr.y/2;}}
		b.x=(b.movhor==true) ? b.x+1 : b.x-1;
		b.y=(b.movver==true) ? b.y+1 : b.y-1;
		if (b1.y<=1) b1.y=scr.y-2;
		if (b1.y>=scr.y-1) b1.y=2;
		if (b2.y<=1) b2.y=scr.y-2; 
		if (b2.y>=scr.y-1) b2.y=2;}
		switch (getch()) {
			case KEY_DOWN:	b1.y++; break;
			case KEY_UP: 	b1.y--; break;
			case 'q':	b2.y--; break;
			case 'a':	b2.y++; break;
			case 'p':	nodelay(stdscr,0); getch(); nodelay(stdscr,1); break;
			case 27: fin++; break;}
		erase();
		mvprintw(2,scr.x/2-2,"%i | %i",b1.c,b2.c);
		move(0,scr.x/2);vline(ACS_VLINE,scr.y);
		attron(COLOR_PAIR(1));
			mvprintw(b.y,b.x,"o");
			for(i=-1;i<2;i++){
				mvprintw(b1.y+i,b1.x,"|");
				mvprintw(b2.y+i,b2.x,"|");}
		attroff(COLOR_PAIR(1));
	}endwin();
}
