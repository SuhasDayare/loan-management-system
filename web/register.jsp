<%-- 
    Document   : register
    Created on : 16 Feb, 2018, 11:02:32 PM
    Author     : Suhas
--%>

<!--Top Menu Bar --><%@include file="menu.jsp" %>

<div class="container">
    <%  if (request.getParameter("error") != null) {
            String error = request.getParameter("error");
    %>
    <br><br>
    <div class="alert alert-danger fade in col-md-8 col-md-offset-2">
        <a href="#" class="close" data-dismiss="alert" area-label="close">&times;</a><span class="glyphicon glyphicon-alert"></span>&nbsp;&nbsp;&nbsp;<%= error%>
    </div>
    <%  }
    %>
</div>
<div class="modal-dialog">
    <div class="modal-content">
        <form class="form login-form" role="form" action="Register" method="POST">
            <!-- header -->
            <div class="modal-header">
                <a class="close" href="login.jsp"><small>Or</small>&nbsp;Login</a>
                <h3 class="modal-title">Register</h3>
            </div>
            <!-- body (form) -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Name:</label>
                            <input type="text" class="form-control" placeholder="Name..." name="name" required="required" maxlength="50">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Email:</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter email..." required="required" maxlength="25">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <p><b>Gender:</b></p>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio1" value="male" checked="checked"> Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="female"> Female
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>DOB:</label>
                            <input type="text" class="form-control" placeholder="Enter date in format yyyy-mm-dd" name="dob" required="required">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Mobile no.:</label>
                            <input type="number" class="form-control" name="mobile" placeholder="Enter mobile no..." required="required" max="9999999999">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Adhar No.:</label>
                            <input type="number" class="form-control" name="adhar" placeholder="Enter adhar no..." required="required" maxlength="12">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>PAN No.:</label>
                            <input type="text" class="form-control" name="pan" placeholder="Enter PAN No..." required="required" maxlength="10">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <textarea class="form-control" name="address" placeholder="Enter address..." required="required" maxlength="120"></textarea>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="pass" placeholder="Enter password..." required="required" maxlength="10">
                        </div>
                        <div class="col-md-6">
                            <input type="password" class="form-control" name="pass1" placeholder="Re-enter password..." required="required" maxlength="10">
                        </div>
                    </div>
                </div>
            </div>
            <!-- button -->
            <div class="modal-footer">
                <button type="reset" class="btn btn-primary">Reset</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<%@include file="footer.html" %>