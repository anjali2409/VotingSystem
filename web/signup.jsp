<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.108.0">
        <title>Employee Management</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

        <link href="css/bootstrap.min.css" rel="stylesheet" >

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">


        <link href="css/signin.css" rel="stylesheet">


        <!-- Custom styles for this template -->
        <link href="sign-in.css" rel="stylesheet">
    </head>
    
    <body class="text-center bg-dark">
        <jsp:include page="menu.jsp"></jsp:include>
        <main class="form-signin w-100 m-auto">
            <form action="Signup" method="Post" id="signupForm">
                <img class="mb-4" src="images/flower-logo.jpg" alt="" width="200" height="200">
                <h1 class="h3 mb-3 fw-normal">Enter details</h1>
                
                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Voter Id" name="voterId">
                    <label for="floatingPassword">VoterId</label>
                </div>

                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress" value="${emp.getEmailAddress()}">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" value="${emp.getPassword()}">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="First Name" name="firstName" value="${emp.getFirstName()}">
                    <label for="floatingPassword">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Last Name" name="lastName" value="${emp.getLastName()}">
                    <label for="floatingPassword">Last Name</label>
                </div>
                
                <div class="form-floating">
                    <select name="state" class="form-control form-select" id="stateName">
                        <option value="">Select State</option>
                        <c:forEach var="state" items="${StateList}">
                            <option value="${state.getStateName()}">
                                ${state.getStateName()}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="floatingInput">State Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Age" name="age">
                    <label for="floatingPassword">Age</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Dob" name="dob">
                    <label for="floatingPassword">Dob</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Gender" name="gender">
                    <label for="floatingPassword">Gender</label>
                </div>
                <p></p>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign up</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2017?2022</p>
            </form>
        </main>



    </body>
</html>
