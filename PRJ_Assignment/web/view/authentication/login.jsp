<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link href="view/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="row">
            <div style="margin-left: 1500px; margin-top: 50px">
                <table>
                    <tr>
                        <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                    </tr>
                    <tr>
                        <td><a href="https://apps.apple.com/app/id1527723314">
                                <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
                        <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                <img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>

                    </tr>
                </table>
            </div>
        </div>
        <div class="container-fluid" id="container" style="display: flex;">
            <div style="margin-top: 180px; margin-left: 350px; margin-right: 100px">
                <h1 style="color: white;">FPT UNIVERSITY <br/> ACADEMIC <br/> PORTAL</h1>
            </div>
            <div id="login-form-wrap" style="margin-top: 100px;">
                <form action="login" method="POST" id="login-form">
                    <p>
                        <input type="text" id="username" name="username" placeholder="Username" required><i class="validation"><span></span><span></span></i>
                    </p>
                    <p>
                        <input type="password" id="password" name="password" placeholder="Password" required><i class="validation"><span></span><span></span></i>
                    </p>
                    <p>
                        <select name="campus" class="btn btn-default" style="color: gray" required>
                            <option selected="selected" value="">Select Campus</option>
                            <option value="1">FU-Hoà Lạc</option>
                            <option value="2">FU-Hồ Chí Minh</option>
                            <option value="3">FU-Đà Nẵng</option>
                            <option value="4">FU-Cần Thơ</option>
                            <option value="5">FU-Quy Nhơn</option>
                        </select>
                    </p>
                    <p>
                        <input type="submit" id="login" value="Login">
                    </p>
                </form>
                <div id="create-account-wrap">
                    <p>Not a member? <a href="#">Create Account</a><p>
                </div>
            </div>
        </div>
        <div>
            <table width="100%" style="border: 1px solid transparent; margin-top: 100px">
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <p style="text-align: center">
                            © Powered by <a style="color: white" href="" target="_blank">FPT University</a>&nbsp;|&nbsp;
                            <a style="color: white" href="" target="_blank">CMS</a>&nbsp;|&nbsp; <a style="color: white" href="" target="_blank">library</a>&nbsp;|&nbsp; <a style="color: white" href="" target="_blank">books24x7</a>
                            <span id="ctl00_lblHelpdesk"></span>
                        </p>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
