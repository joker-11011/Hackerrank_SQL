SELECT si.roll_number, si.name
FROM student_information si
JOIN examination_marks em ON si.roll_number = em.roll_number
GROUP BY si.roll_number, si.name
HAVING SUM(em.marks) < 100;
