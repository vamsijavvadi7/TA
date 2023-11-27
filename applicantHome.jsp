<!DOCTYPE>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <head>
        <meta name="viewport" content="width=device-width initial-scale=1">
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Home page</title>
        <style>
            nav {
                padding: 10px;
                position: sticky;
                top: 0;
            }
            .fa-lg{
                line-height: 1.0em !important;
            }
            .navbar-text {
                cursor: pointer;
                color: white !important;
            }
            .nav-link {
                color: white !important;
            }
            .nav-item{
                position: relative;
                display: inline-block;
            }
            .navbar-brand {
                cursor: default;
                color: #e6e6e6 !important;
                font-weight: 900;
            }
            .navbar-text {
                cursor: pointer;
            }
            .navbar-brand {
                cursor: default;
            }

            .dropdown {
                display: flex;
                flex-direction: column;
                align-items: center;
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

            #applicationStatus {
                display: none;
            }

            .appNumber {
                font-weight: bold;
            }

            .statusText {
                background-color: #382752;
                color: white;
            }

            .StatusHeadingText {
                font-family: Georgia, serif;
                padding: 10px;
                /* background:linear-gradient(to right, #ad98cd, white , #ad98cd); */
                font-weight: 700;
                font-size: 20px;
                border-radius: 0px 15px 0px 15px;
                box-shadow: inset 0px 0px 32px 12px #ad98cd;
                letter-spacing: 5px;
            }

            .statusJumbotron {
                border-radius: 40px 40px;
                background-color: #c9bbdd;
            }

            .card-header {
                font-weight: 700;
            }

            .card {
                width: 75%;
            }

            .card-footer {
                font-weight: 500;
            }

            .statusOrangeColor {
                color: orange;
            }

            .statusGreenColor {
                color: green;
            }

            .statusRedColor {
                color: red;
            }

            .text-muted {
                color: #6c757d !important;
            }
            #jumbotronBox{
                background-color: #e4ddee;
                border-radius:15px 15px 15px 15px;
            }
            .form-control{
                width:50%;
            }
            #department{
                text-align:center;
            }
            #course{
                text-align:center;
            }
            .custom-select{
                width:50%;
            }
            #submitBtn{
                background-color: #533b78;
                color:white;
            }
            #applicationStatusScreen{
                display: none;
            }
            .notificationBadge {
                background-color: #fa3e3e;
                border-radius: 37px;
                color: white;
                padding: 1px 7px;
                font-size: 13px;
                font-weight: bold;
                position: absolute;
                top: 2px;
                right: -8px;
                display: none;
            }
            #updateStatusMsg{
                margin-left:18%;
            }
        </style>
    </head>
    <body>
        <center>
            <nav class="navbar navbar-expand-lg navbar-light bg-light"
                style="background-color:#533b78 !important;color:white !important;">
                <a class="navbar-brand" href="#">Applicant Dashboard</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#" id="homeLink">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="statusLink">Applications status</a>
                            <span class="notificationBadge">2</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"
                                id="profileLink"> &nbsp <i class="fa-solid fa-user fa-lg"></i></a>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        <div onclick="logout()">
                            Logout <i class="fa-solid fa-right-from-bracket"></i>
                        </div>
                    </span>
                </div>
            </nav>

            <br><br>
            <div id="applicationProcessScreen" class="container" id="containerBox">
                <div class="jumbotron" id="jumbotronBox">
                    <div id="applyScreen">
                        <h1> Application for TA's </h1><br>

                        <!-- Department List Dropdown -->
                        <div class="form-group">
                            <!-- <label for="department">Select Department:</label> -->
                            <select class="form-control" id="department">
                                <option value="none">-- select department --</option>
                                <c:if test="${not empty departmentList}">
                                    <c:forEach var="dept" items="${departmentList}" varStatus="loopCount">
                                        <option value="${dept.departmentId}">${dept.departmentName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>

                        <!-- Course List Dropdown (Initially hidden) -->
                        <div class="form-group" id="courseList" style="display:none;">
                            <!-- <label for="course">Select Course:</label> -->
                            <select class="form-control" id="course">
                                <!-- Populate courses based on the selected department using JavaScript -->
                            </select>
                        </div>

                        <button id="applyBtn" style="display:none;" class="btn btn-warning">Apply</button>
                    </div>
                    <div id="applicationScreen">
                        <h1> Application </h1>
                        <br />
                        <form id="applicationForm" onsubmit="return validateForm()" name="applicationForm" method="POST"
                            enctype="multipart/form-data">
                            <h4 class="lineInmiddleH2"><span class="h2Span">Academic</span></h4>
                            <div class="form-group">
                                <label for="cgpa">
                                    CGPA
                                </label>
                                <input type="number" name="cgpa" class="form-control" max="4" id="cgpa"
                                    placeholder="Enter CGPA" required />
                            </div>
                            <div class="form-group">
                                <label for="presentDepartment">
                                    Your department
                                </label><br>
                                <select class="custom-select" name="presentDepartment" id="presentDepartment" required>
                                    <option value="none">select</option>
                                    <c:if test="${not empty departmentList}">
                                        <c:forEach var="dept" items="${departmentList}" varStatus="loopCount">
                                            <option value="${dept.departmentId}">${dept.departmentName}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="educationLevel">Level of education</label><br>
                                <select class="custom-select" name="educationLevel" id="edcationLevel" required>
                                    <option value="none" selected>select</option>
                                    <option value="undergrad">Under-graduation</option>
                                    <option value="grad">Graduation</option>
                                    <option value="postgrad">Post-graduation</option>
                                </select>
                            </div>
                            <div name="gradDate" class="form-group">
                                <label for="gradDate">Expected graduation date</label>
                                <input type="date" class="form-control" id="gradDate" width="270" name="gradDate"
                                    placeholder="MM/DD/YYYY" min="10/27/2023" required />
                            </div>
                            <div class="mb-3">
                                <label for="cv" class="form-label">Upload CV</label>
                                <input class="form-control form-control-sm" name="cv" id="cv" type="file" required>
                            </div>
                            <br />

                            <h4 class="lineInmiddleH2"><span class="h2Span">Previous experience</span></h4>

                            <div class="form-check">
                                <input type="checkbox" name="workExperienceBoolean" class="form-check-input"
                                    id="workExperienceBoolean">
                                <label class="form-check-label" for="workExperienceBoolean">Had work experience?</label>
                            </div>
                            <div id="workExpDetailsSection">
                                <div class="form-group">
                                    <label for="expCourse">Previous experience course</label><br>
                                    <select class="custom-select" name="expCourse" id="expCourse">
                                        <option value="none">select</option>
                                        <!-- Auto populated by the jQuery logic -->
                                    </select>
                                </div>
                                <div class="form-outline">
                                    <label class="form-label" for="expDuration">Exp in months</label>
                                    <input type="number" id="expDuration" name="expDuration" min="1" max="24"
                                        class="form-control" placeholder="Exp in months" />
                                </div>
                            </div>
                            <br>
                            <button type="button" class="btn btn-primary" id="submitBtn" name="submitBtn">Submit</button>
                        </form>
                    </div>
                </div>
            </div>

            <div id="applicationStatusScreen">
            </div>

            <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel"
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
                                        placeholder="Update your firstname">
                                </div>
                                <div class="form-group">
                                    <label for="lastname" id="lastnameLabel">${lastname}</label>
                                    <input type="text" class="form-control" id="lastname"
                                        placeholder="Update your lastname">
                                </div>
                                <div class="form-group">
                                    <label for="email" id="emailLabel">${email}</label>
                                    <input type="email" class="form-control" id="email" placeholder="Update your email">
                                </div>
                                <div class="form-group">
                                    <label for="znumber" id="znumberLabel">${znumber}</label>
                                    <input type="text" class="form-control" id="znumber"
                                        placeholder="Update your Znumber">
                                </div>
                                <div class="form-group">
                                    <label for="password" id="passwordLabel">${password}</label>
                                    <input type="password" class="form-control" id="password"
                                        placeholder="Enter your new password">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-warning" id="updateProfile">Update</button>
                        </div>
                    </div>
                </div>
            </div>

            <div Id="hiddenBlock">
                <c:forEach var="course" items="${courseList}" varStatus="loopCount">
                    <input class="hiddenData" type="text" deptId="${course.departmentId}" value="${course.courseName}"
                        placeholder="${course.courseId}">${course.departmentId}</input>
                </c:forEach>
            </div>
        </center>
        <script>
            function logout() {
                alert("Logging out!!");
                document.cookie = "TAusername=na";
                window.location.href = "login.jsp";
            }

            $("#homeLink").click(function () {
                $("#applicationProcessScreen").show();
                $("#applicationStatusScreen").hide();
            });

            $("#statusLink").click(function () {
                $("#applicationProcessScreen").hide();
                $("#applicationStatusScreen").show();
                $(".notificationBadge").hide();
            });

            function validateForm() {
                var gradDate = new Date($("#gradDate").val());
                var presentDate = new Date();
                var filePath = $("#cv").val();
                var allowedExtensions = /(\.docx|\.pdf)$/i;
                var fileObject = document.getElementById('cv');;


                if (!allowedExtensions.exec(filePath)) {
                    alert('Invalid file type');
                    $("#cv").val(" ");
                    return false;
                } else if ($("#cgpa").val() <= 0 || $("#cgpa").val() > 4) {
                    alert("CGPA should be more than 1.0 and lessthan 4.0");
                    return false;
                } else if ($("#presentDepartment").val() == "none") {
                    alert("Should select your department");
                    return false;
                } else if ($("#edcationLevel").val() == "none") {
                    alert("should select education level");
                    return false;
                } else if (gradDate < presentDate) {
                    alert("graduation date should be future date");
                    return false;
                } else if (!filePath) {
                    alert(filepath);
                    return false;
                } else if ($("#workExperienceBoolean").prop('checked')) {
                    if ($("#expCourse").val() == "none") {
                        alert("should select experience course");
                        return false;
                    } else if ($("#expDuration").val() > 24 || $("#expDuration").val() < 1) {
                        alert("Experience duration should lessthan 24 months and greater than or equal to one month");
                        return false;
                    }
                } else if (!fileObject.files) {
                    alert("Browser isn't supported!!");
                    return false;
                } else if (!fileObject.files[0]) {
                    alert("Browser isn't supported!!");
                    return false;
                } else if (fileObject.files[0].size > 5242880) {
                    alert("CV file size exceeded!!");
                    return false; 
                }

                var departmentElement = $("<input>").attr({ "type": "hidden", "name": "department" }).val($("#department").val());
                var courseElement = $("<input>").attr({ "type": "hidden", "name": "course" }).val($("#course").val());
                $('#applicationForm').append($(departmentElement));
                $('#applicationForm').append($(courseElement));

                return true;
            }

            $(document).ready(function () {
                var courses = {};
                var courseIds = {};
                var courseList = [];
                var courseListAll = [];

                <c:forEach items="${courseList}" var="course">
                    var course = { };
                    course["courseId"]="${course.courseId}";
                    course["courseName"]="${course.courseName}";
                    course["departmentId"]="${course.departmentId}";
                    course["instructorId"]="${course.instructorName}";
                    courseListAll.push(course);
                </c:forEach>

                for (var i = 0; i < $(".hiddenData").length; i++) {
                    let deptId = $(".hiddenData").eq(i).attr('deptId');
                    let courseName = $(".hiddenData").eq(i).val();
                    let courseId = $(".hiddenData").eq(i).attr('placeholder');
                    if (!!courses[deptId]) {
                        courseList.push(courseName);
                        courses[deptId].push(courseName);
                    } else {
                        courseList.push(courseName);
                        courses[deptId] = [courseName];
                    }
                    if (!!courseIds[deptId]) {
                        courseIds[deptId].push(courseId);
                    } else {
                        courseIds[deptId] = [courseId];
                    }
                }

                var applicationsList = [];
                var offersCount = 0;
                <c:forEach items="${applicationsList}" var="app">
                    var application = { };
                    application["applicationId"]="${app.id}";
                    application["courseName"]="${app.courseName}";
                    application["departmentName"]="${app.departmentName}";
                    application["instructorName"]="${app.instructorName}";
                    application["status"]="${app.status}";
                    application["offerStatus"]="${app.offerStatus}";
                    application["offered"]="${app.offered}";
                    applicationsList.push(application);
                    if(application.offered=="true" || application.offered==true){
                        offersCount++ 
                    }
                </c:forEach>
                console.log(applicationsList);
                loadApplicationStatusScreen(applicationsList, offersCount);

                $(".card-footer").each(function (i) {
                    console.log($(this).text());
                    if ($(this).text().trim() == "Open") {
                        $(this).attr('style', 'color:#6c757d');
                        $(this).append("<i class='fa-solid fa-pencil'></i>");
                    } else if ($(this).text().trim() == "In-Review") {
                        $(this).attr('style', 'color:orange');
                        $(this).append('<i class="fa-solid fa-hourglass-start"></i>');
                    } else if ($(this).text().trim() == "Approved") {
                        $(this).attr('style', 'color:green');
                        $(this).append('<i class="fa-solid fa-check"></i>');
                    } else {
                        $(this).attr('style', 'color:red');
                        $(this).append('<i class="fa-solid fa-xmark"></i>');
                    }
                });

                $("#department").change(function () {
                    var selectedDepartment = $(this).val();
                    console.log(selectedDepartment);
                    var courseList = courses[selectedDepartment];
                    var courseDropdown = $("#course");
                    courseDropdown.empty();
                    if (courseList) {
                        courseDropdown.append("<option value='none'>-- select course --</option>");
                        $.each(courseList, function (index, course) {
                            courseDropdown.append("<option value='" + courseIds[selectedDepartment][index] + "'>" + course + "</option>");
                        });
                        $("#courseList").show();
                    } else {
                        $("#courseList").hide();
                    }
                });

                $("#course").change(function () {
                    var selectedCourse = $(this).val();
                    console.log(selectedCourse);
                    if (selectedCourse != "none") {
                        $("#applyBtn").show();
                    } else {
                        $("#applyBtn").hide();
                    }
                });

                $("#applyBtn").click(function () {
                    console.log("Department value : " + $("#department").val() + " , Course value : " + $("#course").val());
                    $("#applyScreen").hide();
                    $("#applicationScreen").show();
                });

                $('#workExperienceBoolean').click(function () {
                    $("#workExpDetailsSection").toggle(this.checked);
                    if (!!this.checked) {
                        $("#expCourse").prop('required', true);
                        $("#expDuration").prop('required', true);
                    }
                });

                courseList.forEach(function (val) {
                    $("#expCourse").append("<option value='" + val + "'>" + val + "</option>");
                });

                $("#submitBtn").click(function () {
                    if (validateForm()) {
                        console.log("Submit clicked!!");
                        console.log("CourseId : ", $("#course").val());
                        var courseId = $("#course").val();
                        // var instructorId = courseListAll.find((course)=>{ course.courseId==});
                        // $("<input />").attr({ "type": "hidden", "value": $("#").val(), "name": "extraCgpa" }).appendTo("#applicationForm");

                        var form = $('#applicationForm')[0];
                        var formData = new FormData(form);

                        $.ajax({
                            type: "POST",
                            url: "applicationForm",
                            enctype: 'multipart/form-data',
                            contentType: false,
                            processData: false,
                            cache: false,
                            data: formData,
                            success: function (result) {
                                if (result == "success") {
                                    $("#applicationScreen").hide();
                                    $("#applyScreen").show();
                                    $("#container").hide();
                                    $("#applicationProcessScreen").fadeOut(1000);
                                    $("#applicationStatusScreen").fadeIn(1000);
                                    alert(result);
                                }else{
                                    alert("Failed! "+result);
                                }
                            },
                            error: function (err) {
                                alert("ERROR: ", err);
                            }
                        });
                    } else {
                        alert("Form validation failed!!");
                    }
                });

                $("#updateProfile").click(function () {
                    var firstname = $("#firstname").val();
                    var lastname = $("#lastname").val();
                    var email = $("#email").val();
                    var znumber = $("#znumber").val();
                    var password = $("#password").val();
                    if(firstname=="" && lastname=="" && email=="" && znumber=="" && password==""){
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
                                usertype: "applicant",
                                email: email,
                                znumber: znumber,
                                password: password,
                                oldEmail: $("#emailLabel").text(),
                                oldZnumber: $("#znumberLabel").text()
                            },
                            success: function (result) {
                                if (result == "failed") {
                                    $("#updateStatusMsg").html("Failed to updated! <span style='color:red'> &times; </span>");
                                    $("#updateStatusMsg").fadeIn(1500);
                                }
                                else if(result=="duplicate"){
                                    $("#updateStatusMsg").html("Email or Znumber already exists! <span style='color:red'> &times; </span>");
                                    $("#updateStatusMsg").fadeIn(1500);
                                }
                                else {
                                    $("#updateStatusMsg").html("Successfully updated! <span style='color:green'> &#10004 </span>");
                                    if (firstname != "" && firstname!=null) {
                                        $("#firstnameLabel").text(firstname);
                                    }
                                    if (lastname != "" && lastname != null) {
                                        $("#lastnameLabel").text(lastname);
                                    }
                                    if (password != "" && password!=null) {
                                        $("#passwordLabel").text(password);
                                    }
                                    if((email!="" && email!=null)){
                                        $("#emailLabel").text(email);
                                        document.cookie = "TAusername=" + email;
                                    } 
                                    if((znumber!="" && znumber!=null)){
                                        $("#znumberLabel").text(znumber);
                                        document.cookie = "TAusername=" + oldEmail;
                                    }
                                }
                                sleep(1500).then(()=>{
                                    $("#updateStatusMsg").fadeOut(1500);
                                });
                            }
                        });
                    }
                });

                $(document).on('click','.acceptOffer', ()=>{
                    acceptRejectOffer($(".declineOffer").attr("data"),'accepted');
                });
                
                $(document).on('click','.declineOffer', ()=>{
                    acceptRejectOffer($(".declineOffer").attr("data"),'declined');
                });
            });
            function loadApplicationStatusScreen(list, count){
                var htmlData = `<div style="margin:3%;">
                    <span class="StatusHeadingText">Application Status</span>
                    </div>`;
                list.forEach((app)=>{
                    var offerHtml="";
                    console.log(app.offered);
                    if((app.offered==true || app.offered=="true") && app.status=="Approved"){
                        var buttonDisbledStatus="";
                        var offerAcceptedRejectedMsg="";
                        if(app.offerStatus!=null && app.offerStatus=="accepted"){
                            buttonDisbledStatus= `disabled`;
                            offerAcceptedRejectedMsg=`<p class="card-text"> You have Accepted the offer! please contact course instructor</p>`;
                        }
                        if(app.offerStatus!=null && app.offerStatus=="declined"){
                            buttonDisbledStatus="disabled";
                            offerAcceptedRejectedMsg=`<p class="card-text"> You have Declined the offer</p>`;
                        }
                        offerHtml = `<p class="card-text" style='color:green'><b>Congratulations, You received TA Offer under `+app.instructorName+`!</b> 
                            <br><br><button class="btn btn-primary acceptOffer" `+buttonDisbledStatus+` data='`+app.applicationId+`'>Accept</button>
                            <button class="btn btn-danger declineOffer" `+buttonDisbledStatus+` data='`+app.applicationId+`'>Decline</button></p>`+
                            offerAcceptedRejectedMsg;
                    }else{
                        if(app.status=="Approved"){
                            offerHtml=`<p class="card-text" style='color:yellow'><b>Your application is approved! wait for the offer from committee</b></p>`;
                        }
                    }
                    htmlData+= `<div class="card text-center">
                            <div class="card-header">
                                #`+app.applicationId+`
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">`+app.courseName+`</h5>
                                <p class="card-text">Department of <b>`+app.departmentName+`</b> and Teaching assistant for
                                    <b>`+app.instructorName+`</b></p>
                                `+offerHtml+`
                            </div>
                            <div class="card-footer">
                                `+app.status+`
                            </div>
                        </div>
                        <br>`;
                });
                $("#applicationStatusScreen").empty();
                $("#applicationStatusScreen").html(htmlData);
                if(count>0){
                    $(".notificationBadge").show();
                    $(".notificationBadge").html(count);
                }
            }
            function acceptRejectOffer(id,action){
                $.ajax({
                        type: "POST",
                        url: "offerAcceptReject",
                        data: {
                            action:action,
                            applicationId:id
                        },
                        success: function (result) {
                            if (result == "failed") {
                                alert("failed");
                            }
                            else {
                                alert("success");
                            }
                        }
                    });
            }
            function getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return null;
            }
            function todayDate() {
                var today = new Date(); // get the current date
                var dd = today.getDate(); //get the day from today.
                var mm = today.getMonth() + 1; //get the month from today +1 because january is 0!
                var yyyy = today.getFullYear(); //get the year from today

                //if day is below 10, add a zero before (ex: 9 -> 09)
                if (dd < 10) {
                    dd = '0' + dd
                }
                //like the day, do the same to month (3->03)
                if (mm < 10) {
                    mm = '0' + mm
                }
                //finally join yyyy mm and dd with a "-" between then
                return mm + '/' + dd + '/' + yyyy;
            }
            function sleep(ms) {
                return new Promise(resolve => setTimeout(resolve, ms));
            }
        </script>
    </body>

</html>