USE seminar1;
SELECT name_student FROM students
GROUP BY name_student
HAVING name_student IN ('Миша', 'Маша');


SELECT name_student FROM students;