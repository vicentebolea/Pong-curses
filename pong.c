#include <ncurses.h>		
#include <stdlib.h>
#include <stdbool.h>
typedef struct objeto{ short int x; short int y; short int c; bool movver; bool movhor;};
bool cbool(bool);
bool cbool(bool) {return a=(a==true) ? false : true;}

void initgame(objeto *b1,objeto *b2, objeto *scr){
	
	initscr();					//inicia la pantalla
	start_color();	
	keypad(stdscr, true);				//Teclas especiales
	noecho();					//Que no devuelva lo que introduzcas por la pantalla
	curs_set(0);					
	nodelay(stdscr,0); 
	getmaxyx(stdscr,s.y,s.x);
	b1->x=scr->x-2; b2->x=1;
	b1->y=scr->y/2; b2->y=scr->y/2;
	b1->c=0;	b2->c=0;
	mvprintw(4,5,"          oooooooooo                                   "); 
        mvprintw(5,5,"          888    888  ooooooo  oo oooooo     oooooooo8 ");
        mvprintw(6,5,"          888oooo88 888     888 888   888  888    88o  ");
        mvprintw(7,5,"          888       888     888 888   888   888oo888o  ");
        mvprintw(8,5,"         o888o        88ooo88  o888o o888o 888     888 ");
        mvprintw(9,5,"                                            888ooo888  ");
        mvprintw(11,5,"Hecho por Tito ,cualquier sugerencia vicente.bolea@gmail.com");
      	getch();
	erase();
	
	mvprintw(scr->y/2,scr->x/3,"Jugador1 tus controles son 'a' y 'q'");
	mvprintw(1+scr->y/2,scr->x/3,"Jugador2 tus controles son las flechas del teclado");
	mvprintw(2+scr->y/2,scr->x/3,"Pulse ENTER para empezar");
	getch();
			
	nodelay(stdscr,1);		
	init_pair(1,COLOR_RED,COLOR_BLACK);
	init_pair(2,COLOR_BLUE,COLOR_BLACK);
	init_pair(3,COLOR_WHITE,COLOR_BLACK); 
}
void engine(objeto *a,objeto *b1,objeto *b2,objeto *scr) {

	a->movver=((a->y==scr->y-1)||(a->y==1)) ? cbool(a->movver);
	if ((b->x>=src->x-2)||(b->x<=2)){
		a->movhor=cbool(a->movhor);
		a->movver=((a->y==b1->y-1)||(a->y==b2->y-1)) ? false : cbool(a->movver);
		a->movver=((a->y==b1->y+1)||(a->y==b2->y+1)) ? true : a->movver;
		b1->c=((b->y>b1->y+1)&&(b->y<b1->y-1)) ? b1->c+1: b1->c;
		b2->c=((b->y>b2->y+1)&&(b->y<b2->y-1)) ? b2->c+1: b2->c;
	}
	a->x=(a->movhor==true) ? a->x+1 : a->x-1;
	a->y=(a->movver==true) ? a->y+1 : a->y-1;
}
void main() {
	objeto b1,b2,b[5],src; int control,cont=0; bool fin=false;
	initgame(b1,b2,src);	
	goto inicio;
	while (fin != true) {
		cont++;
		usleep(4000);
		if (cont%16==0){ if (cont%1000) {for (i=0;i<5;i++){engine(b[i],b1,b2,s);} }}
		if (b1.y<=1) b1.y=s.y-2;
		if (b1.y>=s.y-1) b1.y=2;
		if (b2.y<=1) b2.y=s.y-2; 
		if (b2.y>=s.y-1) b2.y=2;
		
		fflush(stdin);
		control=getch();
		switch (control) {
			
			case KEY_DOWN:
				b1.y++;
				break;
			case KEY_UP:
				b1.y--;
				break;
			case 113:
				b2.y--;
				break;
			case 97:
				b2.y++;
				break;
			case 112:
				nodelay(stdscr,0);		//Pausa
				mvprintw(s.y/2,s.x/4,"El Juego esta en pausa, pulse ENTER para renaudar");
				getch();
				nodelay(stdscr,1);
				break;
			case 27:
				fin=true;
				break;
		}
		erase();		
		attron(COLOR_PAIR(3));
		mvprintw(b1.y-1,b1.x,"|");
		mvprintw(b1.y,b1.x,"|");
		mvprintw(b1.y+1,b1.x,"|");
		mvprintw(b2.y-1,b2.x,"|");
		mvprintw(b2.y,b2.x,"|");
		mvprintw(b2.y+1,b2.x,"|");
		attroff(COLOR_PAIR(3));

		attron(COLOR_PAIR(1));
		mvprintw(b.y,b.x,"o");
		attroff(COLOR_PAIR(1));
		box(stdscr,0,0);
		
		mvprintw(2,s.x/6,"Jugador1 : %i",b1.c);
		mvprintw(2,4*s.x/5,"%i : Jugador2",b2.c);
		mvprintw(2,s.x/2-4,"tiempo: %i",cont/8);
		attron(COLOR_PAIR(2));
		mvprintw(s.y-4,s.x/2-4,"PINGPONG");
		attroff(COLOR_PAIR(2));
		refresh();
		fflush(stdin);
	}
	erase();
	mvprintw(4,20,"Byee!!!");
	refresh();
        getch();
	system("sleep 1");
        endwin();
}
