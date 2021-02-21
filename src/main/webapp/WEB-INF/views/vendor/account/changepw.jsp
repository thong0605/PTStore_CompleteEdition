<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Change Password</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    
                    <li class="breadcrumb-item"><a href="">Home</a></li>
                    <li class="breadcrumb-item active">Change Password</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="container-fluid">
        <div class="row" style="margin-top: 90px">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="card card-success">
                    <div class="card-header">
                        <h2 class="card-title" align="center">Change Password</h2>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form method="post" name="f1" action="${pageContext.request.contextPath}/vendor/changepw" onsubmit="return matchpass()">
                        <input type="hidden" name="id" value="${sessionScope.vendor.id }"/>
                        <div class="card-body">
                            <div class="input-group mb-3">
                                <input type="password" class="form-control" name="oldpw" id="curpw" placeholder="Old Password">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" class="form-control"  name="npw" placeholder="New Password">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" class="form-control" name="repw" placeholder="Confirm Password">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span id="span-confirm" class="fas fa-check"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <button type="submit" class="btn btn-success btn-block btn-ch">Change</button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </form>
                </div>
                <!-- /.card -->
                <!-- Form Element sizes -->
                <!-- /.card -->
                <!-- /.card -->

            </div>
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>


    <script type="text/javascript">
    
	    function matchpass(){  
	    	var oldpassword=document.f1.oldpw.value; 
       		var firstpassword=document.f1.npw.value;  
       		var secondpassword=document.f1.repw.value;  
       		if(firstpassword == secondpassword){  
       			return true;  
       		} else if(oldpassword == "" || oldpassword == "" || oldpassword == ""){  
       			alert("Input must be filled out");  
       			return false; 
       		} else if(oldpassword == null || oldpassword == null || oldpassword == null){  
       			alert("Input must be filled out");  
       			return false;
       		}  else {
				alert("password must be same!");  
       			return false;  
           	}
       	}  
     
    </script>
