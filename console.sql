USE quanlysinhvien;
SELECT * FROM subject;
# Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM subject WHERE Credit = (SELECT MAX(Credit) FROM subject);

# Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT subject.* FROM subject JOIN mark ON subject.SubID = mark.SubID
WHERE Mark >= ALL (SELECT Mark FROM mark);

# Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT student.* , AVG(Mark) FROM student JOIN mark ON student.StudentID = mark.StudentID
GROUP BY student.StudentID
ORDER BY AVG(Mark) DESC ;