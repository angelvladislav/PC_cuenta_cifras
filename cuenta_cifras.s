# /*
# Enunciado:
# Realizar un programa que cuente el número de veces que aparece un dígito en
# un número entero positivo.

# Por ejemplo si el usuario introduce como numero el valor 12242 y como dígito el valor 2,
# debe imprimir por la pantalla el número 3 (que es las veces que aparece 2 en 12242).

# Los pasos a seguir deben ser:

# 1) Imprimir título
# 2) Pedir un número
# 3) Si el número es negativo salir del programa
# 4) Pedir un dígito. Si está fuera del rango de 0 a 9, volver a preguntar
# 5) Hace bucle que vaya obteniendo el dígito de las unidades, decenas, centenas.
#   Si coincide con el buscado, incrementar contador
# 6) Mostrar por pantalla el contador con mensaje adecuado
# 7) Volver al punto 2
# 8) Terminar el programa con un mensaje de despedida.

# */

# #include <iostream>
# int main() {
#   std::cout << "\nPrograma que cuenta el numero de veces que aparece un digito en numero entero positivo.\n";

#   while (true) {
#     int numero;
#     std::cout << "\nIntroduzca un numero entero positivo (negativo para finalizar el programa): ";
#     std::cin >> numero;
#     if (numero < 0)
#       break;

#     int digito;
#     do {
#       std::cout << "Introduzca un digito (0-9): ";
#       std::cin >> digito;
#     } while ((digito < 0) || (digito > 9));
#     int cuenta = 0;
#     do {
#       int resto = numero % 10;
#       numero /= 10;
#       if ( resto == digito )
#         cuenta++;
#     } while ( numero != 0 );
#     std::cout << "El numero de veces que aparece el digito en el numero es: "
#         << cuenta << '\n';
#   }
#   std::cout << "\nFin del programa.\n";
# }

        .data
strTitulo:      .asciiz "\nPrograma que cuenta el numero de veces que aparece un digito en numero entero positivo.\n"
strIntroNum:    .asciiz "\nIntroduzca un numero entero positivo (negativo para finalizar el programa): "
strIntroDig:    .asciiz "Introduzca un digito (0-9): "
strElNumero:    .asciiz "El numero de veces que aparece el digito en el numero es: "
strFin:         .asciiz "\nFin del programa.\n"

        .text
#################################################
# Tabla de relacion entre variables y registros
# numero -> $s8
# digito -> $s1
# cuenta -> $t0
# resto -> $t1

# int main() {
main:

#   std::cout << "\nPrograma que cuenta el numero de veces que aparece un digito en numero entero positivo.\n";
    li      $v0, 4
    la      $a0, strTitulo
    syscall

#   while (true) {
whileTrue:
        #condicion siempre se cumple no hace falta ninguna instruccion
#     int numero;

#     std::cout << "\nIntroduzca un numero entero positivo (negativo para finalizar el programa): ";
    li      $v0, 4
    la      $a0, strIntroNum
    syscall

#     std::cin >> numero;
    li      $v0, 5
    syscall
    move    $s0,$v0
#     if (numero < 0)
ifNumero0:
    bltz    $s0, ifNumero0_then
    b		ifNumero0_fin 			# branch to ifNumero0_fin 
ifNumero0_then:
#       break;
ifNumero0_fin:
#     int digito;
#     do {
#       std::cout << "Introduzca un digito (0-9): ";
#       std::cin >> digito;
#     } while ((digito < 0) || (digito > 9));
#     int cuenta = 0;
#     do {
#       int resto = numero % 10;
#       numero /= 10;
#       if ( resto == digito )
#         cuenta++;
#     } while ( numero != 0 );
#     std::cout << "El numero de veces que aparece el digito en el numero es: "
#         << cuenta << '\n';
#   }
    b		whileTrue			# branch to whileTrue
    
whileTrue_fin:

#   std::cout << "\nFin del programa.\n";
    li $v0, 4
    la $a0, strFin
    syscall
# }
    li $v0, 10
    syscall

