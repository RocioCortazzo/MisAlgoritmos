// Sofka tiene una vinería, vende vinos solo a los mayores de edad,
// y vende dos tipos de vinos, uno de mora y otro de manzana,
// el precio actual de los vinos de manzanas es de $100.000 y
// de los vinos mora $50.000. Se requiere construir el sistema de ventas de la vinería,
// tenga en cuenta la edad del cliente para determinar si le puede vender.
// Además se desea que, a los clientes que compran más vinos de manzana,
// que de mora, les aparezca un mensaje así:
// "Eres un obsesionado con nuestro vinos de manzana-> Manzanero",
// si compra más vino de mora que de manzana así:
// "Eres un obsesionado con nuestros vinos de mora-> Morero",
// el sistema debe poder recibir la cantidad de dinero que entregó el cliente,
// en caso de haber entregado más dinero de lo que se esperaba el sistema
// debe dar las gracias por la propina, pero si el cliente pagó menos,
// el sistema debe notificarle cuanto queda debiendo.


// Entrada: edad, cantidadMora, cantidadManzana, montoPagado
// Proceso:
//	1. Si es mayor de edad, le dejamos comprar
//	   Sino, no le dejamos comprar ("No está permitida la venta de alcohol a menores de edad.").
//	2. Si compra más de manzana, entonces le decimos "Eres un obsesionado con nuestro vinos de manzana-> Manzanero"
//		Si compra iguales cantidades, le decimos "Eres un morero y manzanero"
//		Sino, le decimos "Eres un obsesionado con nuestros vinos de mora-> Morero"
//	3. Si paga más de lo que debería, le decimos "Gracias por la propina"
//		Si paga la cantidad justa, le decimos "Gracias por tu compra"
//      Sino, le decimos "Quedaste debiendo x cantidad de dinero"
//	4. cantidadMora * 50000 + cantidadManzana * 100000
//	5. totalPagar - montoPagado
// Salida: 
//	1. "No está permitida la venta de alcohol a menores de edad."
//	2. "Eres un obsesionado con nuestro vinos de manzana -> Manzanero"
//  3. "Eres morero y manzanero"
//  4. "Eres un obsesionado con nuestros vinos de mora-> Morero"
//  5. "Gracias por la propina"
//  6. "Gracias por tu compra"
//  7. "Quedaste debiendo x cantidad de dinero"

Algoritmo VineriaSofka
	Definir edad, cantidadMora, cantidadManzana, totalPagar Como Entero;
	Definir montoPagado Como Real;
	
	Escribir "============ BIENVENID@ A LA VINERÍA DE SOFKA ============";
	esperarTec();
	
	edad = leerEntero("Ingresa tu edad, por favor: ");
	Borrar Pantalla;

	Si edad >= 18 Entonces
		Escribir "Tenemos la siguiente carta de vinos: ";
		Escribir "1. Vino de manzana: $100.000";
		Escribir "2. Vino de mora: $50.000";
		esperarTec();

		cantidadMora = leerEntero("Ingresa la cantidad de vino de mora que quieres comprar: ");
		cantidadManzana = leerEntero("Ingresa la cantidad de vino de manzana que quieres comprar: ");

		Borrar Pantalla;
		
		totalPagar = calcularTotalPagar(cantidadManzana, cantidadMora);
		
		Escribir "El total a pagar es: $", totalPagar, ", ingresa la cantidad de dinero con la que vas a pagar: ";
		Leer montoPagado;
		Borrar Pantalla;
		Si cantidadManzana > cantidadMora Entonces
			Escribir "Eres un obsesionado con nuestro vinos de manzana -> Manzanero";
		SiNo
			Si cantidadManzana == cantidadMora Entonces
				Escribir "Eres morero y manzanero";
			SiNo
				Escribir "Eres un obsesionado con nuestros vinos de mora -> Morero";
			FinSi
		FinSi
		
		Si montoPagado > totalPagar Entonces
			Escribir "Gracias por la propina";
		SiNo
			Si montoPagado == totalPagar Entonces
				Escribir "Gracias por tu compra";
			SiNo
				Escribir "Quedaste debiendo: $", totalPagar - montoPagado;
			FinSi
		FinSi
	SiNo
		Escribir "No está permitida la venta de alcohol a menores de edad.";
	FinSi
FinAlgoritmo

Funcion esperarTec
	Escribir "Presiona cualquier tecla para continuar...";
	Esperar Tecla;
	Borrar Pantalla;
Fin Funcion

Funcion total = calcularTotalPagar(cantidadManzana, cantidadMora)
	Definir total Como Entero;
	total = cantidadMora * 50000 + cantidadManzana * 100000;
FinFuncion

Funcion number = leerEntero ( mensaje )
	Definir number Como Entero;
	Borrar Pantalla;
	Escribir mensaje;
	Leer number;
FinFuncion
	