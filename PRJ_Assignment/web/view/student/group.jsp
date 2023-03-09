<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
            <title>

            </title>
            <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css" />
            <link rel="Stylesheet" href="group.css" type="text/css" />
            <style type="text/css">
                .style1 {
                    font-weight: bold;
                }
            </style>

    </head>

    <body>
        <div class="container">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
                <div class="col-md-4" style="margin-left: 400px">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr>
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg"
                                         style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg"
                                         style="width: 120px; height: 40px" alt="google store" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="margin-top: 100px;">
                <div style="margin-left: 200px;">
                    <form action="group" method="GET">
                        <select name="campus" disabled>
                            <option value="1">Select Campus</option>
                        </select>
                        <select name="term" disabled>
                            <option value="1">Select Term</option>
                        </select>
                        <select name="department" disabled>
                            <option value="1">Select Department</option>
                        </select>
                        <select name="course">
                            <option value="0">Select Course</option>
                            <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                <option value="${c.subjectID}">${c.subjectName}(${c.subjectCode})</option>
                            </c:forEach>
                        </select>
                        <select name="class">
                            <option value="0">Select Class</option>
                            <c:forEach items="${requestScope.groups}" var="g" varStatus="loop">
                                <option value="${g.groupID}">${g.groupName}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Enter" />
                    </form>
                </div>
            </div>
            <div class="row">
                <table style="margin-left: 200px; margin-top: 50px; border: 2px solid black">
                    <caption style="text-align: left; font-size: large;">...then see the student list</caption>
                    <thead>
                        <tr style="background-color: rgb(0, 179, 255);">
                            <th style="width: 100px; text-align: left;">INDEX</th>
                            <th style="width: 200px; text-align: left;">IMAGE</th>
                            <th style="width: 100px; text-align: left;">CODE</th>
                            <th style="width: 200px; text-align: left;">FULL NAME</th>
                            <th style="width: 200px; text-align: left;">Date of Birth</th>
                            <th style="width: 200px; text-align: left;">Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="0" />
                        <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                            <c:set var="count" value="${count + 1}"/>
                            <tr>
                                <td style="background-color: #dddddd"><c:out value="${count}"/></td>
                                <td style="text-align: center"><img src="${s.img}" alt="alt"/></td>
                                <td>${s.id}</td>
                                <td>${s.name}</td>
                                <td>
                                    <fmt:formatDate type = "date" 
                                                    value = "${s.dob}" />
                                </td>
                                <td>${s.email}</td>
                            </tr>
                        </c:forEach>
                        <c:remove var="number"/>
                    </tbody>
                </table>
            </div>
        </div>
    </body>

</html>