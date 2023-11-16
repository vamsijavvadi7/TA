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
            #addCommitteeForm{
                display:none;
            }
            #addInstructorForm{
                display:none;
            }
            #addCourseForm{
                display: none;
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
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="applicationDetailsContent">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" id="approveApplication">Approve</button>
                        <button type="button" class="btn btn-danger" id="rejectApplication">Reject</button>
                        <button type="button" class="btn btn-warning" id="reviewApplication">Review</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="manageInstructorsScreen">
            <div id="content">
                <h2>Manage Instructors</h2>
                <div class="addRemoveButtons">
                    <button type="button" class="btn btn-primary custom-btn" id="addInstructorsBtn">Add</button>
                    <button type="button" class="btn btn-danger custom-btn" id="removeInstructorsBtn">Remove</button>
                </div>
                <form id="addInstructorForm">
                    <div class="form-group">
                        <label for="instructorName">Name:</label>
                        <input type="text" class="form-control" id="instructorName" name="instructorName" required>
                    </div>  
                    <div class="form-group">
                        <label for="instructorCourse">Course:</label>
                        <input type="text" class="form-control" id="instructorCourse" name="instructorCourse" required>
                    </div>
                </form>
                <center>
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
                    <button type="button" class="btn btn-primary custom-btn" id="addCommitteeBtn">Add</button>
                    <button type="button" class="btn btn-danger custom-btn" id="removeCommitteeBtn">Remove</button>
                </div>
                <form id="addCommitteeForm">
                    <div class="form-group">
                        <label for="CommitteeMemberName">Name:</label>
                        <input type="text" class="form-control" id="CommitteeMemberName" name="CommitteeMemberName" required>
                    </div>
                    <div class="form-group">
                        <label for="CommitteeMemberCourse">Course:</label>
                        <input type="text" class="form-control" id="CommitteeMemberCourse" name="CommitteeMemberCourse" required>
                    </div>
                    <div class="form-group">
                        <label for="CommitteeMemberDepartment">Department:</label>
                        <input type="text" class="form-control" id="CommitteeMemberDepartment" name="CommitteeMemberDepartment" required>
                    </div>
                </form>
                <center>
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
                <button type="button" class="btn btn-primary custom-btn" id="addCourseBtn">Add</button>
                <button type="button" class="btn btn-danger custom-btn" id="removeCourseBtn">Remove</button>
            </div>
            <form id="addCourseForm">
                <div class="form-group">
                    <label for="CommitteeMemberName">Name:</label>
                    <input type="text" class="form-control" id="CommitteeMemberName" name="CommitteeMemberName" required>
                </div>
                <div class="form-group">
                    <label for="CommitteeMemberCourse">Course:</label>
                    <input type="text" class="form-control" id="CommitteeMemberCourse" name="CommitteeMemberCourse" required>
                </div>
                <div class="form-group">
                    <label for="CommitteeMemberDepartment">Department:</label>
                    <input type="text" class="form-control" id="CommitteeMemberDepartment" name="CommitteeMemberDepartment" required>
                </div>
            </form>
            <center>
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

            // $('#applicationsTable').DataTable({
            //     "scrollY": "50vh"
            // });

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
            <c:forEach items="${departmentList}" var="dept">
                departmentNamesList.push("${dept.departmentName}");
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

            var committeeTableRows = "";
            committeeList.forEach((committee, index)=>{
                // console.log(committee);
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
            $("#committeeTable").find('tbody').append(committeeTableRows);

            var instructorTableRows = "";
            instructorsList.forEach((instructor, index)=>{
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
            $("#instructorsTable").find('tbody').append(instructorTableRows);

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
            });
            $("#coursesTable").find('tbody').append(coursesTableRows);

            $("#removeInstructorsBtn").click(function(){
                var selectedUsers=[];
                $('.ICheckbox:checked').each(function() {
                    var row = $(this).closest('tr');
                    selectedUsers.push(row.find('th').text());
                    row.remove();
                });
                console.log(selectedUsers);
            });

            $("#removeCommitteeBtn").click(function(){
                var selectedUsers=[];
                $('.CCheckbox:checked').each(function() {
                    var row = $(this).closest('tr');
                    selectedUsers.push(row.find('th').text());
                    row.remove();
                });

                console.log(selectedUsers);
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

            // Event listener for viewing application details
            $(document).on("click", ".view-application", function () {
                var applicationData = $(this).data("application");
                renderApplicationDetails(applicationData);
            });

            // Function to render application details in the modal
            // Function to render application details in the modal
            function renderApplicationDetails(applicationData) {
                var modalContent = $("#applicationDetailsContent");
                modalContent.empty();

                // You can customize the layout and content of the modal here
                var detailsHtml = "<p><strong>Name:</strong> <span id='applicationcontentdetailsname'>" + applicationData.name + "</span></p>" +
                    "<p><strong>Email:</strong> " + applicationData.email + "</p>" +
                    "<p><strong>Z Number:</strong> " + applicationData.znumber + "</p>" +
                    "<p><strong>Department:</strong> " + applicationData.departmentName + "</p>" +
                    "<p><strong>Level of Education:</strong> " + applicationData.educationLevel + "</p>" +
                    "<p><strong>Expected Graduation Date:</strong> " + applicationData.graduationDate + "</p>" +
                    "<p><strong>Curriculum Vitae:</strong> <a href='" + applicationData.cv + "' target='_blank'>Download CV</a></p>" +
                    "<p><strong>Previous Work Experience:</strong> " + applicationData.previousExperience + "</p>" +
                    "<p><strong>Previous Experience (Months):</strong> " + applicationData.expDuration + " months</p>";

                modalContent.append(detailsHtml);
            }

            // Event listener for accepting an application
            $("#approveApplication").click(()=>{
                var applicationData = {
                    name: $("#applicationcontentdetailsname").text(),
                };
                updateApplicationStatus(applicationData.name, "Approved");
                $("#applicationDetailsModal").modal("hide");
                console.log("Accepted application for: " + applicationData.name);
            });

            $("#rejectApplication").click(()=>{
                var applicationData = {
                    name: $("#applicationcontentdetailsname").text(),
                };
                updateApplicationStatus(applicationData.name, "Rejected");
                $("#applicationDetailsModal").modal("hide");
                console.log("Rejected application");
            });

            function updateApplicationStatus(name, newStatus) {
                var application = taApplicationsList.find(function (app) {
                    return app.name === name;
                });

                if (application) {
                    // $.ajax({
                    //     type: "POST",
                    //     url: "updateApplicationStatus",
                    //     data:{
                    //             applicantId:application.id,
                    //             status:newStatus
                    //         },
                    //     success: function (result) {
                    //         if (result == "success") {
                    //             // window.location.href = "applicationStatus";
                    //             console.log("Success");
                    //         }
                    //         alert(result);
                    //     },
                    //     error: function (err) {
                    //         alert("ERROR: ", err);
                    //     }
                    // });

                    application.status = newStatus;
                    renderTable();
                }
            }
            // Filter Icon Click Event
            $("#filterIcon").click(function () {
                $("#filterDropdown").toggle();
            });

            // Apply Filters Event
            $("#applyFilters").click(function () {
                $("#filterDropdown").hide();
                renderTable();
            });
        });
    </script>
</html>