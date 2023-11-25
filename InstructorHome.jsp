<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard</title>

    <!-- Bootstrap CSS -->
   

    <style>
        /* Global styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: purple;
            color: white;
            padding: 15px;
            text-align: center;
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
        .modal {
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

        .modal-content {
            background-color: #fefefe;
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

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Styling for TA list and form */
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

        /* Additional styles for feedback details modal */
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
    <!-- Navbar -->
    <nav class="navbar">
        <div class="navbar-brand">Instructor Dashboard</div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1>List of TAs</h1>
        <ul id="taList">
           
            <!-- TA list items will be dynamically added here -->
        </ul>
    </div>

    <!-- Feedback Form Modal -->
    <div id="feedbackModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Feedback Form</h2>
            <form id="feedbackForm">
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

    <div id="feedbackDetailsModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Submitted Feedback Details</h2>
            <div id="feedbackDetailsContent"></div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  

    <!-- Your previous HTML and CSS styles remain unchanged -->

<script>
    // Sample TA data (replace with actual data)
    const taData = [
        { name: 'TA1', id: 1, },
        { name: 'TA2', id: 2, },
        { name: 'TA3', id: 3, }
    ];
   
//     var taData = [];

// <c:forEach items="${taList}" var="data" varStatus="loop">
//     var dataObject = {};
//     dataObject["id"] = "${data.taId}";
//     dataObject["name"] = "${data.taName}";
//     dataObject["instructorId"] = "${data.instructorId}";
//     dataObject["taApplicantId"] = "${data.taApplicantId}";
//     dataObject["courseId"] = "${data.courseId}";
//     dataObject["departmentId"] = "${data.departmentId}";
//     dataObject["email"] = "${data.email}";
//     dataObject["taApplicationId"] = "${data.taApplicationId}";
//     dataObject["offerSent"] = "${data.offerSent}";
//     dataObject["offerStatus"] = "${data.offerStatus}";
//     taData.push(dataObject);
    
// </c:forEach>s

// console.log(taData);



                  
                    



    var taReview = [
        {
            id: 'ta1',
            name:'TA1',
            technicalSkill: 3,
            communicationSkill: 4,
            overallFeedback: "hes good he done this job good"
        }
    ]


//     var taReview = [];

// <c:forEach items="${taFeedbackList}" var="data">
//     var dataObject = {};
//     dataObject["id"] = "${data.taId}";
//     dataObject["name"] = "${data.taName}";
//     dataObject["instructorId"] = "${data.instructorId}";
//     dataObject["taApplicantId"] = "${data.taApplicantId}";
//     dataObject["courseId"] = "${data.courseId}";
//     dataObject["departmentId"] = "${data.departmentId}";
//     dataObject["email"] = "${data.email}";
//     dataObject["offerSent"] = "${data.offerSent}";
//     dataObject["offerStatus"] = "${data.offerStatus}";
//     dataObject["instructorFeedbackId"] = "${data.instructorFeedbackId}";
//     dataObject["instructorName"] = "${data.instructorName}";
//     dataObject["performanceRating"] = "${data.performanceRating}";
//     dataObject["technicalSkill"] = "${data.technicalSkill}";
//     dataObject["communicationSkill"] = "${data.communicationSkill}";
//     dataObject["overallFeedback"] = "${data.overallFeedback}";
//     taReview.push(dataObject);
// </c:forEach>

// console.log(taReview);


    // Function to create TA list items
  
function createTAList() {
    const taListContainer = document.getElementById('taList');
    taListContainer.innerHTML = ''; // Clear existing list before appending new items

    taData.forEach(ta => {
        const listItem = document.createElement('li');
        listItem.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');
        listItem.innerHTML = `
            <span>${ta.name}</span>
            <button class="review-btn btn btn-secondary" data-ta-id="${ta.id}">Review Now</button>
        `;
        taListContainer.appendChild(listItem);
    });
}

    // Function to check if TA review is already submitted
    function checkIfReviewSubmitted(taId) {
        const submittedReview = taReview.find(review => review.id === taId);
        return submittedReview;
    }


    function displayFeedbackDetails(taId, submissionDetails) {
        const feedbackDetailsModal = document.getElementById('feedbackDetailsModal');
        const feedbackDetailsContent = document.getElementById('feedbackDetailsContent');
        feedbackDetailsContent.innerHTML = `
            <p>Feedback already submitted for ${taId}:</p>
            <p>${submissionDetails}</p>
        `;
        feedbackDetailsModal.style.display = 'block';

        // Close the feedback details modal on close button click
        const closeBtn = document.getElementsByClassName('close')[1]; // Get the second close button for the feedback details modal
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

    // Updated function to display feedback form or submitted details on button click
    document.addEventListener('click', function (e) {
    if (e.target && e.target.classList.contains('review-btn')) {
        const taId = e.target.dataset.taId;
        const modal = document.getElementById('feedbackModal');
        const submittedReview = checkIfReviewSubmitted(taId);

        
        if (submittedReview) {
            // Display submitted details in the feedback details modal
            const submissionDetails = `Technical Skills: ${submittedReview.technicalSkill}<br>
             Communication Skills: ${submittedReview.communicationSkill}<br>
             Overall Feedback: ${submittedReview.overallFeedback}`;
            displayFeedbackDetails(taId, submissionDetails);
        }else {
                // Display feedback form
                modal.style.display = 'block';
               
                // Handle form submission
                const feedbackForm = document.getElementById('feedbackForm');
                feedbackForm.addEventListener('submit', function (event) {
                    event.preventDefault();
                    const technicalSkill = document.getElementById('technicalSkill').value;
                    const communicationSkill = document.getElementById('communicationSkill').value;
                    const overallFeedback = document.getElementById('overallFeedback').value;

                    // Add submission to taReview list
                    taReview.push({
                        id: taId,
                        technicalSkill,
                        communicationSkill,
                        overallFeedback
                    });

                    // Close the modal after submission
                    modal.style.display = 'none';
                    feedbackForm.reset();
                });

                // Close the modal on close button click
                const closeBtn = document.getElementsByClassName('close')[0];
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

  

    // Create TA list on page load
    document.addEventListener('DOMContentLoaded', createTAList);
</script>

</body>

</html>
