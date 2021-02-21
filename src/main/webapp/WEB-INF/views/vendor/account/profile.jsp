<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 

<div class="container-fluid mt-2">
    <section class="content-header">
        <div class="mx-5">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>PROFILE</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="">Home</a></li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <section class="content mx-5">
        <s:form name="f1" action="${pageContext.request.contextPath }/vendor/profile" method="post" 
        modelAttribute="vendor" enctype="multipart/form-data" onsubmit="return validate()">
            <div class="row">
                <div class="col-sm-12 col-md-2">
                    <img width="250" height="250" id="photo" src="${pageContext.request.contextPath}/upload/vendor/account/${vendor.photo}" /> <br /> <br />
                    <input type="file" class="input-ace" id="inputphoto" name="inputphoto" onchange="change()" required/>
                </div>
                
                <div class="col-sm-12 col-md-9 offset-1">
                	<div class="form-group row">
	                    <label class="col-sm-1 col-form-label" style="color:red;padding-left:80px;font-size:20px" align="right">${msg }</label>
	                </div>     
                	<div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">FullName </label>
	                    <div class="col-sm-10">
	                        <s:input path="fullname" type="text" class="form-control" name="fullname"/>
	                    </div>
	                </div>     
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Email </label>
	                    <div class="col-sm-10">
	                        <s:input type="email" path="email" class="form-control" name="email"/>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Address </label>
	                    <div class="col-sm-10">
	                        <s:input path="address" type="text" class="form-control" name="address"/>
	                    </div>
	                </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Phone </label>
                        <div class="col-sm-10">
	                        <s:input path="phone" type="text" class="form-control" name="phone"/>
	                    </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Created </label>
                        <div class="col-sm-10">
	                        <input value="${vendor.created }" type="text" class="form-control" name="created" readonly/>
	                    </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-1 col-sm-4">
                            <button type="submit" class="btn btn-block btn-info"><i class="fas fa-save"></i> &nbsp;EDIT</button>
                        	<s:hidden path="id"/>
                        </div>
                    </div>
                    
                </div>
            </div>
        </s:form>
    </section>
</div>
<script>
	function validate(){  
		var name=document.f1.fullname.value; 
		var address=document.f1.address.value; 
		var phone=document.f1.phone.value; 
		var email=document.f1.email.value; 
		var emailRgex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-] + @ [a-zA-Z0-9 -] + (?: \. [ a-zA-Z0-9 -] +) * $ /;
		  
		if(name == "" || address == "" || email == "" || phone == "") {  
			alert("Input must be filled out");  
			return false;  
		} else if(name == null || email == null || phone == null || address == null) {  
			alert("Input must be filled out");  
			return false;  	  
		} else if(emailRgex.test(email)) {  
			alert("Please enter a valid email");  
			return false;  	  
		} else if(phone.length <10) {  
			alert("Phone must be at least 10 characters long.");  
			return false;  
		}
	
	}  

    function change() {
        $('#photo').attr("src", URL.createObjectURL($('#inputphoto')[0].files[0]));
    }

    $(function () {
        $("#datepicker").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>

