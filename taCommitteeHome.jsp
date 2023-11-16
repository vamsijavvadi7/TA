<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>TA Committee</title>
        <!-- Add Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            /* Custom CSS */
            body {
                background-color: #f4f4f4;
            }

            .container {
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

            .application-table {
                max-width: 100%;
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

            .dash {
                background-color: #533B78 !important;
                color: white !important;
            }

            /* Updated styles for the filter dropdown */
            .filter-dropdown {
                position: fixed;
                top: 20px;
                /* Adjust the top position according to your needs */
                right: 20px;
                /* Adjust the right position according to your needs */
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                display: none;
                z-index: 1000;
                max-width: 400px;
                /* Set your desired maximum width */
                width: 100%;
                /* Make the dropdown take the full width */
                text-align: center;
                /* Center the content within the dropdown */
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
                position: fixed;
                top: 20px;
                font-size: 1.5em;
                z-index: 1000;
            }
        </style>
    </head>

    <body>

        <div class="container-fluid">
            <!-- Navbar -->
            <nav class="dash navbar navbar-expand-lg navbar-light bg-light">
                <a class="dash navbar-brand" href="#">Dashboard</a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="dash nav-link" href="#" data-toggle="modal" data-target="#profileModal">Profile</a>
                    </li>
                </ul>
            </nav>


            <div class="application-table container">
                <div class="jumbotron" id="jumbotronBox">

                    <h1 class="text-center my-4">TA Applications</h1>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Status <i class="filter-icon fas fa-filter third-column" id="filterIcon"></i></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="taApplicationsListTableBody">
                            <!-- Table rows will be dynamically added here -->
                        </tbody>
                    </table>


                    <!-- Filter Dropdown -->
                    <div class="filter-dropdown third-column" id="filterDropdown">
                        <div class="mb-3 dropdown">
                            <label for="departmentDropdown" class="form-label">Select Department:</label>
                            <select class="form-select" id="departmentDropdown">
                                <option value="all">All Departments</option>
                                <!-- Add more departments as needed -->
                            </select>
                        </div>

                        <div class="mb-3 dropdown">
                            <label for="courseDropdown" class="form-label">Select Course:</label>
                            <select class="form-select" id="courseDropdown">
                                <option value="all">All Courses</option>
                                <!-- Add more courses as needed -->
                            </select>
                        </div>

                        <div class="mb-3 dropdown">
                            <label for="statusDropdown" class="form-label">Select Status:</label>
                            <select class="form-select" id="statusDropdown">
                                <option value="all">All Status</option>
                                <!-- Add more statuses as needed -->
                            </select>
                        </div>

                        <button class="btn btn-primary" id="applyFilters">close</button>
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
                                    <input type="text" class="form-control" id="znumber"
                                        placeholder="Enter your Z Number">
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
                            <!-- Application details will be dynamically added here -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" id="acceptApplication">Accept</button>
                            <button type="button" class="btn btn-danger" id="rejectApplication">Reject</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Add Bootstrap and jQuery JS -->
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <!-- Add JavaScript to handle dropdown changes and filter table -->
            <script>
                $(document).ready(function () {
                    // Sample data (you can load this dynamically from a database or API)
                    // var taApplications = [
                    //     { name: "John Doe", email: "johndoe@example.com", status: "to-be-reviewed", department: "cs", course: "cs101", level: "Undergraduate", graduationDate: "2023-05-01", cv: "JohnDoe_CV.pdf", workExperience: "Intern at XYZ Corp", experienceMonths: 12 },
                    //     { name: "Jane Smith", email: "janesmith@example.com", status: "accepted", department: "ee", course: "ee202", level: "Graduate", graduationDate: "2022-12-01", cv: "JaneSmith_CV.pdf", workExperience: "Research Assistant at ABC University", experienceMonths: 24 },
                    //     { name: "Bob Johnson", email: "bobjohnson@example.com", status: "rejected", department: "cs", course: "cs101", level: "Undergraduate", graduationDate: "2023-08-01", cv: "BobJohnson_CV.pdf", workExperience: "Freelance Developer", experienceMonths: 18 }
                    // ];
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

                    var uniqueDepartments = [...new Set(taApplicationsList.map(app => app.departmentName))];
                    var departmentDropdown = $("#departmentDropdown");
                    uniqueDepartments.forEach(department => {
                        departmentDropdown.append("<option value='" + department + "'>" + department + "</option>");
                    });

                    // Populate unique course names in the course dropdown
                    var uniqueCourses = [...new Set(taApplicationsList.map(app => app.courseName))];
                    var courseDropdown = $("#courseDropdown");
                    uniqueCourses.forEach(course => {
                        courseDropdown.append("<option value='" + course + "'>" + course + "</option>");
                    });

                    // Populate unique status values in the status dropdown
                    var uniqueStatuses = [...new Set(taApplicationsList.map(app => app.status))];
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
                    $(document).on("click", "#acceptApplication", function () {
                        // Get the applicationData from the modal content
                        var applicationData = {
                            name: $("#applicationcontentdetailsname").text(),
                            // Add other properties as needed
                        };

                        // Update the status of the application to "accepted"
                        updateApplicationStatus(applicationData.name, "accepted");
                        // Close the modal
                        $("#applicationDetailsModal").modal("hide");

                        // Now you can use the applicationData as needed
                        console.log("Accepted application for: " + applicationData.name);
                    });

                    // Event listener for rejecting an application
                    $(document).on("click", "#rejectApplication", function () {
                        // Get the applicationData from the modal content
                        var applicationData = {
                            name: $("#applicationcontentdetailsname").text(),
                            // Add other properties as needed
                        };

                        // Update the status of the application to "rejected"
                        updateApplicationStatus(applicationData.name, "rejected");
                        // Close the modal
                        $("#applicationDetailsModal").modal("hide");
                    });

                    // Function to update the status of an application
                    function updateApplicationStatus(name, newStatus) {
                        // You can update the status on the server or in your data structure
                        // For now, let's update the status in the sample data
                        var application = taApplicationsList.find(function (app) {
                            return app.name === name;
                        });

                        if (application) {
                            application.status = newStatus;
                            // You can update the UI or perform additional actions as needed
                            renderTable();
                        }
                    }


                    // Filter Icon Click Event
                    $("#filterIcon").click(function () {
                        $("#filterDropdown").toggle();
                    });

                    // Apply Filters Event
                    $("#applyFilters").click(function () {
                        renderTable();
                        $("#filterDropdown").hide();
                    });



                });




            </script>
        </div>
    </body>

</html>