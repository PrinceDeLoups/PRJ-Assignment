
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>HTML5 Login Form with validation Example</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="style.css">

    </head>
    <body style="display: flex;">
        <div id="login-form-wrap">
            <!--<h2>Login</h2>-->
            <form id="login-form">
                <p>
                    <input type="text" id="username" name="username" placeholder="Username" required><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="email" id="email" name="email" placeholder="Email Address" required><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <select name="campus" class="btn btn-default" required>
                        <option selected="selected" value="">Select Campus</option>
                        <option value="1">FU-Hoa Lac</option>
                        <option value="2">FU-Ho Chi Minh</option>
                        <option value="3">FU-Da Nang</option>
                        <option value="4">FU-Can Tho</option>
                        <option value="5">FU-Quy Nhon</option>
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
    </body>
</html>
