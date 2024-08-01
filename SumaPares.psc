
Algoritmo sin_titulo
	Definir numeroIngresado, suma, i Como Entero;
	numeroIngresado = leerNumero();
	suma = sumarPares(numeroIngresado);
	Borrar Pantalla;
	Escribir "Esta es la suma total de los números pares que hay desde 0 hasta el número que ingresaste: ", suma;
FinAlgoritmo

Funcion suma = sumarPares ( numeroIngresado )
	Definir suma, i Como Entero;

	suma = 0;

	Para i = 0 Hasta numeroIngresado Hacer
		Si i % 2 == 0 Entonces
			suma = suma + i;
		FinSi
	Fin Para
FinFuncion

Funcion numeroIngresado = leerNumero
	Definir numeroIngresado Como Entero;

	Repetir
		Borrar Pantalla;
		Escribir "Por favor, ingresa un número: ";
		Leer numeroIngresado;
		Si numeroIngresado <= 0 Entonces
			Borrar Pantalla;
			Escribir "El número ingresado debe ser mayor que 0.";
			Escribir "Presiona cualquier tecla para continuar...";
			Esperar Tecla;
		FinSi
	Hasta Que numeroIngresado > 0
FinFuncion
