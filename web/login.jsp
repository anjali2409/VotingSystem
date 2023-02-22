
<!doctype html>
<html lang="en">
    <head>
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
        
    </head>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <body class="text-center bg-dark">

        <jsp:include page="menu.jsp"></jsp:include>
        <main class="form-signin w-100 m-auto">
            <form action="Login" method="post">
                <img class="mb-4" src="images/flower-logo.jpg" alt="" width="200" height="200">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
                
                <h3 class="alert-danger">
                    <c:set var='error' value='${Error}'/>
                    ${error}
                </h3>

                <div class="form-floating">
                    <input name="emailAddress" type="emailAddress" class="form-control" id="floatingInput" placeholder="name@example.com" required>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input name="voterId" type="number" class="form-control" id="floatingInput2" placeholder="VoterId">
                    <label for="floatingInput2">VoterId</label>
                </div>

                <div class="checkbox mb-3">
                    <label style="color: white">
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                <p class="mt-5 mb-3 text-muted" style="color: white">&copy; 2017?2022</p>
            </form>
        </main>



    </body>
</html>
