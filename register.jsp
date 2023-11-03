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
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="mx-auto col-10 col-md-8 col-lg-6">
        <br />
        <div>
          <h2 class="text-center"><b>TA Applicant Sign up</b></h2>
        </div>
        <form name="register" id="registerform" method="get">

          <div class="form-group">
            <input class="form-control" placeholder="firstname" required="true" name="firstname" type="text"
              id="firstname" />
          </div>
          <div class="form-group">
            <input class="form-control" placeholder="lastname" name="lastname" type="text" id="lastname" />
          </div>
          <div class="form-group">
            <input class="form-control" placeholder="email" required="true" name="email" type="text" id="email" />
          </div>
          <div class="form-group">
            <input class="form-control" placeholder="znumber" required="true" name="znumber" type="text" id="znumber" />
          </div>
          <div class="form-group">
            <input class="form-control" placeholder="password" required="true" name="password" type="password"
              id="password" />
          </div>
          <div class="form-group">
            <input class="form-control" placeholder="confirm password" required="true" name="confirmpassword"
              type="password" id="confirmpassword" />
          </div>

          <div>
            <a href="#" id="loginLink">have an account already ? Login here</a>
          </div>
          <br>
          <button type="submit" name="submitbutton" class="registerBtn btn btn-primary">Register</button>
        </form>

      </div>
    </div>
  </div>
  <script>
    $(document).ready(function(){
				$('#registerform').click(function(event){
            event.preventDefault();
        });			
    });
    $("#loginLink").click(function(){
            window.location.href = "login.jsp";
        })
    $(".registerBtn").click(function () {
      var email = document.register.email.value;
      var atposition = email.indexOf("@");
      var dotposition = email.lastIndexOf(".");
      if (document.register.password.value.length < 1) {
        alert("Password should contain atleast 8 characters");
      }
      // else if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= email.length) {
      //   alert("Please enter a valid e-mail address");
      // }
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