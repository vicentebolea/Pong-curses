//Pong1.0 solo para linux
//Hecho por Tito 
//Utilizo la libreria ncurses y stdbool para las variables booleanas
//los controles son los cursores de izq y drch y arriba para cerrar el juego
//Para compilar "gcc pong.c -lncurses -o pong" en caso de que no tengais ncurses "sudo apt-get install ncurses"
//Si quereis modificarlo hacerlo en una copia en vuestro pc
#include <ncurses.h>
#include <stdlib.h>
#include <stdbool.h>
void main() {
	int x = 20; int bx = 19; int control;
	int y = 30; int by = 30; int cont = 0;
	 
	bool fin = false; bool primer = false; bool segun = false; bool tercer = false; bool cuarto = false;
	
	initscr(); 					//inciar la ventana
	start_color(); 					//sin comentarios
	keypad(stdscr, true); 				//activar teclas especiales como cursores...
	noecho(); 					//Quitar el eco de las instrucciones
	curs_set(0); 					//Ni papa
	nodelay(stdscr,1); 				//Que no espere en el getch (no veas como me comi el coco con eso)

	init_pair(1,COLOR_RED,COLOR_BLACK); 		//Establezco los colores a usar
	init_pair(2,COLOR_BLUE,COLOR_BLACK);
	init_pair(3,COLOR_WHITE,COLOR_BLACK);
		tercer = true;				//Empieza el movimiento
		segun = true;
	while (fin != true) { 				// Comienzo
		cont++;
		system("sleep 0.025");			//Tiempo de cada ciclo
		if (cont%8==0) { 			//Esto es para regular la velocidad de juego
		if (by==59) {				//Reglas de la partida, rebotes
			cuarto = true; segun = false;
			if (bx==1) {
			tercer = false; primer = true;
			}
		}
		if (by==1) {
			segun = true; cuarto = false;
			if (bx==1) {
			tercer = false; primer = true;
			}
		}
		if (bx==1){
			primer = true; tercer =false;
		}
		if ((bx == 20) && ((by == y) || (by==y+1) || (by==y-1))) { //Si toca con la bandeja 
			primer = false; tercer = true;
			}
			else if (bx==20) {
				
				fin = true;
			}
		
		if (primer == true){
			bx++;
		}
		if (segun == true){
			by++;
		}		
		if (tercer == true){
			bx--;
		}
		if (cuarto == true){
			by--;
		}
		if (y==1)
			y=58;
		if (y==59)
			y=2;
		}
		control = getch();		// Control
		switch (control) {
			
			case KEY_RIGHT:
				y++;
				break;
			case KEY_LEFT:
				y--;
				break;
			case KEY_UP:
				fin = true;
				break;
			default:
				break;
		}
		erase();			//Borra la pantalla para el refresco	
		
		attron(COLOR_PAIR(3));		//Movimiento de la bandeja
		mvprintw(x,y-1,"___");
		attroff(COLOR_PAIR(3));
		refresh();
									
		move(bx,by);			//Movimiento de la bola
		attron(COLOR_PAIR(1));
		printw("o");
		attroff(COLOR_PAIR(1));
		refresh();
		
		move(0,0);
		printw("*");			//Cuadro de juego
		hline(ACS_HLINE, 60);
		move(1,0);		
		vline(ACS_VLINE, 20);
		move(1,60);
		vline(ACS_VLINE, 20);
		move(21,1);
		hline(ACS_HLINE, 60);
		mvprintw(0,60,"*");
		mvprintw(21,0,"*");
		mvprintw(21,60,"*");
		
		mvprintw(2,41,"bx:%i by:%i",bx,by); //Algunas letritas
		mvprintw(3,41,"x:%i y:%i",x,y);
		mvprintw(4,43,"tiempo: %i",cont);
		attron(COLOR_PAIR(2));
		mvprintw(5,41,"PINGPONG");
		attroff(COLOR_PAIR(2));
		refresh();
		fflush(stdin);
	}
	erase();
	refresh();
        getch();
	system("sleep 1");
        endwin();
}

