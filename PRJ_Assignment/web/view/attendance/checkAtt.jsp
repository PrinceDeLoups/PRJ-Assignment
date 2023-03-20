<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/dateTag.tld" prefix="my"%>

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
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <a style="margin-left: 20px;" href="timetable"><h3 style="margin-top: 8px;"><strong>Timetable</strong></h3></a>
                    </c:forEach>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 600px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="student/info">${s.account.accountName}</a>
                        </button>
                    </c:forEach>
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
            <div class="row" style="margin-top: 50px; display: flex">
                <div>
                    <table style=" border: 2px solid black">
                        <caption style="text-align: center; font-size: large"><h1>Select a campus/program, term,<br/> course ...</h1></caption>
                        <thead style="background-color: rgb(0, 179, 255);">
                            <tr>
                                <th scope="col" style="width: 100px; text-align: left;">Campus</th>
                                <th scope="col" style="width: 100px; text-align: left;">Term</th>
                                <th scope="col" style="width: 420px; text-align: left;">Course</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <table border="1">
                                        <tr>
                                            <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                                <strong>${cs.name}</strong>
                                            </c:forEach>
                                        </tr>
                                    </table> 
                                </td>
                                <td valign="top"></td>
                                <td valign="top">
                                    <table border="1">
                                        <tr>
                                            <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                                <a style="margin-bottom: 5px" href="checkAtt?course=${c.id}" name="course"><strong>${c.name}</strong> </a><strong>(${c.code})</strong><br/>
                                                    </c:forEach>
                                        </tr>
                                    </table> 
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div>
                    <table style=" border: 2px solid black">
                        <caption style="text-align: center; font-size: large; margin-bottom: 24px"><h1>... then see report</h1></caption>
                        <br/>
                        <thead style="background-color: rgb(0, 179, 255);">
                            <tr>
                                <th scope="col" style="height: 50px;width: 40px; text-align: left;">NO</th>
                                <th scope="col" style="width: 170px; text-align: left;">DATE</th>
                                <th scope="col" style="width: 110px; text-align: left;">SLOT</th>
                                <th scope="col" style="width: 60px; text-align: left;">ROOM</th>
                                <th scope="col" style="width: 100px; text-align: left;">LECTURER</th>
                                <th scope="col" style="width: 80px; text-align: left;">GROUP NAME</th>
                                <th scope="col" style="width: 120px; text-align: left;">ATTENDANCE STATUS</th>
                                <th scope="col" style="width: 120px; text-align: left;">LECTURER'S COMMENT</th>
                            </tr>
                        </thead>
                        <tbody>
                            <script>
                                var absent = 0;
                            </script>
                            <c:forEach items="${requestScope.ses1}" var="ss" varStatus="loop">
                                <tr>
                                    <td valign="top" style="height: 50px">
                                        ${loop.index+1}
                                    </td>
                                    <td valign="top">
                                        <button style="background-color: #337ab7; color: white; border: 0px">
                                            <my:dateTag value="${ss.date}" type="EEEE"></my:dateTag> <my:dateTag value="${ss.date}"></my:dateTag>
                                            </button>
                                        </td>
                                        <td valign="top">
                                            <button style="background-color: #d9534f; color: white; border: 0px">
                                            ${ss.slot.id}_${ss.slot.name}
                                        </button>
                                    </td>
                                    <td valign="top">${ss.room.name}</td>
                                    <td valign="top">${ss.lecturer.code}</td>
                                    <td valign="top">${ss.group.name}</td>
                                    <td valign="top">
                                        <c:if test="${ss.status eq true}">
                                            <c:if test="${ss.attendance.status eq true}">
                                                <b style="color: rgb(67, 205, 128)">Present</b><br/>
                                            </c:if>
                                            <c:if test="${ss.attendance.status eq false}">
                                                <b style="color: red">Absent</b><br/>
                                                <script>
                                                    absent = absent + 1;
                                                </script>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${ss.status eq false}">
                                            <b style="color: black">Future</b><br/>
                                        </c:if>
                                    </td>
                                    <td valign="top">${ss.attendance.description}</td>
                                </tr>
                                <script>
                                    var count = "${loop.index+1}";
                                </script>
                            </c:forEach>
                            <script>
                                var average = absent / count * 100;
                            </script>
                        </tbody>
                        <tfoot>                       
                            <td colspan="8">
                                <h3>                                
                                    <script>
                                        document.write("ABSENT: " + average + "% ABSENT SO FAR(" + absent + " ABSENT ON " + count + " TOTAL)");
                                    </script>
                                </h3>
                            </td>
                        </tfoot>
                    </table>
                </div>
            </div>
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