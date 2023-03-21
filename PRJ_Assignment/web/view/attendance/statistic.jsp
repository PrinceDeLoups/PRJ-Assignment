<%-- 
    Document   : Statistic
    Created on : Mar 20, 2023, 10:52:16 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            a {
                color: blue;
                text-decoration: none;
            }
            a:hover {
                color: black;
                text-decoration: underline;
            }
            a:active {
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="container" style="margin-left: 200px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span style="text-shadow: -5px 5px 4px #ec9b19;">FPT University Academic Portal</span></h1>
                </div>
                <div class="col-md-4" style="margin-left: 400px">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr>
                            <td><a href=""><img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href=""><img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.lec ne null}">
                        <c:forEach items="${requestScope.lec}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="schedule"><h3 style="margin-top: 8px;"><strong>Schedule</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| Groups</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 620px">
                    <c:if test="${requestScope.lec ne null}">
                        <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/PRJ_Assignment/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            ${cs.name}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <table style="margin-top: 50px; border: 2px solid black">
                <thead>
                    <tr style="background-color: rgb(0, 179, 255);">
                        <th style="width: 70px; text-align: left;">INDEX</th>
                        <th style="width: 190px; text-align: left;">IMAGE</th>
                        <th style="width: 100px; text-align: left;">CODE</th>
                        <th style="width: 170px; text-align: left;">FULL NAME</th>
                            <c:forEach items="${requestScope.ss}" var="ss" varStatus="loop">
                            <th style="width: 200px; text-align: left;">Lession ${loop.index + 1}</th>
                            </c:forEach>
                        <th style="width: 170px; text-align: left;">ABSENT</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                    <script>
                        var absent = 0;
                    </script>
                    <tr style="background-color: #dddddd">
                        <td><strong>${loop.index + 1}</strong></td>
                        <td style="text-align: center"><img src="${s.img}" alt="alt"/></td>
                        <td><strong>${s.code}</strong></td>
                        <td><strong>${s.name}</strong></td>
                        <c:forEach items="${requestScope.att}" var="att" varStatus="loops">
                            <c:if test="${att.student.id eq s.id}">
                                <c:if test="${att.session.status eq true}">
                                    <c:if test="${att.status eq true}">
                                        <td style="text-align: center"><b style="color: rgb(67, 205, 128)">P</b><br/></td>
                                        </c:if>
                                        <c:if test="${att.status eq false}">
                                        <td style="text-align: center"><b style="color: red">A</b><br/></td>
                                    <script>
                                        absent = absent + 1;
                                    </script>
                                </c:if>
                            </c:if>
                            <c:if test="${att.session.status eq false}">
                                <td style="text-align: center"><b>_</b><br/></td>
                                </c:if>
                            </c:if>
                        <script>
                            var count = "${loops.index+1}";
                        </script>
                    </c:forEach>
                    <script>
                        var average = absent / count * 100;
                        var round = Math.round((average + Number.EPSILON) * 100) / 100;
                    </script>    
                    <td style="text-align: center"><strong>
                            <script>
                                document.write(round + "%");
                            </script>
                        </strong>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="margin-bottom: 200px; margin-top: 100px" class="row">
                <div style="margin-left: 150px">
                    <b>Mọi góp ý, thắc mắc xin liên hệ: </b>
                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>
                    : Email: 
                    <a style="color: blue" href="">dichvusinhvien@fe.edu.vn</a>
                    . Điện thoại: 
                    <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(098)2.730.924 </span>
                </div>
                <tr>
                    <td>
                        <p style="text-align: center; margin-right: 20px">
                            © Powered by <a style="color: blue" href="" target="_blank">FPT University</a>&nbsp;|&nbsp;
                            <a style="color: blue" href="" target="_blank">CMS</a>&nbsp;|&nbsp; <a style="color: blue" href="" target="_blank">library</a>&nbsp;|&nbsp; <a style="color: blue" href="" target="_blank">books24x7</a>
                            <span id="ctl00_lblHelpdesk"></span>
                        </p>
                    </td>
                </tr>
            </div>
        </div>
    </body>
</html>
