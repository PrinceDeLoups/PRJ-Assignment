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
                <form action="">
                    <select name="term">
                        <option value="1">Select Term</option>
                    </select>
                    <select name="course">
                        <option value="1">Select Course</option>
                    </select>
                    <select name="class">
                        <option value="1">Select Class</option>
                    </select>
                    <input type="submit" value="Enter" />
                </form>
            </div>
        </div>
        <div class="row">
            <table style="margin-left: 200px; margin-top: 50px;">
                <caption style="text-align: left; font-size: large;">...then see the student list</caption>
                <thead>
                    <tr style="background-color: rgb(0, 179, 255);">
                        <th style="width: 100px; text-align: left;">INDEX</th>
                        <th style="width: 200px; text-align: left;">IMAGE</th>
                        <th style="width: 100px; text-align: left;">CODE</th>
                        <th style="width: 200px; text-align: left;">SURNAME</th>
                        <th style="width: 200px; text-align: left;">MIDDLE NAME</th>
                        <th style="width: 200px; text-align: left;">GIVEN NAME</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</body>

</html>