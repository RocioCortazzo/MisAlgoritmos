Algoritmo TiendaJC
	Definir opc, cantidades, cantidadProductos, productoSeleccionado Como Entero;
	Definir nombres Como Caracter;
	Definir precios Como Real;
	Definir sonActivos Como Logico;
	
	Definir cantidad, eleccion Como Entero;
	Definir precio Como Real;
	Definir nombre Como Caracter;
	
	Definir i Como Entero;
	
	Dimension cantidades[100], nombres[100], precios[100], sonActivos[100];
	cantidadProductos = 0;

	Repetir
		opc = leerOpcion();
		
		Segun opc Hacer
			1:
				Borrar Pantalla;
				Escribir "Ingresa el nombre del producto #", cantidadProductos + 1, ": ";
				Leer nombre;
				Escribir "Ingresa el precio de ", nombre, ": ";
				Leer precio;
				Escribir "Ingresa la cantidad de ", nombre, ": ";
				Leer cantidad;
				
				Borrar Pantalla;
				Escribir "¿Estás segur@ de querer ingresar este producto?";
				Escribir "===============================";
				Escribir "Nombre: ", nombre;
				Escribir "Cantidad: ", cantidad;
				Escribir "Precio: ", precio;
				Escribir "===============================";
				Escribir "1. Sí.";
				Escribir "2. No.";
				Leer eleccion;
				
				Si eleccion == 1 Entonces
					nombres[cantidadProductos] = nombre;
					cantidades[cantidadProductos] = cantidad;
					precios[cantidadProductos] = precio;
					sonActivos[cantidadProductos] = Verdadero;
					cantidadProductos = cantidadProductos + 1;
					Borrar Pantalla;
					Escribir "El producto se agregó exitosamente...";
					Esperar 5 segundos;
				FinSi
			2:
				mostrarProductos(cantidades, nombres, precios, cantidadProductos, sonActivos);
				Borrar Pantalla;
				Escribir "Ingresa el número del producto que deseas actualizar: ";
				Leer productoSeleccionado;
				Borrar Pantalla;
				Escribir "Este es el producto seleccionado, ¿estás seguro de querer actualizarlo?";
				Escribir "===============================";
				Escribir "Producto #", productoSeleccionado;
				Escribir "Nombre: ", nombres[productoSeleccionado - 1];
				Escribir "Precio: ", precios[productoSeleccionado - 1];
				Escribir "Cantidad: ", cantidades[productoSeleccionado - 1];
				Escribir "===============================";
				Escribir "1. Sí.";
				Escribir "2. No.";
				Leer eleccion;
				Borrar Pantalla;
				Si eleccion == 1 Entonces
					Escribir "Ingresa le nueva cantidad de ", nombres[productoSeleccionado - 1];
					Leer cantidad;
					cantidades[productoSeleccionado - 1] = cantidad;
					Escribir "El producto se actualizó exitosamente...";
					Esperar 5 segundos;
				FinSi
			3:
				calcularValorPagar(cantidades, nombres, precios, cantidadProductos, sonActivos);
			4:
				mostrarProductos(cantidades, nombres, precios, cantidadProductos, sonActivos);
			5:
				mostrarProductos(cantidades, nombres, precios, cantidadProductos, sonActivos);
				Borrar Pantalla;
				Escribir "Ingresa el número del producto que deseas eliminar: ";
				Leer productoSeleccionado;
				Borrar Pantalla;
				Escribir "Este es el producto seleccionado, ¿estás seguro de querer eliminarlo?";
				Escribir "===============================";
				Escribir "Producto #", productoSeleccionado;
				Escribir "Nombre: ", nombres[productoSeleccionado - 1];
				Escribir "Precio: ", precios[productoSeleccionado - 1];
				Escribir "Cantidad: ", cantidades[productoSeleccionado - 1];
				Escribir "===============================";
				Escribir "1. Sí.";
				Escribir "2. No.";
				Leer eleccion;
				Borrar Pantalla;
				Si eleccion == 1 Entonces
					sonActivos[productoSeleccionado - 1] = Falso;
					Escribir "El producto se eliminó exitosamente...";
					Esperar 5 segundos;
				FinSi
			De Otro Modo:
				Borrar Pantalla;
				Escribir "¡Gracias por visitarnos, vuelva pronto!";
				Esperar 5 segundos;
		Fin Segun
	Hasta Que opc == 6
FinAlgoritmo

Funcion mostrarMenu
	Borrar Pantalla;
	Escribir "============= ¡BIENVENID@ A JC =============";
	Escribir "";
	Escribir "Ingresa el número de la operación que quieres";
	Escribir "realizar: ";
	Escribir "';
	Escribir "1. Agregar producto.";
	Escribir "2. Actualizar cantidad del producto";
	Escribir "3. Ver el total a pagar.";
	Escribir "4. Mostrar todos los productos.";
	Escribir "5. Eliminar un producto.";
	Escribir "6. Salir.";
FinFuncion

Funcion opc = leerOpcion
	Definir opc Como Entero;
	
	Repetir
		mostrarMenu();
		Leer opc;
		
		Si opc < 1 | opc > 6 Entonces
			Borrar Pantalla;
			Escribir "La opción debe estar entre 1 y 6.";
			Escribir "Presiona cualquier tecla para volver a intentarlo...";
			Esperar Tecla;
		FinSi
	Hasta Que opc >= 1 & opc <= 6
FinFuncion

Funcion mostrarProductos(cantidades, nombres, precios, cantidadProductos, sonActivos)
	Definir i Como Entero;
	Borrar Pantalla;
	Escribir "Los productos que has agregado al carrito son: ";
	Para i = 0 Hasta cantidadProductos - 1 Hacer
		Si sonActivos[i] Entonces
			Escribir "=====================";
			Escribir "Producto #", i + 1;
			Escribir "Nombre: ", nombres[i];
			Escribir "Precio: ", precios[i];
			Escribir "Cantidad: ", cantidades[i];
		FinSi
	Fin Para
	Escribir "=====================";
	Escribir "Presiona cualquier tecla para continuar...";
	Esperar Tecla;
FinFuncion

Funcion calcularValorPagar(cantidades, nombres, precios, cantidadProductos, sonActivos)
	Definir i Como Entero;
	Definir valorUnitario, valorTotal Como Real;
	valorTotal = 0;
	Borrar Pantalla;
	Para i = 0 Hasta cantidadProductos - 1 Hacer
		Si sonActivos[i] Entonces
			valorUnitario = precios[i] * cantidades[i];
			valorTotal = valorTotal + valorUnitario;
			Escribir "=====================";
			Escribir "Producto #", i + 1;
			Escribir "Nombre: ", nombres[i];
			Escribir "valor a pagar por este producto: $", valorUnitario;
		FinSi
	Fin Para
	Escribir "=====================";
	Escribir "Total a pagar: $", valorTotal;
	Escribir "=====================";
	Escribir "Presiona cualquier tecla para continuar...";
	Esperar Tecla;
FinFuncion
	