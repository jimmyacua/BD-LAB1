use BD_Universidad;

-- comentario de una linea
/*
* comentario en bloque
*/

--seleccionar la parte del codigo que se quiere correr.


SELECT * 
from estudiante join Empadronado_en on estudiante.Cedula = Empadronado_en.CedEstudiante
order by estudiante.Cedula ;
--where Teléfono is NULL; -- NUNCA usar un "=" para comparar con NULL


 select*
 from estudiante left join Empadronado_en on estudiante.Cedula = Empadronado_en.CedEstudiante
 where Empadronado_en.CodCarrera is NUll
 order by estudiante.Cedula;

-- para la primer pregunta de la compr de lectura (en esta bd todos los estudiantes están matriculados en una carrera)
select*
 from estudiante e
 where not exists ( -- es como un for: pasa por cada tupla de estudiante y revisa si estaá empadronado
					select *
					from Empadronado_en
					where Empadronado_en.CedEstudiante = e.Cedula
					);


--otra forma: usando conjuntos

select e.Cedula
from estudiante e
except 
select em.CedEstudiante
from Empadronado_en em

-- INCIA LAB 1

--a:
select p.NombreP, p.Apellido1, p.Apellido2, p.Titulo, p.Categoria
from Profesor p 

--b:
select e.Cedula, e.NombreP, e.Apellido1, e.Apellido2, l.Nota
from estudiante e join Lleva l on e.Cedula  = l.CedEstudiante 
where l.SiglaCurso = 'CI1312';

--c:
select e.Carne, e.NombreP, e.Apellido1, e.Apellido2
from estudiante e join Lleva l on e.Cedula = l.CedEstudiante
where (l.Nota between 70 and 95);
-- para eviar repetidos:
select distinct e.Carne, e.NombreP, e.Apellido1, e.Apellido2
from estudiante e join Lleva l on e.Cedula = l.CedEstudiante
where (l.Nota between 70 and 95);

--d:
select c.Sigla
from Curso c join Requiere_De rd on c.Sigla = rd.SiglaCursoRequeridor
where  rd.SiglaCursoRequisito = 'CI1312';


--e:
select c.Sigla
from Curso c join Requiere_De rd on c.Sigla = rd.SiglaCursoRequisito
where  rd.SiglaCursoRequeridor = 'CI1312';

--f:
select e.NombreP, e.Apellido1, e.Apellido2, e.Cedula
from estudiante e join Asistente a on e.Cedula = a.Cedula join Grupo g on g.CedAsist = e.Cedula;

--g: