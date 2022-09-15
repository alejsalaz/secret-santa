# Amigo Secreto API

Esta es una API para organizar un juego de amigo secreto con todos los empleados de una empresa que contiene diferentes departamentos. El juego se puede organizar por adelantado para un año diferente al actual y tiene en cuenta si un empleado no consigue jugar en un año para que pueda jugar en el año que sigue.

## Endpoints

| Verbo | URI          | Controlador | Acción | Parámetros          | Retorno exitoso                                                                                                   | Retorno fallido        |
| ----- | ------------ | ----------- | ------ | ------------------- | ----------------------------------------------------------------------------------------------------------------- | ---------------------- |
| GET   | /employees   | Employees   | Index  |                     | Data: {id, name, department_name, creation_year}                                                                  |                        |
| POST  | /employees   | Employees   | Create | Name, department_id | Data: {id, name, department_name, creation_year}                                                                  | Error: {message, code} |
| GET   | /departments | Departments | Index  |                     | Data: {id, name}                                                                                                  |                        |
| POST  | /departments | Departments | Create | Name                | Data: {name}                                                                                                      | Error: {message, code} |
| GET   | /games       | Games       | Index  |                     |                                                                                                                   |                        |
| POST  | /games       | Games       | Create | Creation_year       | Data: {creation_year, couple: {first_employee_id, first_employee_name, second_employee_id, second_employee_name}} | Error: {message, code} |
