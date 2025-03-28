// Actividad1A.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "io.h"

int main(int argc, char* argv[])
{
	FILE * pArchivo;

	printf("Ejemplo de escritura de tres registros en archivo secuencial\n");
	
	pArchivo = fopen("CLIENTES.TXT", "w");
	if (pArchivo)
	{
		//Primer cliente:
		fprintf(pArchivo, "%s\n", "Juan Martínez");
		fprintf(pArchivo, "%s\n", "Calle del Pez, 5");
		fprintf(pArchivo, "%s\n", "Madrid");
		fprintf(pArchivo, "%s\n", "<FIN>");

		//Segundo cliente:
		fprintf(pArchivo, "%s\n", "Comercial Martínez");
		fprintf(pArchivo, "%s\n", "Calle de la Cuesta, 10");
		fprintf(pArchivo, "%s\n", "Sevilla");
		fprintf(pArchivo, "%s\n", "<FIN>");

		//Tercer cliente:
		fprintf(pArchivo, "%s\n", "José Sánchez");
		fprintf(pArchivo, "%s\n", "Calle Mayor, 7");
		fprintf(pArchivo, "%s\n", "Salamanca");
		fprintf(pArchivo, "%s\n", "<FIN>");

		//Cerrar el archivo:
		fclose(pArchivo);

		printf("%s\n", "3 registros escritos.");
	}
	else
	{
		printf("%s\n","No se ha podido abrir el archivo para escritura.");
	}

	printf("%s\n", "Final de programa");

	return 0;
}

