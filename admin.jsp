<!DOCTYPE>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <head>
        <meta name="viewport" content="width=device-width initial-scale=1">
        <title>Administrator</title>
        <meta charset="UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            nav{
                padding:10px;
                position:sticky;
                top:0;
            }
            .navbar-text {
                cursor: pointer;
                color: white !important;
            }
            .nav-link {
                color: white !important;
            }
            .navbar-brand {
                cursor: default;
                color:#e6e6e6 !important;
                font-weight: 900;
            }
            .dropdown {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .form-select {
                width: 50%;
                text-align: center;
            }
            .view-application{
                background-color: #533b78;
                color:white;
                border:none;
            }
            /* Updated styles for the filter dropdown */
            .filter-dropdown-div {
                position: fixed;
                /* top: 20px; */
                /* right: 20px; */
                /* background-color: #fff; */
                background-color: rgba(0,0,0,0.8);
                /* padding: 20px; */
                /* border-radius: 10px; */
                /* box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); */
                display: none;
                z-index: 1000;
                /* max-width: 400px; */
                width: 100%;
                text-align: center;
                top:0;
                bottom:0;
                left:0;
                right:0;
                text-align:center !important;
            }
            .filter-dropdown{
                position:relative;
                top:10%;
                left:35%;
                background-color: #fff;
                padding:20px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                max-width: 400px;
                border-radius: 10px;
            }

            /* Center the filter icon horizontally */
            .filter-icon.third-column {
                right: 20px;
                /* Adjust the right position according to your needs */
                top: 20px;
                font-size: 1.5em;
                z-index: 1000;
            }

            /* Additional styles for the filter icon */
            .filter-icon {
                cursor: pointer;
                /* position: fixed; */
                top: 20px;
                font-size: 1.5em;
                z-index: 1000;
            }
            #applyFilters{
                background-color: #533b78;
                color:white;
            }
            #applicationsContainer{
                margin-top:4%;
            }
            #manageInstructorsScreen{
                display:none;
                text-align:center;
            }
            #manageCommitteeScreen{
                display:none;
                text-align:center;
            }
            #manageCoursesScreen{
                display: none;
                text-align:center;
            }
            #CommitteeForm{
                width:50%;
                display:none;
            }
            #addInstructorForm{
                display:none;
                width:50%;
            }
            #courseForm{
                display: none;
                width:50%;
            }
            #instructorsTable{
                width:75%;
                text-align:center !important;
            }
            #committeeTable{
                width:75%;
                text-align:center !important;
            }
            #coursesTable{
                width:75%;
                text-align:center !important;
            }
            #applicationsTable{
                width:100%;
                text-align:center !important;
            }
            .addRemoveButtons{
                margin-bottom:1%;
            }
            table, th{
                border:white 0px solid !important;
            }
            table{
                width:75% !important;
            }
            thead{
                position:sticky;
                top:0;
            }
            .fa-lg{
                line-height: 1.0em !important;
            }
            .my-custom-scrollbar {
                position: relative;
                height: 60%;
                overflow: auto;
            }
            .table-wrapper-scroll-y {
                display: block;
            }
            #updateMsg{
                padding-left:10%;
            }
            #committeeForm{
                display:none;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
            style="background-color:#533b78 !important;color:white !important;padding: 10px 20px;">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#Home" id="home">Home<span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="manageUsers" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            Manage Users
                        </a>
                        <div class="dropdown-menu" aria-labelledby="manageUsers">
                            <a class="dropdown-item" href="#" id="manageTAs">TA's <i class="fa-solid fa-pencil fa-sm"></i></a>
                            <a class="dropdown-item" href="#" id="manageCommittee">Committee <i class="fa-solid fa-pencil fa-sm"></i></a>
                            <a class="dropdown-item" href="#" id="manageInstructors">Instructors <i class="fa-solid fa-pencil fa-sm"></i></a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Courses" id="manageCourses">Courses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#MyList" id="myList">My List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Profile" data-toggle="modal" data-target="#profileModal"
                            id="profileLink"><i class="fa-solid fa-user fa-lg"></i></a>
                    </li>
                </ul>
                <span class="navbar-text">
                    <div onclick="logout()">Logout <i class="fa-solid fa-right-from-bracket"></i>
                    </div>
                </span>
            </div>
        </nav>
        <div id="applicationsContainer">
            <h2 class="text-center">TA Applications</h2>
            <center>
                <div class="table-wrapper-scroll-y my-custom-scrollbar">
                    <table class="table table-striped" id="applicationsTable">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th><i class="filter-icon fas fa-filter third-column" id="filterIcon"></i></th>
                            </tr>
                        </thead>
                        <tbody id="taApplicationsListTableBody"></tbody>
                    </table>
                </div>
            </center>
            <div class="filter-dropdown-div" id="filterDropdown">
                <div class="filter-dropdown third-column" >
                    <div class="mb-3 dropdown">
                        <label for="departmentDropdown" class="form-label">Select Department:</label>
                        <select class="form-select" id="departmentDropdown">
                            <option value="all">All Departments</option>
                        </select>
                    </div>
                    <div class="mb-3 dropdown">
                        <label for="courseDropdown" class="form-label">Select Course:</label>
                        <select class="form-select" id="courseDropdown">
                            <option value="all">All Courses</option>
                        </select>
                    </div>
                    <div class="mb-3 dropdown">
                        <label for="statusDropdown" class="form-label">Select Status:</label>
                        <select class="form-select" id="statusDropdown">
                            <option value="all">All Status</option>
                        </select>
                    </div>
                    <button class="btn " id="applyFilters"><i class="fa-solid fa-rectangle-xmark"></i></button>
                </div>
            </div>
        </div>

        <!-- Profile Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Profile form with editable fields -->
                        <form id="profileForm">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email">
                            </div>
                            <div class="form-group">
                                <label for="znumber">Z Number:</label>
                                <input type="text" class="form-control" id="znumber" placeholder="Enter your Z Number">
                            </div>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <textarea class="form-control" id="address" rows="3"
                                    placeholder="Enter your address"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="saveProfile">Save</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="applicationDetailsModal" tabindex="-1" role="dialog"
            aria-labelledby="applicationDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="applicationDetailsModalLabel">Application Details</h5>
                        <div id="updateMsg"></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="applicationDetailsContent">
                    </div>
                    <div class="modal-footer">
                        <div>
                            <strong>Note:</strong> Recommend the best skill match application for Committee
                        </div>
                        <button type="button" class="btn btn-success" id="recommendApplicationBtn">Recommend</button>
                        <button type="button" class="btn btn-danger" id="undoApplicationBtn">Undo</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="manageInstructorsScreen">
            <div id="content">
                <h2>Manage Instructors</h2>
                <div class="addRemoveButtons">
                    <button type="button" class="btn btn-primary custom-btn" id="showInstructorFormBtn">New Instructor</button>
                    <button type="button" class="btn btn-danger custom-btn" id="removeInstructorsBtn">Remove</button>
                </div>
                <center>
                    <form id="addInstructorForm" name="addInstructorForm" method="POST">
                        <div class="form-group">
                            <!-- <label for="instructorName">Name:</label> -->
                            <input type="text" class="form-control" id="instructorName" name="instructorName" placeholder="Enter new instructor name" required>
                        </div>
                        <div class="form-group">
                            <!-- <label for="instructorName">Name:</label> -->
                            <input type="email" class="form-control" id="instructorEmail" name="instructorEmail" placeholder="Enter instructor Email" required>
                        </div>
                        <div class="form-group">
                            <!-- <label for="instructorName">Name:</label> -->
                            <input type="password" class="form-control" id="instructorPassword" name="instructorPassword" placeholder="Enter password" required>
                        </div>
                        <div class="form-group" >
                            <select class="form-control" id="instructorCourseDropdown" >
                                <option value="0">--- select instructor course ---</option>
                            </select>
                        </div>
                        <button class="btn btn-primary" id="addInstructorbtn">Add</button>
                    </form>
                    <table class="table table-hover" id="instructorsTable">
                        <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Instructor Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Department Name</th>
                            <th scope="col"></th>
                          </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </center>
            </div>
        </div>
        
        <div id="manageCommitteeScreen">
            <div id="content">
                <h2>Manage Committee Members</h2>
                <div class="addRemoveButtons">
                    <button type="button" class="btn btn-primary custom-btn" id="showCommitteeFormBtn">Add New Member</button>
                    <button type="button" class="btn btn-danger custom-btn" id="removeCommitteeBtn">Remove</button>
                </div>
                <center>
                <form id="committeeForm" method="POST" name="committeeForm">
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" id="committeeMemberName" placeholder="Enter Committee Member Name" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" id="committeeMemberEmail" placeholder="Enter Committee Member Email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" id="committeeMemberPassword" placeholder="Enter Committee Member Password" required>
                    </div>
                    <button class="btn btn-primary" id="addCommitteeBtn">Add</button>
                </form>
                <table class="table table-hover" id="committeeTable">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Committee ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                </center>
            </div>
        </div>

        <div id="manageCoursesScreen">
            <h2>Manage Courses</h2>
            <div class="addRemoveButtons">
                <button type="button" class="btn btn-primary custom-btn" id="showCourseFormBtn">Add New Course</button>
                <button type="button" class="btn btn-danger custom-btn" id="removeCourseBtn">Remove</button>
            </div>
            <center>
                <form id="courseForm">
                    <div class="form-group">
                        <input type="text" class="form-control" id="courseNameCourse" placeholder="Enter course name" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="departmentNameCourse" placeholder="Enter department name" required>
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="status" id="status1">
                        <label class="form-check-label" for="status1">
                          Yes
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="status" id="status2" checked>
                        <label class="form-check-label" for="status2">
                          No
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="instructorNameCourse" required>
                    </div>
                    <button class="btn btn-primary" id="addCourseBtn">Add</button>
                </form>
                <table class="table table-hover" id="coursesTable">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Course ID</th>
                    <th scope="col">Course Name</th>
                    <th scope="col">Department Name</th>
                    <th scope="col">Instructor Name</th>
                    <th scope="col">Status</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody></tbody>
                </table>
            </center>
        </div>
        
        
    </body>
    <!-- Add Bootstrap and jQuery JS -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script> -->
    <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <!-- Add JavaScript to handle dropdown changes and filter table -->
    <script>
        $(document).ready(function () {

            var presentApplication = null;

            var courseList = [];
            <c:forEach items="${courseList}" var="course">
                var course = {};
                course["id"]="${course.courseId}";
                course["courseName"]="${course.courseName}";
                course["departmentId"]="${course.departmentId}";
                course["departmentName"]="${course.departmentName}";
                course["status"]="${course.status}";
                course["instructorName"]="${course.instructorName}";
                courseList.push(course);
            </c:forEach>
            console.log(courseList);

            var departmentNamesList = [];
            var departmentList =[];
            <c:forEach items="${departmentList}" var="dept">
                var departmentObj = {};
                departmentNamesList.push("${dept.departmentName}");
                departmentObj["departmentId"]="${dept.departmentId}";
                departmentObj["departmentName"] = "${dept.departmentName}";
                departmentList.push(departmentObj);
                </c:forEach>
            console.log(departmentNamesList);

            var instructorsList = [];
            <c:forEach items="${instructorsList}" var="instructor">
                var instructor = {};
                instructor["id"]="${instructor.id}";
                instructor["departmentName"]="${instructor.departmentName}";
                instructor["courseName"]="${instructor.courseName}";
                instructor["instructorName"]="${instructor.instructorName}";
                instructor["email"]="${instructor.email}";
                instructorsList.push(instructor);
            </c:forEach>
            console.log(instructorsList);

            var committeeList = [];
            <c:forEach items="${committeeList}" var="committee">
                var committeeObj = {};
                committeeObj["id"]="${committee.id}";
                committeeObj["name"]="${committee.name}";
                committeeObj["email"]="${committee.email}";
                committeeList.push(committeeObj);
            </c:forEach>
            console.log(committeeList);

            var taApplicationsList = [];
            <c:forEach items="${applicationsList}" var="app">
                var application = {};
                application["name"]="${app.firstname} ${app.lastname}";
                application["email"]="${app.email}";
                application["status"]="${app.status}";
                application["applicationId"]="${app.taApplicationId}";
                application["instructorFeedbackExists"]="${app.instructorFeedbackExists}";
                application["instructorFeedbackName"]="${app.instructorFeedbackName}";
                application["instructorFeedbackCourseName"]="${app.instructorFeedbackCourseName}";
                application["performanceRating"]="${app.performanceRating}";
                application["technicalSkillRating"]="${app.technicalSkillRating}";
                application["communicationSkillRating"]="${app.communicationSkillRating}";
                application["instructorOverallFeedback"]="${app.instructorOverallFeedback}";
                application["departmentName"]="${app.departmentName}";
                application["courseName"]="${app.courseName}";
                application["id"]="${app.taApplicationId}";
                application["znumber"]="${app.znumber}";
                application["cgpa"]="${app.cgpa}";
                application["presentDepartmentName"]="${app.presentDepartmentName}";
                application["educationLevel"]="${app.educationLevel}";
                application["graduationDate"]="${app.graduationDate}";
                application["cv"]="${app.cv}";
                application["previousExperience"]="${app.previousExperience}";
                application["expCourse"]="${app.expCourse}";
                application["expDuration"]="${app.expDuration}";
                application["recommended"]="${app.recommended}";
                taApplicationsList.push(application);
            </c:forEach>
            console.log(taApplicationsList);

            var coursesTableRows = "";
            var courseNamesList=[];
            courseList.forEach((course, index)=>{
                courseNamesList.push(course.courseName);
                console.log(index+1);
                let val = index+1;
                coursesTableRows+= "<tr> <th scope='row'>"+val+"</th>"+
                        "<td>"+course.id+"</td>"+
                        "<td>"+course.courseName+"</td>"+
                        "<td>"+course.departmentName+"</td>"+
                        "<td>"+course.instructorName+"</td>"+
                        "<td>"+course.status+"</td>"+
                        `<td>
                            <div class='form-check'>
                                <input class='form-check-input cCheckbox' type='checkbox' id='flexCheckDefault'>
                            </div>
                        </td>
                      </tr>`;
                var courseId = course.id;
                var courseName = course.courseName;
                $("#instructorCourseDropdown").append("<option value='"+courseId+"'>"+courseName+"</option>");
            });
            $("#coursesTable").find('tbody').append(coursesTableRows);

            loadInstructorTable(instructorsList);
            loadCommitteeTable(committeeList);

            $("#removeInstructorsBtn").click(function(){
                var selectedInstructorIds=[];
                var selectedRows = [];
                $('.ICheckbox:checked').each(function() {
                    var row = $(this).closest('tr');
                    selectedRows.push(row);
                    selectedInstructorIds.push(row.find('td:eq(0)').text());
                });
                var selectedInstructorsIdsString = selectedInstructorIds.join();
                $.ajax({
                    type: "POST",
                    url: "addRemoveInstructor",
                    data:{
                            ids:selectedInstructorsIdsString,
                            action:"remove"
                        },
                    success: function (result) {
                        if (result == "success") {
                            console.log("Success");
                            selectedRows.forEach((row)=>{
                                row.remove();
                            });
                            // loadInstructorTable(instructorsList);
                        }else{
                            alert(result+ " Not Removed!!");
                        }
                    },
                    error: function (err) {
                        alert("ERROR: ", err);
                    }
                });
            });

            $("#removeCommitteeBtn").click(function(){
                var selectedUserIds=[];
                var rows = [];
                $('.CCheckbox:checked').each(function() {
                    var row = $(this).closest('tr');
                    selectedUserIds.push(row.find('td:eq(0)').text());
                    rows.push(row);
                });

                var selectedUserIdsString = selectedUserIds.join();
                $.ajax({
                    type: "POST",
                    url: "addRemoveCommittee",
                    data:{
                            ids:selectedUserIdsString,
                            action:"remove"
                        },
                    success: function (result) {
                        if (result == "success") {
                            console.log("Success");
                            rows.forEach((row)=>{
                                row.remove();
                            });
                            // loadCommitteeTable(committeeList);
                        }else{
                            alert(result+ " Not Removed!!");
                        }
                    },
                    error: function (err) {
                        alert("ERROR: ", err);
                    }
                });
            });

            $("#removeCourseBtn").click(function(){
                var selectedCourses=[];
                $('.cCheckbox:checked').each(function() {
                    var row = $(this).closest('tr');
                    selectedCourses.push(row.find('th').text());
                    row.remove();
                });

                console.log(selectedCourses);
            });

            $("#manageUsers").click(function () {
                $(".dropdown-menu").toggle();
            });

            $(".dropdown-item").click(function () {
                $(".dropdown-menu").toggle();
            });

            $("#home").click(function(){
                $("#applicationsContainer").show();
                $("#manageCommitteeScreen").hide();
                $("#manageInstructorsScreen").hide();
                $("#manageCoursesScreen").hide();
            })

            $("#manageInstructors").click(function(){
                $("#manageInstructorsScreen").show();
                $("#applicationsContainer").hide();
                $("#manageCommitteeScreen").hide();
                $("#manageCoursesScreen").hide();
            });

            $("#manageCommittee").click(function(){
                $("#manageCommitteeScreen").show();
                $("#applicationsContainer").hide();
                $("#manageInstructorsScreen").hide();
                $("#manageCoursesScreen").hide();
            });

            $("#manageCourses").click(function(){
                $("#manageCoursesScreen").show();
                $("#applicationsContainer").hide();
                $("#manageInstructorsScreen").hide();
                $("#manageCommitteeScreen").hide();
            });

            $("#showInstructorFormBtn").click(()=>{
                $("#addInstructorForm").toggle();
            });

            $("#showCommitteeFormBtn").click(()=>{
                $("#committeeForm").toggle();
            });

            $("#showCourseFormBtn").click(()=>{
                $("#courseForm").toggle();
            });

            $("#committeeForm").click((event)=>{
                event.preventDefault();
            });

            $("#addInstructorForm").click(function(event){
                event.preventDefault();
            });

            $("#closeInstructorFormBtn").click(()=>{
                $("#addInstructorForm").fade();
            });

            $("#addInstructorbtn").click(()=>{
                var name = $("#instructorName").val();
                var email = $("#instructorEmail").val();
                var password = $("#instructorPassword").val();
                var courseId = $("#instructorCourseDropdown").val();
                console.log(courseId);
                var course = courseList.find((course)=>{ if(course.id == courseId){ return course; }});
                console.log(course);
                var courseName = course.courseName;
                var departmentId = course.departmentId;
                var department = departmentList.find((dept)=>{ return dept.departmentId==departmentId });
                var departmentName = department.departmentName;

                if(name !=="" && email!=="" && password!=="" && course!==""){
                    $.ajax({
                        type: "POST",
                        url: "addRemoveInstructor",
                        data:{
                                name:name,
                                email:email,
                                password:password,
                                courseId:courseId,
                                courseName:courseName,
                                departmentId:departmentId,
                                action:"add",
                            },
                        success: function (result) {
                            if (result != "No Id" && result !="failed") {
                                console.log("Success");
                                var instructor = {};
                                instructor["id"]=result;
                                instructor["departmentName"]=departmentName;
                                instructor["courseName"]=courseName;
                                instructor["instructorName"]=name;
                                instructor["email"]=email;
                                instructorsList.push(instructor);
                                loadInstructorTable(instructorsList);
                                
                            }else{
                                alert(result+ " Not Added!!");
                            }
                        },
                        error: function (err) {
                            alert("ERROR: ", err);
                        }
                    });
                }
            })

            $("#addCommitteeBtn").click(()=>{
                var name = $("#committeeMemberName").val();
                var email = $("#committeeMemberEmail").val();
                var password = $("#committeeMemberPassword").val();
                console.log(name, email, password);

                if(name !=="" && email!=="" && password!==""){
                    $.ajax({
                        type: "POST",
                        url: "addRemoveCommittee",
                        data:{
                                name:name,
                                email:email,
                                password:password,
                                action:"add"
                            },
                        success: function (result) {
                            if (result != "No Id" && result !="failed") {
                                console.log("Success");
                                var committee = {};
                                committee["id"]=result;
                                committee["name"]=name;
                                committee["email"]=email;
                                committeeList.push(committee);
                                loadCommitteeTable(committeeList);
                                
                            }else{
                                alert(result+ " Not Added!!");
                            }
                        },
                        error: function (err) {
                            alert("ERROR: ", err);
                        }
                    });
                }
            });

            $("#addCourseBtn").click(()=>{
                var courseName = $("#courseNameCourse").val();
                var departmentName = $("#departmentNameCourse").val();
                var status = $("input[name='status']").val();
                var instructorName = $("#instructorNameCourse").val();

                if(courseName !=="" && departmentName!=="" && status!=="" && instructorName!==""){
                    $.ajax({
                        type: "POST",
                        url: "addRemoveCourse",
                        data:{
                                courseName:courseName,
                                departmentName:departmentName,
                                status:status,
                                instructorName:instructorName,
                                action:"add"
                            },
                        success: function (result) {
                            if (result != "No Id" && result !="failed") {
                                console.log("Success");
                                var committee = {};
                                committee["id"]=result;
                                committee["name"]=name;
                                committee["email"]=email;
                                committeeList.push(committee);
                                loadCommitteeTable(committeeList);
                                
                            }else{
                                alert(result+ " Not Added!!");
                            }
                        },
                        error: function (err) {
                            alert("ERROR: ", err);
                        }
                    });
                }
            });

            function logout() {
                alert("Logging out!!");
                document.cookie = "TAusername=na";
                window.location.href = "login.jsp";
            }

            // var uniqueDepartments = [...new Set(taApplicationsList.map(app => app.departmentName))];
            var departmentDropdown = $("#departmentDropdown");
            departmentNamesList.forEach(department => {
                departmentDropdown.append("<option value='" + department + "'>" + department + "</option>");
            });

            // Populate unique course names in the course dropdown
            // var uniqueCourses = [...new Set(taApplicationsList.map(app => app.courseName))];
            var courseDropdown = $("#courseDropdown");
            courseNamesList.forEach(course => {
                courseDropdown.append("<option value='" + course + "'>" + course + "</option>");
            });

            // Populate unique status values in the status dropdown
            var uniqueStatuses = ["Open","In-Review","Approved","Rejected"];//[...new Set(taApplicationsList.map(app => app.status))];
            var statusDropdown = $("#statusDropdown");
            uniqueStatuses.forEach(status => {
                statusDropdown.append("<option value='" + status + "'>" + status + "</option>");
            });
            // Function to filter and render table based on dropdown selections
            function renderTable() {
                var selectedDepartment = $("#departmentDropdown").val();
                var selectedCourse = $("#courseDropdown").val();
                var selectedStatus = $("#statusDropdown").val();

                var filteredApplications = taApplicationsList;

                if (selectedDepartment !== "all") {
                    filteredApplications = filteredApplications.filter(function (app) {
                        return app.departmentName === selectedDepartment;
                    });
                }

                if (selectedCourse !== "all") {
                    filteredApplications = filteredApplications.filter(function (app) {
                        return app.courseName === selectedCourse;
                    });
                }

                if (selectedStatus !== "all") {
                    filteredApplications = filteredApplications.filter(function (app) {
                        return app.status === selectedStatus;
                    });
                }

                // Render filtered table rows
                var tableBody = $("#taApplicationsListTableBody");
                tableBody.empty();

                filteredApplications.forEach(function (app) {
                    var row = "<tr><td>" + app.name + "</td><td>" + app.email + "</td><td>" + app.status + "</td><td><button class='btn btn-primary btn-sm view-application' data-toggle='modal' data-target='#applicationDetailsModal' data-application='" + JSON.stringify(app) + "'> View Application</button></td></tr>";
                    tableBody.append(row);
                });
            }

            $("#departmentDropdown, #courseDropdown, #statusDropdown").change(function () {
                renderTable();
            });

            // Initial rendering
            renderTable();

            // Save profile data
            $("#saveProfile").click(function () {
                var name = $("#name").val();
                var email = $("#email").val();
                var znumber = $("#znumber").val();
                var address = $("#address").val();
                // You can send this data to your server for saving or perform any other action as needed.
                // For now, we'll just display an alert with the data.
                alert("Name: " + name + "\nEmail: " + email + "\nZ Number: " + znumber + "\nAddress: " + address);
                $("#profileModal").modal("hide");
            });

            $(document).on("click", ".view-application", function () {
                var applicationData = $(this).data("application");
                renderApplicationDetails(applicationData);
                presentApplication = applicationData;
            });

            function renderApplicationDetails(applicationData) {
                var modalContent = $("#applicationDetailsContent");
                modalContent.empty();
                var cvExtension = application.cv.split('.').pop();

                var detailsHtml = "<p><strong>Name:</strong> <span id='applicationcontentdetailsname'>" + applicationData.name + "</span></p>" +
                    "<p><strong>Application Id:</strong><span id='appId'>" + applicationData.applicationId + "</span></p>" +
                    "<p><strong>Email:</strong> " + applicationData.email + "</p>" +
                    "<p><strong>Z Number:</strong> " + applicationData.znumber + "</p>" +
                    "<p><strong>Department:</strong> " + applicationData.departmentName + "</p>" +
                    "<p><strong>Level of Education:</strong> " + applicationData.educationLevel + "</p>" +
                    "<p><strong>Expected Graduation Date:</strong> " + applicationData.graduationDate + "</p>" +
                    "<p><strong>Curriculum Vitae:</strong> <a href='uploads/" + applicationData.znumber + "."+cvExtension+"' target='_blank'>Download CV</a></p>" +
                    "<p><strong>Previous Work Experience:</strong> " + applicationData.previousExperience + "</p>" +
                    "<p><strong>Previous Experience (Months):</strong> " + applicationData.expDuration + " months</p>"+
                    "<p><strong>Best Match :</strong> " + applicationData.recommended + "</p>";

                modalContent.append(detailsHtml);
            }

            // Event listener for accepting an application
            $("#recommendApplicationBtn").click(()=>{
                var applicationData = {
                    applicationId: $("#appId").text(),
                };
                updateApplicationStatus(applicationData.applicationId, true);
            });

            $("#undoApplicationBtn").click(()=>{
                var applicationData = {
                    applicationId: $("#appId").text(),
                };
                updateApplicationStatus(applicationData.applicationId, false);
            });

            function updateApplicationStatus(applicationId, recommended) {
                var application = taApplicationsList.find(function (app) {
                    return app.applicationId === applicationId;
                });
                if (!!application) {
                    $.ajax({
                        type: "POST",
                        url: "recommendApplication",
                        data:{
                                applicationId:application.applicationId,
                                recommended:recommended
                            },
                        success: function (result) {
                            if (result == "success") {
                                console.log("Success");
                                application.recommended = recommended;
                                $("#updateMsg").html("Application updated successfully! <span style='color:green'> &#10004 </span>");
                                renderApplicationDetails(application);
                                renderTable();
                                sleep(3000).then(()=>{
                                    $("#updateMsg").empty();
                                    $("#applicationDetailsModal").modal("hide");
                                });
                            }else{
                                alert(result+ " Not updated!!");
                            }
                        },
                        error: function (err) {
                            alert("ERROR: ", err);
                        }
                    });
                }else{
                    alert("No application filtered!!");
                }
            }
            
            $("#filterIcon").click(function () {
                $("#filterDropdown").toggle();
            });

            // Apply Filters Event
            $("#applyFilters").click(function () {
                $("#filterDropdown").hide();
                renderTable();
            });
        });
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        function loadInstructorTable(list){
            var instructorTableRows = "";
            list.forEach((instructor, index)=>{
                // console.log(instructor);
                let val = index+1;
                instructorTableRows+= "<tr> <th scope='row'>"+val+"</th>"+
                        "<td>"+instructor.id+"</td>"+
                        "<td>"+instructor.instructorName+"</td>"+
                        "<td>"+instructor.email+"</td>"+
                        "<td>"+instructor.courseName+"</td>"+
                        "<td>"+instructor.departmentName+"</td>"+
                        `<td>
                            <div class='form-check'>
                                <input class='form-check-input ICheckbox' type='checkbox' id='flexCheckDefault'>
                            </div>
                        </td>
                      </tr>`;
            });
            $("#instructorsTable").find('tbody').empty();
            $("#instructorsTable").find('tbody').append(instructorTableRows);
        }
        function loadCommitteeTable(list){
            var committeeTableRows = "";
            list.forEach((committee, index)=>{
                let val = index+1;
                committeeTableRows+= "<tr> <th scope='row'>"+val+"</th>"+
                        "<td>"+committee.id+"</td>"+
                        "<td>"+committee.name+"</td>"+
                        "<td>"+committee.email+"</td>"+
                        `<td>
                            <div class='form-check'>
                                <input class='form-check-input CCheckbox' type='checkbox' id='flexCheckDefault'>
                            </div>
                        </td>
                      </tr>`;
            });
            $("#committeeTable").find('tbody').empty();
            $("#committeeTable").find('tbody').append(committeeTableRows);
        }
    </script>
</html>