<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        #registerLink {
            color: white;
        }

        label {
            color: white;
        }

        .form-group>input {
            width: 60%;
        }

        .form-group>select {
            width: 60%;
        }

        .jumbotron {
            width: 70%;
            padding-top: 3%;
            padding-bottom: 3%;
            border-radius: 30px;
        }

        .container {
            border-radius: 5%;
        }

        .container-fluid {
            /* height:20%; */
            padding: 1.5% 2%;
        }

        .navbar {
            width: 100%;
            padding: 0%;
            margin-bottom: 3%;
        }

        .loginBtn {
            background-color: #302244 !important;
        }
    </style>
</head>
<body>
    <center>
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid" style="background-color:#533b78;">
                <span class="navbar-brand mb-0 h1" style="color:white;">SIGN UP</span>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron" style="background-color: #a087c4;">
                <form name="register" id="registerform" method="get">
                  <div class="form-group">
                    <input class="form-control" placeholder="Enter your firstname" required="true" name="firstname" type="text"
                      id="firstname" />
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="Enter your lastname" name="lastname" type="text" id="lastname" />
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="Enter your email" required="true" name="email" type="text" id="email" />
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="Enter your znumber" required="true" name="znumber" type="text" id="znumber" />
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="Enter password" required="true" name="password" type="password"
                      id="password" />
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="Confirm password" required="true" name="confirmpassword"
                      type="password" id="confirmpassword" />
                  </div>
                  <br>
                  <br>
                  <p style="color:white;font-size: small;">
                      NOTE: Please select appropriate user type in the above dropdown
                  </p>
                  <div>
                      <a href="#login" id="loginLink" style="color:white;">Already have an account? Login here</a>
                  </div>
                  <br>
                  <button type="submit" name="registerBtn" class="btn btn-primary registerBtn" id="registerBtn"
                        style="background-color: #483366;color:white;">Register</button>
                </form>
            </div>
        </div>
    </center>
    <script>
        $(document).ready(function () {
            $('#registerForm').click(function (event) {
                event.preventDefault();
            });
            $('#loginLink').click(function () {
                window.location.href = "login.jsp";
            });
        });
        $("#registerLink").click(function () {
            window.location.href = "register.jsp";
        })
        $(".registerBtn").click(function () {
            var email = document.register.email.value;
            var atposition = email.indexOf("@");
            var dotposition = email.lastIndexOf(".");
            if (document.register.password.value.length < 1) {
              alert("Password should contain atleast 8 characters");
            }
            else if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= email.length) {
              alert("Please enter a valid e-mail address");
            }
            else if ($("#password").val() != $("#confirmpassword").val()) {
              alert("Password and confirm password didn't match!!");
            }
            else {
              $.ajax({
                type: "GET",
                url: "register",
                data: {
                  firstname: $("#firstname").val(),
                  lastname: $("#lastname").val(),
                  email: $("#email").val(),
                  znumber: $("#znumber").val(),
                  password: $("#password").val()
                },
                success: function (result) {
                  if (result == "exists") {
                    alert("User already exists!!");
                  }
                  else if (result == "success") {
                    window.location.href = "login.jsp";
                  }
                  else {
                    alert(result);
                  }
                }
              });
            }
        });
    </script>
</body>
</html>