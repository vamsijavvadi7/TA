<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta name="viewport" content="width=device-width initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet" />
    
    <meta name="viewport" content="width=device-width" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }
    
            * {
                box-sizing: border-box;
            }
    
            /* Create a column layout with Flexbox */
            .row {
                display: flex;
            }
    
            /* Left column (menu) */
            .left {
                flex: 35%;
                padding: 15px 0;
            }
    
            .left h2 {
                padding-left: 8px;
            }
    
            /* Right column (page content) */
            .right {
                flex: 65%;
                padding: 15px;
            }
    
            /* Style the search box */
            #mySearch {
                width: 100%;
                font-size: 18px;
                padding: 11px;
                border: 1px solid #ddd;
            }
    
            /* Style the navigation menu inside the left column */
            #myMenu {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }
    
            #myMenu li a {
                padding: 12px;
                text-decoration: none;
                color: black;
                display: block
            }
    
            #myMenu li a:hover {
                background-color: #eee;
            }
    
            .navbar-brand {
                cursor: default;
            }
            .btn
            {
                margin-bottom: 7px;
            }

            .alin{
               text-align: left;
            }

        </style>
</head>

<body>
    <center>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Admin Panel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                    <!-- <li class="nav-item active">
                        <a class="nav-link" href="#" id="applicationsLink">Applications <span class="sr-only">(current)</span></a>
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="applicationsLink">Applications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="manageUsersLink">Manage users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="manageCoursesLink">Manage Courses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="recommendationsLink">Recommendations List</a>
                    </li>
                    <li class="nav-item" id="finalListLink">
                        <a class="nav-link" href="#">Final list</a>
                    </li>
                </ul>
                <span class="navbar-text">
                    Logout
                </span>
            </div>
        </nav>
    
        <br><br>
        <div class="container">
            <div class="jumbotron">
                <div id="applicationsPage">
                    <c:forEach var=" " items="${applicationsList}">
                    </c:forEach>
                    <div class="application-card">
                        <div class="card text-black mb-3" style="max-width: 56rem;">
                            <div class="alin card-header">Application</div>
                            <div class="card-body">
                              <!-- <h5 class="card-title">TA Application</h5> -->
                              <p class="alin card-text" >
                               <b>First Name:</b> <br>
                               Kiran Sai Madhuri <br>
                              <b>Email:</b> <br>
                              ragukiransaimadhuri@gmail.com  <br>
                              <b>Z-Number:</b> <br>
                                z23748548 <br>
                              <b>CGPA:</b> <br>
                                10  <br>
                                <b>Course:</b> <br>
                                Bachelors <br>
                               <b>graduation_date:</b> <br>
                                2022 <br>
                                <b>cv:</b> <br>
                                download <br>
                               <b>previous_experience</b><br>
                                1 year <br>
                                <b>exp_course:</b> <br>
                                SoftwareEngineering <br>
                                <b>exp_duration </b> <br>
                                1 year <br>
                                <b>recommended:</b> <br>
                                 yes <br> </p>
                            </div>
                          </div>
                    </div>
                </div>
    
                <div id="manageUsersPage">
                    
                    <table id ="instructorsTable" class="table" style="display:none">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">instructordept</th>
                                <th scope="col">coursename</th>
                                <th scope="col">instructor name</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>CSE</td>
                                <td>SoftwareEngineering</td>
                                <td>Hanchi</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>DataScience</td>
                                <td>IntrotoDataScience</td>
                                <td>Richard</td>
                            </tr>
                        </tbody>
                    </table>
                    <div id = "addDelete" style="display:none">
                    <div>
                        <button  class="btn btn-primary">add instructor</button>
                    </div>
                    <div>
                        <button class="btn btn-danger">remove instructor</button>
                    </div>

                  </div>




                  <table id ="manageCommittee" class="table" style="display:none">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">committeemember name</th>
                            <th scope="col">dept</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Hanchi</td>
                            <td>CSE</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Richard</td>
                            <td>DataScience</td>
                           
                        </tr>
                    </tbody>
                </table>
                <div id = "addDeletecommittee" style="display:none">
                <div>
                    <button  class="btn btn-primary">add committee</button>
                </div>
                <div>
                    <button class="btn btn-danger">remove committee</button>
                </div>

              </div>
                    
   


                    <button  class="btn btn-primary" id="manageInstructors">Manage Instructors</button>
                    <button id="manageApplicants" class="btn btn-primary">Manage Applicants</button>
                    <button  id=" manageTA" class="btn btn-primary">Manage TA committee</button>
                </div>
    
                <div id="manageCoursesPage">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Deptname</th>
                                <th scope="col">Coursename</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>CSE</td>
                                <td>SoftwareEngineering</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>DataScience</td>
                                <td>IntrotoDataScience</td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <button  class="btn btn-primary">Add course</button>
                    </div>
                    <div>
                        <button class="btn btn-danger">Delete course</button>
                    </div>
                </div>
    
                <div id="recommendationsPage">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Applicantname</th>
                                <th scope="col">Coursename</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>madhuri</td>
                                <td>SoftwareEngineering</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>vamsi</td>
                                <td>IntrotoDataScience</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>charan</td>
                                <td>SoftwareEngineering</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>JayKrishna</td>
                                <td>IntrotoDataScience</td>
                            </tr>
                        </tbody>
                    </table>
    
                </div>
    
                <div id="finalListPage">
                    <button  class="btn btn-primary">send notifications</button>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Applicantname</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>madhuri</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>vamsi</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>charan</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>JayKrishna</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    
    </center>
   
    <script>
        $(document).ready(function () {
            $("#manageUsersPage").hide();
            $("#manageCoursesPage").hide();
            $("#manageUsersPage").hide();
            $("#recommendationsPage").hide();
            $("#finalListPage").hide();
        });
        $("#applicationsLink").click(function () {
            $("#applicationsPage").show();
            $("#manageUsersPage").hide();
            $("#manageCoursesPage").hide();
            $("#recommendationsPage").hide();
            $("#finalListPage").hide();
        });
        $("#manageUsersLink").click(function () {
            $("#manageUsersPage").show();
            $("#applicationsPage").hide();
            $("#manageCoursesPage").hide();
            $("#recommendationsPage").hide();
            $("#finalListPage").hide();
        });
        $("#manageCoursesLink").click(function () {
            $("#manageUsersPage").hide();
            $("#applicationsPage").hide();
            $("#manageCoursesPage").show();
            $("#recommendationsPage").hide();
            $("#finalListPage").hide();
        });
        $("#recommendationsLink").click(function () {
            $("#manageUsersPage").hide();
            $("#applicationsPage").hide();
            $("#manageCoursesPage").hide();
            $("#recommendationsPage").show();
            $("#finalListPage").hide();
        });
        $("#finalListLink").click(function () {
            $("#manageUsersPage").hide();
            $("#applicationsPage").hide();
            $("#manageCoursesPage").hide();
            $("#recommendationsPage").hide();
            $("#finalListPage").show();
        });
        $("#manageInstructors").click(function () {
            $("#instructorsTable").show();
            $("#addDelete").show();
            $("#manageCommittee").hide();
            $("#addDeletecommittee").hide();
            
        
        });
        $("#manageTA").click(function () {
            $("#instructorsTable").hide();
            $("#addDelete").hide();
            $("#manageCommittee").show();
            $("#addDeletecommittee").show();
            
        
        });

    </script>
</body>

</html>


























