<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="container-fluid mt-2">
    <section class="content-header">
        <div class="mx-5">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>CREATE PRODUCT</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/vendor/product">Product</a></li>
                        <li class="breadcrumb-item active">Create Product</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <section class="content mx-5">
        
        <s:form name="f1" action="${pageContext.request.contextPath }/vendor/product/create" modelAttribute="product" method="post" enctype="multipart/form-data" onsubmit="return validate1()">
            <div class="row">
                <div class="col-sm-12 col-md-2">
                    <img width="250" height="250" id="photo" src="${pageContext.request.contextPath}/upload/vendor/product/ngoctu.jpg" /> <br /> <br />
                    <input type="file" class="input-ace" id="inputphoto" name="inputphoto" onchange="change()" required/>
                </div>
                
                <div class="col-sm-12 col-md-9 offset-1">
                	<div id="result" style="color:red;font-size:20px;">${msg }</div>
                	<div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Name: </label>
	                    <div class="col-sm-10">
	                        <s:input path="name" type="text" class="form-control" name="name"/>
	                        <s:errors path="name" style="color:red;"></s:errors>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Quantity: </label>
	                    <div class="col-sm-10">
	                        <s:input path="quantity" type="number" class="form-control" name="quantity"/>
	                        <s:errors path="quantity" style="color:red;"></s:errors>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Discount: </label>
	                    <div class="col-sm-10">
	                        <s:input path="discount" type="number" class="form-control" value="0" name="discount" min="0"/>
	                        <s:errors path="discount" style="color:red;"></s:errors>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Price: </label>
	                    <div class="col-sm-10">
	                        <s:input path="unitPrice" class="form-control" name="unitPrice"/>
	                        <s:errors path="unitPrice" style="color:red;"></s:errors>
	                    </div>
	                </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Category: </label>
                        <div class="col-sm-10">
                            <select name="cateId" class="input-ace form-control">   
	                           <c:forEach var="cate" items="${categories }">                      
	                           		<option value="${cate.id }">${cate.name }</option>
	                           </c:forEach>                               
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Brand: </label>
                        <div class="col-sm-10">
                            <select name="brandId" class="input-ace form-control">   
	                           <c:forEach var="b" items="${brands }">                      
	                           		<option value="${b.id }">${b.name }</option>
	                           </c:forEach>                               
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Description: </label>
                        <div class="col-sm-10">
                            <s:textarea path="description" class="form-control" name="description" id="textDescription"></s:textarea>
                            <s:errors path="description" style="color:red;"></s:errors>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Special: </label>
                        <div class="col-sm-10">
                            <s:checkbox path="special" data-toggle="toggle" data-onstyle="success" data-offstyle="danger" data-on="on" data-off="off" data-size="small"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-1 col-sm-4">
                            <button type="submit" class="btn btn-block btn-info"><i class="fas fa-save"></i> &nbsp;SUBMIT</button>
                            <input type="hidden" name="accountId" value="${sessionScope.vendor.id }"/>
                        </div>
                    </div>
                </div>
            </div>
        </s:form>
    </section>
</div>


    <script>
        
        function validate1() {
        	var name = document.f1.name.value;
            var quantity = document.f1.quantity.value;
            var price = document.f1.unitPrice.value;
            var discount = document.f1.discount.value;
            var descript = document.f1.description.value;
            if(name == "" || price == "" || quantity == "" || discount == "" || descript == "") {
				alert("Input must be filled out");
				return false;
            } else if(name == null || price == null || quantity == null || discount == null || descript == null) {
            	alert("Input must be filled out");
				return false;
            } else if(isNaN(quantity)) {  
    			alert("Quantity is not valid");  
    			return false;  
    		}  else if(isNaN(price)) {  
    			alert("UnitPrice is not valid");  
    			return false;  
    		}  else if(isNaN(discount)) {  
    			alert("Discount is not valid");  
    			return false;  
    		} 
    		
        }

        function change() {
            $('#photo').attr("src", URL.createObjectURL($('#inputphoto')[0].files[0]));
        }

        $(document).ready(function () {
            CKEDITOR.replace('textDescription', {
                height:200,
                filebrowserUploadUrl:'/admin/user/upload_ckeditor',
                filebrowserBrowseUrl:'/admin/user/file_browser'
            });
        })
       
    </script>
