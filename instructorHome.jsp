<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard</title>
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
        .navbar {
            background-color: #036 !important;
            color: white;
            padding: 15px;
            text-align: center;
        }
        nav {
            padding: 10px;
            position: sticky;
            top: 0;
        }
        .navbar-text {
            cursor: pointer;
            color:white !important;
            text-align:right;
        }
        .navbar-brand {
            cursor: default;
            color: #e6e6e6 !important;
            font-weight: 900;
        }
        .nav-link{
            color:white !important;
        }
        .dash {
            background-color: #036 !important;
            color: white !important;
        }
        .container {
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }







/* Modal styles */
.modal-review {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color:#d9ecff;
            overflow: auto;
        }

        .modal-content-review {
            background-color:#d9ecff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 60%;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            animation-name: modalopen;
            animation-duration: 0.3s;
        }

        @keyframes modalopen {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .close-review {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close-review:hover,
        .close-review:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

 






        #taList {
            list-style: none;
            padding: 0;
        }
        #taList li {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .review-btn {
            background-color: #6c757d;
            border: none;
            color: #fff;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }
        .review-btn:hover {
            background-color: #495057;
        }
        .form-label {
            font-weight: bold;
        }
        .form-input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .form-textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            resize: vertical;
        }
        .form-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-submit:hover {
            background-color: #0056b3;
        }
        #feedbackDetailsModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            overflow: auto;
        }
        #feedbackDetailsContent {
            margin-top: 20px;
            padding: 20px;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            animation-name: modalopen;
            animation-duration: 0.3s;
        }
    </style>
</head>
<body>
    <nav class="dash navbar navbar-expand-lg navbar-light bg-light" style="background-color:#036 !important;color:white !important;padding: 10px 20px;">
        <a class="dash navbar-brand" href="#">Instructor Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#Profile" data-toggle="modal" data-target="#profileModal"
                        id="profileLink"><i class="fa-solid fa-user fa-lg"></i></a>
                </li>
            </ul>
            <span class="navbar-text">
                <div onclick="logout()">
                    Logout <i class="fa-solid fa-right-from-bracket"></i>
                </div>
            </span>
        </div>
    </nav>
    <div class="container"  style="background-color:#d9ecff !important;">
        <center>
            <h2>TAs</h2>
            <ul id="taList"></ul>
        </center>
    </div>
    <div id="feedbackModal" class="modal-review">
        <div class="modal-content-review">
            <span class="close-review">&times;</span>
            <h2>Feedback Form</h2>
            <form id="feedbackForm" method="POST" name="feedbackForm">
                <div class="mb-3">
                    <label class="form-label" for="technicalSkill">Technical Skills:</label>
                    <input type="number" id="technicalSkill" name="technicalSkill" min="1" max="10"
                        class="form-input" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="communicationSkill">Communication Skills:</label>
                    <input type="number" id="communicationSkill" name="communicationSkill" min="1" max="10"
                        class="form-input" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="performanceRating">Performance Rating:</label>
                    <input type="number" id="performanceRating" name="performanceRating" min="1" max="10"
                        class="form-input" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="overallFeedback">Overall Feedback:</label>
                    <textarea id="overallFeedback" name="overallFeedback" rows="4" class="form-textarea"
                        required></textarea>
                </div>
                <div class="mb-3">
                    <input type="submit" value="Submit" class="form-submit">
                </div>
            </form>
        </div>
    </div>
    <div id="feedbackDetailsModal" class="modal-review">
        <div class="modal-content-review">
            <span class="close-review">&times;</span>
            <h2>Submitted Feedback Details</h2>
            <div id="feedbackDetailsContent"></div>
        </div>
    </div>
    <div id="profileModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel"
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
                                <label for="email" id="oldEmail">${email}</label>
                                <input type="email" class="form-control" id="email" placeholder="Update your email" />
                            </div>
                            <div class="form-group">
                                <label for="password">${password}</label>
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script>
    var taData = [];
    var course_id=0;
    var department_id=0;
    var instructorId=0;
    <c:forEach items="${taList}" var="data" varStatus="loop">
        var dataObject = {};
        dataObject["id"] = "${data.taId}";
        dataObject["name"] = "${data.taName}";
        dataObject["instructorId"] = "${data.instructorId}";
        dataObject["taApplicantId"] = "${data.taApplicantId}";
        dataObject["courseId"] = "${data.courseId}";
        dataObject["departmentId"] = "${data.departmentId}";
        dataObject["email"] = "${data.email}";
        dataObject["taApplicationId"] = "${data.taApplicationId}";
        dataObject["offerSent"] = "${data.offerSent}";
        dataObject["offerStatus"] = "${data.offerStatus}";
        taData.push(dataObject);
    </c:forEach>

    course_id=taData[0].courseId;
    department_id=taData[0].departmentId;
    instructorId=taData[0].instructorId;
    var taReview = [];
    var instructorName = '<%=request.getAttribute("instructorName")%>';
    <c:forEach items="${taFeedbackList}" var="data">
        var dataObject = {};
        dataObject["id"] = "${data.taId}";
        dataObject["name"] = "${data.taName}";
        dataObject["instructorId"] = "${data.instructorId}";
        dataObject["taApplicantId"] = "${data.taApplicantId}";
        dataObject["courseId"] = "${data.courseId}";
        dataObject["departmentId"] = "${data.departmentId}";
        dataObject["email"] = "${data.email}";
        dataObject["offerSent"] = "${data.offerSent}";
        dataObject["offerStatus"] = "${data.offerStatus}";
        dataObject["instructorFeedbackId"] = "${data.instructorFeedbackId}";
        dataObject["instructorName"] = "${data.instructorName}";
        dataObject["performanceRating"] = "${data.performanceRating}";
        dataObject["technicalSkill"] = "${data.technicalSkill}";
        dataObject["communicationSkill"] = "${data.communicationSkill}";
        dataObject["overallFeedback"] = "${data.overallFeedback}";
        taReview.push(dataObject);
    </c:forEach>

    function createTAList() {
        var taListContainer = document.getElementById('taList');
        taListContainer.innerHTML = '';
        taData.forEach(ta => {
            var listItem = document.createElement('li');
            listItem.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');
            listItem.innerHTML = `
                <span>`+ta.name+`</span>
                <button class="review-btn btn btn-secondary" data-ta-id="`+ta.id+`">Review Now</button>
            `;
            taListContainer.appendChild(listItem);
        });
    }
    function checkIfReviewSubmitted(taId) {
        var submittedReview = taReview.find(review => review.id === taId);
        return submittedReview;
    }
    function displayFeedbackDetails(taName, submissionDetails) {
        const feedbackDetailsModal = document.getElementById('feedbackDetailsModal');
        const feedbackDetailsContent = document.getElementById('feedbackDetailsContent');
        feedbackDetailsContent.innerHTML = `
            <p>Feedback already submitted</p>
            <p>`+submissionDetails+`</p>
        `;
        
        feedbackDetailsModal.style.display = 'block';
        // Close the feedback details modal on close button click
        const closeBtn = document.getElementsByClassName('close-review')[1];
         // Get the second close button for the feedback details modal
        
         closeBtn.onclick = function () {
            feedbackDetailsModal.style.display = 'none';
        };
        // Close the feedback details modal on clicking outside the modal content
        window.onclick = function (event) {
            if (event.target == feedbackDetailsModal) {
                feedbackDetailsModal.style.display = 'none';
            }
        };
    }

    $("#updateProfile").click(function () {
        var firstname = $("#firstname").val();
        var lastname = $("#lastname").val();
        var email = $("#email").val();
        var password = $("#password").val();
        $.ajax({
            type: "POST",
            url: "profileUpdate",
            data: {
                firstname: firstname,
                lastname: lastname,
                usertype: "instructor",
                newEmail: email,
                password: password,
                oldEmail: $("#oldEmail").text()
            },
            success: function (result) {
                if (result == "failed") {
                    alert("Failed to update profile!");
                }
                else if(result == "success"){
                    alert("Updated Succesfully");
                    if (firstname != "") {
                        $("#firstnameLabel").text(firstname);
                    }
                    if (lastname != "") {
                        $("#lastnameLabel").text(lastname);
                    }
                    if(email!=null && email!=""){
                        document.cookie = "TAusername=" + email;
                    }
                }else{
                    alert("No changes made to update");
                }
            }
        });
    });               
    
    document.addEventListener('click', function (e) {
        if (e.target && e.target.classList.contains('review-btn')) 
        {
            const taId = e.target.dataset.taId;
            const modal = document.getElementById('feedbackModal');
            const submittedReview = checkIfReviewSubmitted(taId);
            if (submittedReview) {
                // Display submitted details in the feedback details modal
                const submissionDetails = `<label><b>Technical Skills:</b> </label><br> `+submittedReview.technicalSkill+`/10<br>
                <label><b>Communication Skills:</b> </label><br> `+ submittedReview.communicationSkill+`/10<br>
                <label><b>Overall Feedback:</b> </label><br> ` +submittedReview.overallFeedback+`<br>
                <label><b>Performance Rating:</b> </label><br> `+submittedReview.performanceRating +`/10`;

                displayFeedbackDetails(submittedReview.name, submissionDetails);
            } else {
                // Display feedback form
                modal.style.display = 'block';
                // Handle form submission
                const feedbackForm = document.getElementById('feedbackForm');
                feedbackForm.addEventListener('submit', function (event) {
                    event.preventDefault();
                    const technicalSkill = document.getElementById('technicalSkill').value;
                    const communicationSkill = document.getElementById('communicationSkill').value;
                    const overallFeedback = document.getElementById('overallFeedback').value;
                    const performanceRating = document.getElementById('performanceRating').value;
                    // Add submission to taReview list
                    taReview.push({
                        id: taId,
                        technicalSkill,
                        communicationSkill,
                        overallFeedback,
                        performanceRating
                    });

                    // Send data to the server using AJAX
                    if (technicalSkill !== "" && communicationSkill !== "" && performanceRating !== "" && overallFeedback !== "") {
                        $.ajax({
                            type: "POST",
                            url: "addInstructorFeedback",
                            data: {
                                technicalSkill,
                                communicationSkill,
                                performanceRating,
                                overallFeedback,
                                course_id,
                                department_id,
                                instructorId,
                                instructorName,
                                taId
                            },
                            success: function (result) {
                                console.log('Success');
                                if (result === "success") {
                                    alert("Feedback submitted successfully");
                                } else {
                                    alert("Feedback submission failed");
                                }
                            },
                            error: function (err) {
                                alert("ERROR: " + err);
                            }
                        });
                    }

                    // Close the modal after submission
                    modal.style.display = 'none';
                    feedbackForm.reset();
                });
                // Close the modal on close button click
                const closeBtn = document.getElementsByClassName('close-review')[0];
                closeBtn.onclick = function () {
                    modal.style.display = 'none';
                };
                // Close the modal on clicking outside the modal content
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = 'none';
                    }
                };
            }
        }
    });
    document.addEventListener('DOMContentLoaded', createTAList);
    function logout() {
        alert("Logging out!!");
        document.cookie = "TAusername=na";
        window.location.href = "login.jsp";
    }
</script>
</body>
</html>