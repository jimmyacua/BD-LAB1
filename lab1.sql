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
select e.NombreP, e.Apellido1, e.Apellido2, e.Cedula, c.Sigla
from Curso c, estudiante e join Asistente a on e.Cedula = a.Cedula join Grupo g on g.CedAsist = e.Cedula
 where c.Sigla = g.SiglaCurso;

--g:
select max(l.Nota), min(l.Nota), AVG(l.nota)
from Lleva l
where l.SiglaCurso = 'CI1312';

--h:
select count(*)
from estudiante;

--i:
select g.SiglaCurso, g.NumGrupo, g.Semestre, g.Anno, p.NombreP, p.Apellido1, p.Apellido2, p.Cedula
from Grupo g join Profesor p on g.CedProf = p.Cedula;

--en caso de que haya un curso sin profesor:
select g.SiglaCurso, g.NumGrupo, g.Semestre, g.Anno, p.NombreP, p.Apellido1, p.Apellido2, p.Cedula
from Grupo g left outer join Profesor p on g.CedProf = p.Cedula;

--j:
select c.Sigla, c.Nombre
from Curso c
where c.Sigla like 'ci%';

--usando intersect;
select c.Sigla, c.Nombre
from Curso c
intersect(
		  select c1.Sigla, c1.Nombre
		  from Curso c1
		 where c1.Sigla like 'ci%'
);

--k:
select e.Apellido1
from estudiante e
-- k yk1:
where e.Apellido1 like '%ez' or e.Apellido1 like 'M%';
--k2: (descomentar para usar y comentar la línea de arriba)
--where e.Apellido1 like 'M%ez';

--l:
select e.NombreP
from estudiante e
where len(e.NombreP) = 6

--usando except:
select e.NombreP
from estudiante e
except(
	   select e1.NombreP
	   from estudiante e1
	   where len(e1.NombreP) != 6
);

--m:
select avg(l.Nota)
from estudiante e join Lleva l on l.CedEstudiante = e.Cedula
where e.Cedula = '55112233';

--n:
select DISTINCT p.NombreP, p.Apellido1, p.Apellido2
from Profesor p
where p.Sexo = 'M'
UNION
(select distinct e.NombreP, e.Apellido1, e.Apellido2
 from estudiante e
 where e.Sexo = 'M');

 --o:
 select e.Carne, e.NombreP, e.Apellido1, e.Apellido2
 from estudiante e join Lleva l on e.Cedula = l.CedEstudiante
 where l.SiglaCurso ='CI1312' and l.Nota = '65';


--p:
select c.Nombre
 from Carrera c
 where not exists (
					select *
					from Empadronado_en
					where Empadronado_en.CodCarrera = c.Codigo
					);

