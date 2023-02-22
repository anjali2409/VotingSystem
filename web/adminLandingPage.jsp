<%-- 
    Document   : landingPage
    Created on : 22-Dec-2022, 12:00:33 PM
    Author     : Shouvik Samadder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link href="css/header.css" rel="stylesheet">-->
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>
        <style>
            #example_wrapper{
                width: 100%;
                display: block;
                margin: auto;
            }
        </style>
        
        <title>Employee Management</title>
    </head>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    <!<!-- I want to check my session before showing any content to the user -->
    <c:set var='admin' value='${Admin}'/>
    <c:if test = "${admin == null}">  
        <c:redirect url = "login.jsp"/>
    </c:if>
    
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="align-content-center" style="text-align: center">
        <h2><u>Employee List</u></h2>
    </div>
        <table class="table table-bordered table-hover" id="example">
            <thead>
            <tr class="table-primary">
                <th>
                    Employee Id
                </th>
                <th>
                    Name
                </th>
                <th>
                    Address
                </th>
                <th>
                    Phone
                </th>
                <th>
                    Gender
                </th>
                <th>
                    Age
                </th>
                <th>
                    Department
                </th>
                <th>
                    Role
                </th>
                <th>
                    Basic Salary
                </th>
                <th>
                    Car Allowance
                </th>
                <th>
                    Action
                </th>

            </tr>
            </thead>
            <tr>
                
                
                    <td>
                        ${admin.getAdminId()}
                    </td>
                    <td>
                        ${admin.getFirstName()}
                    </td>
                    <td>
                        <c:out value='${emp.getAddress()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getPhone()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getGender()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getAge()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getDepartmentName()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getRoleName()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getBasicSalary()}'/>
                        
                    </td>
                    <td>
                        <c:out value='${emp.getCarAllaowance()}'/>
                        
                    </td>
                    <td>
                        <a href=EditEmployee?employeeId=${emp.getEmployeeId()}>Edit</a>
                    </td>
            </tr>
        </table>

        <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

</html>
