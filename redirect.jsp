<%-- 
    Document   : redirect
    Created on : 23 Feb, 2020, 4:58:23 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="home" method="post" id="formId">
            
        </form>
    </body>
    <script type="text/javascript">
        submitForm();
        function submitForm(){
             document.getElementById("formId").submit();
        }
       
    </script>
</html>
