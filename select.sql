# 1.Query the existence of 1 course
select * from course where name = 'Language';

# 2.Query the presence of both 1 and 2 courses
select * from course where name = 'Language' or name = 'Math';

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select studentid,student.name,studentavg from student right join  (select studentid,AVG(score) as studentavg from student_course  group by studentid having studentavg>=60) as c
 on student.id =c.studentid;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student left join student_course on student.id=student_course.studentid where student_course.score is null;

# 5.Query all SQL with grades
select * from student left join student_course on student.id=student_course.studentid where student_course.score is not null;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student left join student_course on student.id=student_course.studentid where student.id = 1 and student_course.courseid = 2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select b.score from (select * from (select * from student_course order by score asc)as a where courseid  = 2) as b where b.score <  60;  

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseid ,AVG(score) as courseavg from student_course group by courseid order by courseavg asc,courseid desc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name,a.score from student left join  (select * from student_course left join course on student_course.courseid = course.id where course.name ='Math') as a on a.studentid = student.id where a.score <60;
