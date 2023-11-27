<!DOCTYPE>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta name="viewport" content="width=device-width initial-scale=1">
        <title>TA Committee</title>
        <meta charset="UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            nav {
                padding: 10px;
                position: sticky;
                top: 0;
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
                color: #e6e6e6 !important;
                font-weight: 900;
            }

            .dropdown {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            body {
                background-color: #f4f4f4;
            }

            .navbar-text {
                cursor: pointer;
            }

            .navbar-brand {
                cursor: default;
            }

            .lineInmiddleH2 {
                width: 100%;
                text-align: center;
                border-bottom: 1px solid #000;
                line-height: 0.1em;
                margin: 10px 0 20px;
            }

            .h2Span {
                background: #fff;
                padding: 0 10px;
            }

            #workExpDetailsSection {
                display: none;
            }

            #applicationScreen {
                display: none;
            }

            #hiddenBlock {
                display: none;
            }

            #jumbotronBox {
                background-color: #e4ddee;
                border-radius: 15px 15px 15px 15px;
                padding: 4rem 2rem;
            }

            .applicationContainer {
                max-width: 70%;
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
            .filter-dropdown-div {
                position: fixed;
                background-color: rgba(0,0,0,0.8);
                display: none;
                z-index: 1000;
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

            .filter-icon.third-column {
                right: 20px;
                top: 20px;
                font-size: 1.5em;
                z-index: 1000;
            }
            #applyFilters{
                background-color: #533b78;
                color:white;
            }

            .filter-icon {
                cursor: pointer;
                top: 20px;
                font-size: 1.5em;
                z-index: 1000;
            }
            .container{
                margin-top:2%;
            }
            #applicationsTable{
                width:100%;
                text-align:center !important;
            }
            table, th{
                border:white 0px solid !important;
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
            #applicationStatusFooter{
                font-weight: bold;
                display: flex;
                left: 2%;
                position: absolute;
            }
            #statusValue{
                padding: 2px 15px;
                border-radius: 15px;
            }
            #approvedTAsScreen{
                display: none;
            }
            .lineInmiddleH2 {
                width: 100%;
                text-align: center;
                border-bottom: 1px solid #000;
                line-height: 0.1em;
                margin: 25px 0 25px;
            }

            .h2Span {
                background: #fff;
                padding: 0 10px;
            }
            #applicationDetailsContent{
                overflow-y: auto;
                height: 600px;
                position: relative;
                display: block;
            }
            #applicationDetailsContent p{
                background-color: #8465b3;
                margin-bottom:5px;
                padding:3px;
                color:white;
                font-weight: 700;
            }
            #applicationDetailsContent a{
                color:white;
            }
            #applicationDetailsContent strong{
                color:#533b78;
                background-color: white;
                border-radius:10px;
                padding:1px 10px;
                margin-right:5px;
            }
            #updateStatusMsg{
                margin-left:18%;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light"
            style="background-color:#533b78 !important;color:white !important;padding: 10px 20px;">
            <a class="navbar-brand" >Committee Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#Home" id="home">Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#ApprovedTAs" id="approvedTAs">Approved TAs</a>
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

        <div class="applicationContainer container">
            <div class="jumbotron" id="jumbotronBox">
                <h2 class="text-center">TA Applications</h2>
                <center>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-striped" id="applicationsTable">
                            <thead>
                                <tr>
                                    <th>Application Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Course Name</th>
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
        </div>

        <div id="approvedTAsScreen" class="container">
            <div class="jumbotron" id="jumbotronBox">
                <h2 class="text-center">Approved Applications</h2>
                <center>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar"></div>
                        <table class="table table-striped" id="approvedTAsTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Application Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Course Name</th>
                                    <th>Course Id</th>
                                    <th>Instructor Id</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </center>
            </div>
        </div>

        <div id="profileModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                        <span id="updateStatusMsg"></span>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="profileForm">
                            <div class="form-group">
                                <label for="firstname" id="firstnameLabel">${firstname}</label>
                                <input type="text" class="form-control" id="firstname"
                                    placeholder="Update your firstname" />
                            </div>
                            <div class="form-group">
                                <label for="lastname" id="lastnameLabel">${lastname}</label>
                                <input type="text" class="form-control" id="lastname"
                                    placeholder="Update your lastname" />
                            </div>
                            <div class="form-group">
                                <label for="email" id="emailLabel">${email}</label>
                                <input type="email" class="form-control" id="email" placeholder="Update your email" />
                            </div>
                            <div class="form-group">
                                <label for="password" id="passwordLabel">${password}</label>
                                <input type="password" class="form-control" id="password"
                                    placeholder="Enter your new password" />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="updateProfile">Update</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="applicationDetailsModal" class="modal fade" tabindex="-1" role="dialog"
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
                        <div id="applicationStatusFooter">
                            <label>
                                Status 
                            </label> &nbsp&nbsp
                            <div id="statusValue">
                            </div>
                        </div>
                        <button type="button" class="btn btn-success updateStatusBtn" data-application="Approved" id="acceptApplicationBtn">Approve</button>
                        <button type="button" class="btn btn-warning updateStatusBtn" data-application="In-Review" id="reviewApplicationBtn">Review</button>
                        <button type="button" class="btn btn-danger updateStatusBtn" data-application="Rejected" id="rejectApplicationBtn">Reject</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            var courseList = [];
            var courseNamesList = [];
            <c:forEach items="${courseList}" var="course">
                var course = {};
                course["id"]="${course.courseId}";
                course["courseName"]="${course.courseName}";
                course["departmentId"]="${course.departmentId}";
                course["departmentName"]="${course.departmentName}";
                course["status"]="${course.status}";
                course["instructorName"]="${course.instructorName}";
                courseList.push(course);
                courseNamesList.push("${course.courseName}");
            </c:forEach>

            var departmentNamesList = [];
            var departmentList =[];
            <c:forEach items="${departmentList}" var="dept">
                var departmentObj = {};
                departmentNamesList.push("${dept.departmentName}");
                departmentObj["departmentId"]="${dept.departmentId}";
                departmentObj["departmentName"] = "${dept.departmentName}";
                departmentList.push(departmentObj);
            </c:forEach>

            var taApplicationsList = [];
            <c:forEach items="${applicationsList}" var="app">
                var application = { };
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
                application["applicationId"]="${app.taApplicationId}";
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
                application["courseInstructorName"]="${app.courseInstructorName}";
                taApplicationsList.push(application);
            </c:forEach>

            var approvedTAsList = [];
            <c:forEach items="${approvedApplicationsList}" var="app">
                var application = { };
                application["email"]="${app.email}";
                application["applicantName"]="${app.applicantName}";
                application["courseName"]="${app.courseName}";
                application["instructorId"]="${app.instructorId}";
                application["applicationId"]="${app.applicationId}";
                application["courseId"]="${app.courseId}";
                approvedTAsList.push(application);
            </c:forEach>
            
            var departmentDropdown = $("#departmentDropdown");
            departmentNamesList.forEach(department => {
                departmentDropdown.append("<option value='" + department + "'>" + department + "</option>");
            });

            var courseDropdown = $("#courseDropdown");
            courseNamesList.forEach(course => {
                courseDropdown.append("<option value='" + course + "'>" + course + "</option>");
            });

            var uniqueStatuses = ["Open","In-Review","Approved","Rejected"];
            var statusDropdown = $("#statusDropdown");
            uniqueStatuses.forEach(status => {
                statusDropdown.append("<option value='" + status + "'>" + status + "</option>");
            });

            function renderTable() {
                var selectedDepartment = $("#departmentDropdown").val();
                var selectedCourse = $("#courseDropdown").val();
                var selectedStatus = $("#statusDropdown").val();

                var filteredApplications = taApplicationsList;

                if (selectedDepartment !== "all") {
                    filteredApplications = filteredApplications.filter(function (app) {
                        return app.department === selectedDepartment;
                    });
                }

                if (selectedCourse !== "all") {
                    filteredApplications = filteredApplications.filter(function (app) {
                        return app.course === selectedCourse;
                    });
                }

                if (selectedStatus !== "all") {
                    filteredApplications = filteredApplications.filter(function (app) {
                        return app.status === selectedStatus;
                    });
                }

                var tableBody = $("#taApplicationsListTableBody");
                tableBody.empty();
                filteredApplications.forEach(function (app) {
                    var row = "<tr><td>" + app.applicationId + "</td><td>" + app.name + "</td><td>" + app.email + "</td><td>" + app.courseName + "</td><td>" + app.status + "</td><td><button class='btn btn-primary btn-sm view-application' data-toggle='modal' data-target='#applicationDetailsModal' data-application='" + JSON.stringify(app) + "'>View Application</button></td></tr>";
                    tableBody.append(row);
                });
            }

            $("#departmentDropdown, #courseDropdown, #statusDropdown").change(function () {
                renderTable();
            });

            renderTable();
            loadApprovedTAsTable(approvedTAsList);

            $(document).on("click", ".view-application", function () {
                var applicationData = $(this).data("application");
                renderApplicationDetails(applicationData);
            });

            function renderApplicationDetails(applicationData) {
                var modalContent = $("#applicationDetailsContent");
                modalContent.empty();
                var cvExtension = applicationData.cv.split('.').pop();
                var feedbackHtml = "";
                if(applicationData.instructorFeedbackExists){
                    feedbackHtml = "<h5 class='lineInmiddleH2'><span class='h2Span'>INSTRUCTOR FEEDBACK</span></h5>"+
                    "<p><strong>Instructor Name </strong> " + applicationData.instructorFeedbackName + "</p>"+
                    "<p><strong>Course Name </strong> " + applicationData.instructorFeedbackCourseName + "</p>"+
                    "<p><strong>Performace Rating </strong> " + applicationData.performanceRating + "/10</p>"+
                    "<p><strong>Technical Skill Rating </strong> " + applicationData.technicalSkillRating + "/10</p>"+
                    "<p><strong>Communication Skill Rating </strong> " + applicationData.communicationSkillRating + "/10</p>"+
                    "<p><strong>Overall Feedback </strong> " + applicationData.instructorOverallFeedback + "</p>";
                }
                var detailsHtml = ""+
                    "<p><strong>Application Id </strong> <span id='appId'>" + applicationData.applicationId + "</span></p>" +
                    "<p><strong>Applicant Name </strong> <span id='applicationcontentdetailsname'>" + applicationData.name + "</span></p>" +
                    "<p><strong>Email </strong> " + applicationData.email + "</p>" +
                    "<p><strong>Z Number </strong> " + applicationData.znumber + "</p>" +
                    "<p><strong>Department </strong> " + applicationData.presentDepartmentName + "</p>" +

                    "<h5 class='lineInmiddleH2'><span class='h2Span'>ACADEMIC</span></h5>"+
                    "<p><strong>Level of Education </strong> " + applicationData.educationLevel + "</p>" +
                    "<p><strong>CGPA </strong> " + applicationData.cgpa + "</p>" +
                    "<p><strong>Expected Graduation Date </strong> " + applicationData.graduationDate + "</p>" +
                    "<p><strong>CV File </strong> <a href='uploads/" + applicationData.znumber + "."+cvExtension+"' target='_blank'>Download CV</a></p>" +
                    
                    "<h5 class='lineInmiddleH2'><span class='h2Span'>EXPERIENCE</span></h5>"+
                    "<p><strong>Work Experience </strong> " + applicationData.previousExperience + "</p>" +
                    "<p><strong>Experience Duration (Months) </strong> " + applicationData.expDuration + " months</p>"+
                    "<p><strong>Experience In Course </strong> " + applicationData.expCourse + "</p>"+
                    
                    feedbackHtml+
                    
                    "<h5 class='lineInmiddleH2'><span class='h2Span'>APPLICATION DETAILS</span></h5>"+
                    "<p><strong>TA Course </strong> " + applicationData.courseName + "</p>" +
                    "<p><strong>TA Department </strong> " + applicationData.departmentName + "</p>" +
                    "<p><strong>Instructor Name </strong> " + applicationData.courseInstructorName + "</p>" +
                    "<p><strong>Admin Recommendation </strong> " + applicationData.recommended + "</p>";
                $("#statusValue").html(applicationData.status);
                var bgColor = "#dc3545";
                var color = "white";
                if(applicationData.status=="Open"){
                    bgColor = "#533b78";
                    color = "white";
                }else if(applicationData.status=="In-Review"){
                    bgColor="#ffc107";
                    color="black";
                }else if(applicationData.status=="Approved"){
                    bgColor = "green";
                    color="white";
                }
                $("#statusValue").css("background-color",bgColor);
                $("#statusValue").css("color",color);
                modalContent.append(detailsHtml);
            }

            $(document).on("click", ".updateStatusBtn", function () {
                var status = $(this).data("application");
                var buttonValue = $("#statusValue").html();
                var applicationData = {
                    applicationId: $("#appId").text()
                };
                console.log(applicationData);
                if(status==buttonValue){
                    alert("Application already " + status);
                }else{
                    updateApplicationStatus(applicationData.applicationId, status);
                }
            });

            function updateApplicationStatus(applicationId, applicationStatus) {
                var application = taApplicationsList.find(function (app) {
                    return app.applicationId == applicationId ;
                });
                if (!!application) {
                    $.ajax({
                        type: "POST",
                        url: "applicationStatus",
                        data:{
                                applicationId:application.applicationId,
                                status:applicationStatus
                            },
                        success: function (result) {
                            if (result == "success") {
                                console.log("Success");
                                application.status = applicationStatus;
                                $("#updateMsg").html("Application status updated successfully! <span style='color:green'> &#10004 </span>");
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
                    alert("ApplicationId '"+applicationId+"' not found!");
                }
            }

            $("#filterIcon").click(function () {
                $("#filterDropdown").toggle();
            });

            $("#applyFilters").click(function () {
                renderTable();
                $("#filterDropdown").hide();
            });

            $("#approvedTAs").click(()=>{
                $("#approvedTAsScreen").show();
                $(".applicationContainer").hide();
            });

            $("#home").click(()=>{
                $(".applicationContainer").show();
                $("#approvedTAsScreen").hide();
            });

            $("#updateProfile").click(function () {
                var firstname = $("#firstname").val();
                var lastname = $("#lastname").val();
                var email = $("#email").val();
                var password = $("#password").val();
                var oldEmail = $("#emailLabel").text();
                if(firstname=="" && lastname=="" && email=="" && password==""){
                    $("#updateStatusMsg").html("No changes made to update!");
                    sleep(1500).then(()=>{
                        $("#updateStatusMsg").fadeOut(1500);
                    });
                }else{
                    $.ajax({
                        type: "POST",
                        url: "profileUpdate",
                        data: {
                            firstname: firstname,
                            lastname: lastname,
                            usertype: "committee",
                            email: email,
                            password: password,
                            oldEmail: oldEmail
                        },
                        success: function (result) {
                            if(result == "failed") {
                                $("#updateStatusMsg").html("Failed to update! <span style='color:red'> &times; </span>");
                                $("#updateStatusMsg").fadeIn(1500);
                            }
                            else if(result == "success"){
                                $("#updateStatusMsg").html("Successfully updated! <span style='color:green'> &#10004 </span>");
                                $("#updateStatusMsg").fadeIn(1500);
                                if (firstname != "" && firstname!=null) {
                                    $("#firstnameLabel").text(firstname);
                                }
                                if (lastname != "" && lastname!=null) {
                                    $("#lastnameLabel").text(lastname);
                                }
                                if(email!=null && email!=""){
                                    $("#emailLabel").text(email);
                                    document.cookie = "TAusername=" + email;
                                }
                                if(password!=null && password!=""){
                                    $("#passwordLabel").text(password);
                                }
                            }else{
                                $("#updateStatusMsg").fadeIn(1500);
                                $("#updateStatusMsg").html("Email already exists! <span style='color:red'> &times; </span>");
                            }
                            sleep(1500).then(()=>{
                                $("#updateStatusMsg").fadeOut(1500);
                            });
                        }
                    });
                }
            });
        });
        function logout() {
            alert("Logging out!!");
            document.cookie = "TAusername=na";
            window.location.href = "login.jsp";
        }
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        function loadApprovedTAsTable(list){
            var approvedAppsTableRows = "";
            list.forEach((app, index)=>{
                let val = index+1;
                approvedAppsTableRows+= "<tr> <th scope='row'>"+val+"</th>"+
                        "<td>"+app.applicationId+"</td>"+
                        "<td>"+app.applicantName+"</td>"+
                        "<td>"+app.email+"</td>"+
                        "<td>"+app.courseName+"</td>"+
                        "<td>"+app.courseId+"</td>"+
                        "<td>"+app.instructorId+"</td></tr>";
            });
            $("#approvedTAsTable").find('tbody').empty();
            $("#approvedTAsTable").find('tbody').append(approvedAppsTableRows);
        }
    </script>

</html>