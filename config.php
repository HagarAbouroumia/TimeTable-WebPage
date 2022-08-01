<?php
include "server.php";

$aResult = array();
$flag = $_GET['flag'];
if ($flag == 1) {
    $query = "SELECT DISTINCT C.course_name, C.course_description, D.department_name, P.professor_name FROM course C,professor P,department D
 WHERE C.department_id = D.department_id && C.professor_id = P.professor_id";
} else {
    $q = $_GET['q'];
    $query = "SELECT DISTINCT c.course_name, c.course_description, p.professor_name, d.department_name
FROM course c,
     professor p,
     department d
WHERE (c.professor_id = p.professor_id  && c.department_id = d.department_id) && (  REPLACE(c.course_name, ' ', '') like  '%" . $q . "%' or REPLACE(c.course_description, ' ', '') like '%" . $q . "%'
    or REPLACE(p.professor_name, ' ', '') like '%" . $q . "%' or REPLACE(d.department_name, ' ', '') like '%" . $q . "%')";
}


$result = mysqli_query($conn, $query);

while ($row = mysqli_fetch_array($result)) {
    $course_name = $row['course_name'];
    $course_description = $row['course_description'];
    $department_name = $row['department_name'];
    $professor_name = $row['professor_name'];
    $aResult[] = array(
        "course_name" => $course_name,
        "course_description" => $course_description,
        "department_name" => $department_name,
        "professor_name" => $professor_name
    );
}
echo json_encode($aResult);
exit;

?>