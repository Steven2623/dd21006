# Fundamentos del Lenguaje Ensamblador en Sistemas GNU/Linux

## Objetivo
Aplicar los conocimientos obtenidos sobre los Fundamentos del Lenguaje Ensamblador en Sistemas GNU/Linux para elaborar programas en ensamblador.

## Instrucciones
Tomando como ejemplo el ejercicio desarrollado en el video anterior, realice los siguientes ejercicios:

### 1. Resta de tres enteros
- Programa para restar tres enteros utilizando solo registros de 16 bits.

### 2. Multiplicación
- Programa para multiplicar dos números enteros usando registros de 8 bits.

### 3. División
- Programa para dividir dos números enteros usando registros de 32 bits.

---

## Archivos incluidos

- `resta.asm` — Código para la resta de tres enteros con registros de 16 bits.
- `multiplicacion.asm` — Código para la multiplicación de dos enteros con registros de 8 bits.
- `division.asm` — Código para la división de dos enteros con registros de 32 bits.

---

## Cómo compilar y ejecutar

Para compilar y ejecutar cualquiera de los programas, puedes usar los siguientes comandos:

```bash
nasm -f elf32 nombre_del_programa.asm -o nombre_del_programa.o
ld -m elf_i386 nombre_del_programa.o -o nombre_del_programa
./nombre_del_programa
