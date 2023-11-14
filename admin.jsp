<!DOCTYPE html>
<html lang="en">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        #sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            background-color: purple;
            padding-top: 20px;
            color: black;
            display: flex;
            flex-direction: column;
        }

        #sidebar h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        #sidebar a {
            padding: 10px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            transition: 0.3s;
            display: block;
        }

        #sidebar a:hover {
            background-color:  #d8baff;
        }

        #sidebar .sub-menu a {
            margin-bottom: 5px; /* Added bottom margin between submenu items */
        }

        #sidebar .sub-menu {
            padding-left: 20px;
            display: none;
            padding-top: 10px; /* Added space between submenu items */
        }

        #content {
            margin-left: 250px;
            padding: 16px;
        }

        #applications-content {
            display: none;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 16px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin-bottom: 8px;
        }

        .card p {
            margin: 0;
        }
        .custom-btn {
                 margin-right: 10px; /* Adjust the margin value as needed */
      }
      .style-background {
            background-color: #d8baff;
        }
    </style>
</head>
<body class="style-background">

<div id="sidebar">
    <h1 style="color: white;">Admin</h1>
        <a href="#" onclick="showApplications()">Applications</a>
    <a href="" onclick="toggleSubMenu('manageUsersSubMenu')">Manage Users</a>
    <div id="manageUsersSubMenu" class="sub-menu">
        <a href="" onclick="addremoveinstructor()">Manage Instructors</a>
        <a href="" onclick="addremovecommittee()">Manage TA Committee</a>
    </div>
    <a href="#">Manage Courses</a>
    <a href="#">Recommendations List</a>
    <a href="#">Final List</a>
</div>

<div id="applications-content">
    <div id="content">
        <h2>Applications</h2>
        <c:if test="${not empty applicationsList}">
            <c:forEach var="app" items="${applicationsList}" varStatus="loopCount">
                <div class="container">
                    <div class="jumbotron">
                        <div>
                            Application Number : ${app.taApplicationId}
                        </div><br>
                        <div>
                            Applicant name : ${app.firstname} ${app.lastname}
                        </div><br>
                        <div>
                            Department Name : ${app.departmentName}
                        </div><br>
                        <div>
                            Course Name : ${app.courseName}
                        </div><br>
                        <div>
                            Applicant Email : ${app.email}
                        </div><br>
                        <div>
                            Applicant Znumber : ${app.znumber}
                        </div><br>
                        <div>
                            Applicant cgpa : ${app.cgpa}
                        </div><br>
                        <div>
                            Graduation Date : ${app.graduationDate}
                        </div><br>
                        <div>
                            Present department : ${app.presentDepartmentName}
                        </div><br>
                        <div>
                            Education Level : ${app.educationLevel}
                        </div><br>
                        <div>
                            Recommended : ${app.recommended}
                        </div><br>
                        <div>
                            CV : ${app.cv}
                        </div><br>
                        <div>
                            Instructor feedback exists : ${app.instructorFeedbackExists}
                        </div><br>
                        <div>
                            instructor feedback name : ${app.instructorFeedbackName}
                        </div><br>
                        <div>
                            feedback course name : ${app.instructorFeedbackCourseName}
                        </div><br>
                        <div>
                            perf rating : ${app.performanceRating}
                        </div><br>
                        <div>
                            tech rating : ${app.technicalSkillRating}
                        </div><br>
                        <div>
                            communitn rating : ${app.communicationSkillRating}
                        </div><br>
                        <div>
                            instructor overall feedback : ${app.instructorOverallFeedback}
                        </div><br>
                        <hr>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>

</div>
<div id="manageInstructors-content">
    <div id="content">
        <h2>Manage Instructors</h2>
        <form id="addInstructorForm">
            <div class="form-group">
                <label for="instructorName">Name:</label>
                <input type="text" class="form-control" id="instructorName" name="instructorName" required>
            </div>

            <div class="form-group">
                <label for="instructorCourse">Course:</label>
                <input type="text" class="form-control" id="instructorCourse" name="instructorCourse" required>
            </div>

            <div class="form-group">
                <label for="instructorDepartment">Department:</label>
                <input type="text" class="form-control" id="instructorDepartment" name="instructorDepartment" required>
            </div> <br>

            <div class="d-flex">
                <button type="button" class="btn btn-primary custom-btn" onclick="addInstructor()">Add Instructor</button>
                <button type="button" class="btn btn-danger custom-btn" onclick="removeInstructor()">Remove Instructor</button>
                <button type="button" class="btn btn-secondary" onclick="displayInstructors()">Display Instructors</button>
            </div>
            
        </form>

    </div>
</div>
<div id="content">
<div id="instructorList">
    <table>
        <tr>
          <th>Nmae</th>
          <th>Course</th>
          <th>Department</th>
        </tr>
        <tr>
          <td>Hanchi</td>
          <td>software engineering</td>
          <td>CSE</td>
        </tr>
        <tr>
          <td>Richard</td>
          <td>Intro to DataScience</td>
          <td>DataScience</td>
        </tr>
        <tr>
          <td>Madhuri</td>
          <td>intro to psychology</td>
          <td>psychology</td>
        </tr>
        <tr>
          <td>Hari Kalva</td>
          <td>Machine Learning</td>
          <td>Robotics</td>
        </tr>
      </table>
</div>
</div>

<div id="manageCommittee-content">
    <div id="content">
        <h2>Manage Committee</h2>
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
            </div> <br>

            <div class="d-flex">
                <button type="button" class="btn btn-primary custom-btn" onclick="addCommitteeMember()">Add Committee Member</button>
                <button type="button" class="btn btn-danger custom-btn" onclick="removeCommitteeMember()">Remove Committee Member </button>
                <button type="button" class="btn btn-secondary" onclick="displayCommitteeMember()">Display Committee Members</button>
            </div>
            
        </form>
    </div>
</div>

<div id="content">
    <div id="CommitteeMemberList">
        <table>
            <tr>
              <th>Name</th>
              <th>Course</th>
              <th>Department</th>
            </tr>
            <tr>
              <td>Hanchi</td>
              <td>software engineering</td>
              <td>CSE</td>
            </tr>
            <tr>
              <td>Richard</td>
              <td>Intro to DataScience</td>
              <td>DataScience</td>
            </tr>
            <tr>
              <td>Madhuri</td>
              <td>intro to psychology</td>
              <td>psychology</td>
            </tr>
            <tr>
              <td>Hari Kalva</td>
              <td>Machine Learning</td>
              <td>Robotics</td>
            </tr>
          </table>
    </div>
    </div>

<script>
    function toggleSubMenu(subMenuId) {
        var subMenu = document.getElementById(subMenuId);
        if (subMenu.style.display === 'none') {
            subMenu.style.display = 'block';
        } else {
            subMenu.style.display = 'none';
        }
    }
    var applicationsContent = document.getElementById('applications-content');
        var manageInstructorsContent = document.getElementById('manageInstructors-content');
        var manageCommitteeContent = document.getElementById('manageCommittee-content');
        var intructorlist=document.getElementById('instructorList');
        var committeememberlist=document.getElementById('CommitteeMemberList');
        committeememberlist.style.display = 'none';
        intructorlist.style.display = 'none';
        applicationsContent.style.display = 'none';
        manageInstructorsContent.style.display = 'none';
        manageCommitteeContent.style.display='none';
    function showApplications() {
        var applicationsContent = document.getElementById('applications-content');
        var manageInstructorsContent = document.getElementById('manageInstructors-content');
        var manageCommitteeContent = document.getElementById('manageCommittee-content');
        var intructorlist=document.getElementById('instructorList');
        var committeememberlist=document.getElementById('CommitteeMemberList');
        committeememberlist.style.display = 'none';
        intructorlist.style.display = 'none';
        applicationsContent.style.display = 'block';
        manageInstructorsContent.style.display = 'none';
        manageCommitteeContent.style.display='none';
        
    }
    function addremoveinstructor() {
        var applicationsContent = document.getElementById('applications-content');
        var manageInstructorsContent = document.getElementById('manageInstructors-content');
        var manageCommitteeContent = document.getElementById('manageCommittee-content');
        var intructorlist=document.getElementById('instructorList');
        var committeememberlist=document.getElementById('CommitteeMemberList');
        committeememberlist.style.display = 'none';
        intructorlist.style.display = 'none';
        manageInstructorsContent.style.display = 'block';
        applicationsContent.style.display = 'none';
        manageCommitteeContent.style.display='none';
       
    }
    function addremovecommittee() {
        var applicationsContent = document.getElementById('applications-content');
        var manageInstructorsContent = document.getElementById('manageInstructors-content');
        var manageCommitteeContent = document.getElementById('manageCommittee-content');
        var intructorlist=document.getElementById('instructorList');
        var committeememberlist=document.getElementById('CommitteeMemberList');
        committeememberlist.style.display = 'none';
        intructorlist.style.display = 'none';
        manageInstructorsContent.style.display = 'none';
        applicationsContent.style.display = 'none';
        manageCommitteeContent.style.display='block';
       
    }
    function displayInstructors() {
        var applicationsContent = document.getElementById('applications-content');
        var manageInstructorsContent = document.getElementById('manageInstructors-content');
        var manageCommitteeContent = document.getElementById('manageCommittee-content');
        var intructorlist=document.getElementById('instructorList');
        var committeememberlist=document.getElementById('CommitteeMemberList');
        committeememberlist.style.display = 'none';
        intructorlist.style.display = 'block';
        manageInstructorsContent.style.display = 'none';
        applicationsContent.style.display = 'none';
        manageCommitteeContent.style.display='none';
       
    }
    function displayCommitteeMember() {
        var applicationsContent = document.getElementById('applications-content');
        var manageInstructorsContent = document.getElementById('manageInstructors-content');
        var manageCommitteeContent = document.getElementById('manageCommittee-content');
        var intructorlist=document.getElementById('instructorList');
        var committeememberlist=document.getElementById('CommitteeMemberList');
        committeememberlist.style.display = 'block';
        intructorlist.style.display = 'none';
        manageInstructorsContent.style.display = 'none';
        applicationsContent.style.display = 'none';
        manageCommitteeContent.style.display='none';
       
    }

</script>

</body>
</html>
