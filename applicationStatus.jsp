<!DOCTYPE>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <head>
        <meta name="viewport" content="width=device-width initial-scale=1">
        <link href="css/bootstrap.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width" />
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
        <title>Home page</title>
        <style>
            .navbar-text {
                cursor: pointer;
                color:white !important;
            }
            .navbar-brand{
                color:white !important;
            }
            .nav-link{
                color:white !important;
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
        </style>
    </head>

    <body>
        <center>
            <!-- <h1>Dashboard</h1> -->

            <nav class="navbar navbar-expand-lg navbar-light bg-light"
                style="background-color:#533b78 !important;color:white !important;">
                <a class="navbar-brand" href="#">Dashboard</a>
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
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"
                                id="profileLink">Profile</a>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        <div onclick="logout()">
                            Logout
                        </div>
                    </span>
                </div>
            </nav>


            <div class="container" id="container">
                <div class="jumbotron">
                    <div id="applyScreen">
                        <h1> Application for TA positions</h1>

                        <!-- Department List Dropdown -->
                        <div class="form-group">
                            <label for="department">Select Department:</label>
                            <select class="form-control" id="department">
                                <option value="none">select</option>
                                <c:if test="${not empty departmentList}">
                                    <c:forEach var="dept" items="${departmentList}" varStatus="loopCount">
                                        <option value="${dept.departmentId}">${dept.departmentName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>

                        <!-- Course List Dropdown (Initially hidden) -->
                        <div class="form-group" id="courseList" style="display:none;">
                            <label for="course">Select Course:</label>
                            <select class="form-control" id="course">
                                <!-- Populate courses based on the selected department using JavaScript -->
                            </select>
                        </div>

                        <button id="applyBtn" style="display:none;" class="btn btn-warning">Apply</button>
                    </div>
                    <div id="applicationScreen">
                        <h1> Application </h1>
                        <br />
                        <form id="applicationForm" onsubmit="return validateForm()" name="applicationForm" method="POST" enctype="multipart/form-data">
                            <h4 class="lineInmiddleH2"><span class="h2Span">Academic</span></h4>
                            <div class="form-group">
                                <label for="cgpa">
                                    CGPA
                                </label>
                                <input type="number" name="cgpa" class="form-control" max="4" id="cgpa" step=".01"
                                    placeholder="Enter CGPA" required>
                            </div>
                            <div class="form-group">
                                <label for="presentDepartment">
                                    Your department
                                </label>
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
                                <label for="educationLevel">Level of education</label>
                                <select class="custom-select" name="educationLevel" id="edcationLevel" required>
                                    <option value="none" selected>select</option>
                                    <option value="undergrad">Under-graduation</option>
                                    <option value="grad">Graduation</option>
                                    <option value="postgrad">Post-graduation</option>
                                </select>
                            </div>
                            <div name="gradDate" class="form-group">
                                <label for="gradDate">Expected graduation date</label>
                                <input type="date" class="form-control" id="gradDate" width="270" name="gradDate" placeholder="MM/DD/YYYY" min="10/27/2023" required />
                            </div>
                            <div class="mb-3">
                                <label for="cv" class="form-label">Upload CV</label>
                                <input class="form-control form-control-sm" name="cv" id="cv" type="file" required>
                            </div>
                            <br />

                            <h4 class="lineInmiddleH2"><span class="h2Span">Previous experience</span></h4>

                            <div class="form-check">
                                <input type="checkbox" name="workExperienceBoolean" class="form-check-input" id="workExperienceBoolean">
                                <label class="form-check-label" for="workExperienceBoolean">Had work experience?</label>
                            </div>
                            <div id="workExpDetailsSection">
                                <div class="form-group">
                                    <label for="expCourse">Previous experience course</label>
                                    <select class="custom-select" name="expCourse" id="expCourse">
                                        <option value="none">select</option>
                                        <!-- Auto populated by the jQuery logic -->
                                    </select>
                                </div>
                                <div class="form-outline">
                                    <label class="form-label" for="expDuration">Exp in months</label>
                                    <input type="number" id="expDuration" name="expDuration" min="1" max="24" class="form-control"
                                        placeholder="Exp in months" />
                                </div>
                            </div>

                            <button type="button" id="submitBtn" name="submitBtn">Submit</button>
                        </form>
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
                                    <label for="email" id="oldEmail">${email}</label>
                                    <input type="email" class="form-control" id="email" placeholder="Update your email">
                                </div>
                                <div class="form-group">
                                    <label for="znumber" id="oldZnumber">${znumber}</label>
                                    <input type="text" class="form-control" id="znumber"
                                        placeholder="Update your Znumber">
                                </div>
                                <div class="form-group">
                                    <label for="password">********</label>
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
            // $('#gradDate').datepicker({
            //     uiLibrary: 'bootstrap5'
            // });

            function logout() {
                alert("Logging out!!");
                document.cookie = "TAusername=na";
                window.location.href = "login.jsp";
            }

            $("#homeLink").click(function () {
                window.location.href = "applicantHome";
            });

            $("#statusLink").click(function () {
                window.location.href = "applicationStatus";
                $.ajax({
                    type: "GET",
                    url: "applicationStatus",
                    data: { username: $("#username").val(), password: $("#password").val(), usertype: $("#usertype").val() },
                    success: function (result) {
                        if (result == "incorrect") {
                            alert("Incorrect credentials!!");
                        }
                        else {
                            window.location.href = "applicantHome";
                        }
                    }
                });
            });

            function validateForm() {
                var gradDate = new Date($("#gradDate").val());
                var presentDate = new Date();
                var filePath = $("#cv").val();
                var allowedExtensions = /(\.docx|\.pdf)$/i;

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
                }

                /** Adding course and department values to the form */
                var departmentElement = $("<input>").attr({"type":"hidden","name":"department"}).val($("#department").val());
                var courseElement = $("<input>").attr({"type":"hidden","name":"course"}).val($("#course").val());
                $('#applicationForm').append($(departmentElement));
                $('#applicationForm').append($(courseElement));

                return true;
            }

            $(document).ready(function () {
                var courses = {};
                var courseIds = {};
                var courseList = [];
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
                console.log("Courses : ", courses);
                // Populate the course list based on the selected department
                $("#department").change(function () {
                    var selectedDepartment = $(this).val();
                    console.log(selectedDepartment);
                    var courseList = courses[selectedDepartment];
                    var courseDropdown = $("#course");
                    courseDropdown.empty();
                    if (courseList) {
                        courseDropdown.append("<option value='none'>select</option>");
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

                // $("#gradDate").attr('min', todayDate());

                courseList.forEach(function (val) {
                    $("#expCourse").append("<option value='" + val + "'>" + val + "</option>");
                });

                $("#submitBtn").click(function () {
                    if (validateForm()) {
                        console.log("Submit clicked!!");
                        var cgpa = $("#cgpa").val();
                        console.log("CGPA : ", cgpa)

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
                                if(result=="success"){
                                    $("#applicationScreen").hide();
                                    $("#applyScreen").show();
                                    $("#container").hide();
                                }
                                alert(result);
                            },
                            error: function(err){
                                alert("ERROR: ", err);
                            }
                        });
                    }
                });

                $("#updateProfile").click(function () {
                    var firstname = $("#firstname").val();
                    var lastname = $("#lastname").val();
                    var email = $("#email").val();
                    var znumber = $("#znumber").val();
                    var password = $("#password").val();
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
                            oldEmail: $("#oldEmail").text(),
                            oldZnumber: $("#oldZnumber").text()
                        },
                        success: function (result) {
                            if (result == "Failed") {
                                alert("Update Failed!!");
                            }
                            else {
                                alert("Updated Succesfully");
                                if (firstname != "") {
                                    $("#firstnameLabel").text(firstname);
                                }
                                if (lastname != "") {
                                    $("#lastnameLabel").text(lastname);
                                }


                                document.cookie = "TAusername=" + email;
                            }
                        }
                    });
                });

            });

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
        </script>
    </body>

</html>