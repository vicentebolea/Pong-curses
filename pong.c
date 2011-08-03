#include <ncurses.h>		
#include <stdlib.h>
#include <stdbool.h>
struct objeto{ int x; int y; int c;};
bool cbool(bool);
bool cbool(bool a) {return a=(a==true) ? false : true;} 

void main() {
	struct objeto b1,b2,b,s; char nombre[10]; char nombre2[10];
	int control; int cont=0;
	bool fin = false; bool movhor=true; bool movver=true;
	
	initscr();					//inicia la pantalla
	start_color();	
	keypad(stdscr, true);				//Teclas especiales
	noecho();					//Que no devuelva lo que introduzcas por la pantalla
	curs_set(0);					
	nodelay(stdscr,0); 
	getmaxyx(stdscr,s.y,s.x);
	b1.x=s.x-2; b2.x=1;
	b1.y=s.y/2; b2.y=s.y/2;
	b1.c=0;		b2.c=0;
	mvprintw(4,5,"          oooooooooo                                   "); 
        mvprintw(5,5,"          888    888  ooooooo  oo oooooo     oooooooo8 ");
        mvprintw(6,5,"          888oooo88 888     888 888   888  888    88o  ");
        mvprintw(7,5,"          888       888     888 888   888   888oo888o  ");
        mvprintw(8,5,"         o888o        88ooo88  o888o o888o 888     888 ");
        mvprintw(9,5,"                                            888ooo888  ");
        mvprintw(11,5,"Hecho por Tito ,cualquier sugerencia vicente.bolea@gmail.com");
        mvprintw(13,s.y/3,"Introduzca el nombre del jugador 1 y pulse ENTER");
    	scanw("%s",nombre);
	mvprintw(15,s.y/3,"Introduzca el nombre del jugador 2 y pulse ENTER");
	scanw("%s",nombre2);
	erase();
	
	mvprintw(s.y/2,s.x/3,"%s tus controles son 'a' y 'q'",nombre);
	mvprintw(1+s.y/2,s.x/3,"%s tus controles son las flechas del teclado",nombre2);
	mvprintw(2+s.y/2,s.x/3,"Pulse ENTER para empezar");
	getch();
			
	nodelay(stdscr,1);		
	init_pair(1,COLOR_RED,COLOR_BLACK);
	init_pair(2,COLOR_BLUE,COLOR_BLACK);
	init_pair(3,COLOR_WHITE,COLOR_BLACK);
	goto inicio;

	while (fin != true) {
		cont++;
		system("sleep 0.001");
		if (cont%16==0) {
		if ((b.y==s.y-1)||(b.y==1))
			movver=cbool(movver);
		if (((b.x==s.x-2)||(b.x==2))&&((b.y==b1.y)||(b.y==b1.y+1)||(b.y==b1.y-1)||(b.y==b2.y)||(b.y==b2.y-1)||(b.y==b2.y+1))){
			movhor=cbool(movhor);
			if ((b.y==b1.y-1)||(b.y==b2.y-1)) movver=false;
			if ((b.y==b1.y+1)||(b.y==b2.y+1)) movver=true;
		}
		if ((b.x==s.x)||(b.x<=1)) { inicio: 
			b1.c=(b.x<=1)?b1.c+1: b1.c; 
			b2.c=(b.x>=s.x)?b2.c+1: b2.c;
			b.y=s.y/2; b.x=s.x/2; 
			movver=cbool(movver); movhor=cbool(movhor);
		}
		b.x=(movhor==true) ? b.x+1 : b.x-1;
		b.y=(movver==true) ? b.y+1 : b.y-1;

		if (b1.y<=1) b1.y=s.y-2;
		if (b1.y>=s.y-1) b1.y=2;
		if (b2.y<=1) b2.y=s.y-2; 
		if (b2.y>=s.y-1) b2.y=2;
		}
		fflush(stdin);			//limpia el buffer de la entrada estandar(teclado)
		control=getch();		// Control
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
		
		mvprintw(2,s.x/6,"%s : %i",nombre,b1.c);
		mvprintw(2,4*s.x/5,"%i : %s",b2.c,nombre2);
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
