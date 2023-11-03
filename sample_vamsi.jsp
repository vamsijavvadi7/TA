<%-- 
    Document   : redirect
    Created on : 23 Feb, 2020, 4:58:23 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
</head>
<body>
    <div class="container-fluid">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Dashboard</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal">Profile</a>
                </li>
            </ul>
        </nav>

        <!-- Department List Dropdown -->
        <div class="form-group">
            <label for="department">Select Department:</label>
            <select class="form-control" id="department">
                <option value="department1">Department 1</option>
                <option value="department2">Department 2</option>
                <!-- Add more department options here -->
            </select>
        </div>

        <!-- Course List Dropdown (Initially hidden) -->
        <div class="form-group" id="courseList" style="display: none;">
            <label for="course">Select Course:</label>
            <select class="form-control" id="course">
                <!-- Populate courses based on the selected department using JavaScript -->
            </select>
        </div>
    </div>

    <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
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
                            <textarea class="form-control" id="address" rows="3" placeholder="Enter your address"></textarea>
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
	$(document).ready(function () {
    // Populate the course list based on the selected department
    $("#department").change(function () {
        var selectedDepartment = $(this).val();
        // You can fetch course data based on the selected department and populate the course list here.
        // For now, let's assume you have an array of courses.
        var courses = {
            department1: ["Course A", "Course B"],
            department2: ["Course X", "Course Y"],
        };
        var courseList = courses[selectedDepartment];
        var courseDropdown = $("#course");
        courseDropdown.empty();
        if (courseList) {
            courseDropdown.append("<option value=''>Select Course</option>");
            $.each(courseList, function (index, course) {
                courseDropdown.append("<option value='" + course + "'>" + course + "</option>");
            });
            $("#courseList").show();
        } else {
            $("#courseList").hide();
        }
    });

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
});

	
	</script>
</body>
</html>
