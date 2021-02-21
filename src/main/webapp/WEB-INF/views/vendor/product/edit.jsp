<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#created").datepicker();
	});
</script>

<div class="container-fluid mt-2">
    <section class="content-header">
        <div class="mx-5">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>DETAIL PRODUCT</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a onclick="return confirm('Can you sure cancel present page ?')" href="${pageContext.request.contextPath}/vendor/product">Product</a></li>
                        <li class="breadcrumb-item active">Edit Product</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <section class="content mx-5">

        <s:form name="f1" action="${pageContext.request.contextPath}/vendor/product/edit" modelAttribute="product" method="post" enctype="multipart/form-data" onsubmit="return validate1()">
         	
            <div class="row">
                <div class="col-sm-12 col-md-2">
                    <img width="250" height="250" id="photo" src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo }" /> <br /> <br />
                    <input type="file" class="input-ace" id="inputphoto" name="inputphoto" onchange="change()" required>
                </div>
                <div class="col-sm-12 col-md-9 offset-1">
                	<div id="result" style="color:red;font-size:20px;">${msg }</div>
                	<div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Name: </label>
	                    <div class="col-sm-10">
	                        <s:input path="name" type="text" class="form-control" name="name"/>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Quantity: </label>
	                    <div class="col-sm-10">
	                        <s:input path="quantity" type="number" class="form-control" name="quantity"/>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Discount: </label>
	                    <div class="col-sm-10">
	                        <s:input path="discount" type="number" class="form-control" min="0" name="discount"/>
	                    </div>
	                </div>
	                <div class="form-group row">
	                    <label class="col-sm-1 col-form-label" align="right">Price: </label>
	                    <div class="col-sm-10">
	                        <s:input path="unitPrice" type="number" class="form-control" name="unitPrice"/>
	                    </div>
	                </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Category: </label>
                        <div class="col-sm-10">
                            <s:select name="cateId" path="category.id" class="input-ace form-control">   
	                           <c:forEach var="cate" items="${categories }">                      
	                           		<s:option value="${cate.id }">${cate.name }</s:option>
	                           </c:forEach>                               
                            </s:select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Brand: </label>
                        <div class="col-sm-10">
                            <s:select name="brandId" path="brand.id" class="input-ace form-control">   
	                           <c:forEach var="b" items="${brands }">                      
	                           		<s:option value="${b.id }">${b.name }</s:option>
	                           </c:forEach>                               
                            </s:select>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Description: </label>
                        <div class="col-sm-10">
                            <s:textarea path="description" class="form-control" name="description" id="textDescription"></s:textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Special: </label>
                        <div class="col-sm-10">
                            <s:checkbox path="special" data-toggle="toggle" data-onstyle="success" data-offstyle="danger" data-on="on" data-off="off" data-size="small"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Active: </label>
                        <div class="col-sm-10">
                            <s:checkbox path="activated" data-toggle="toggle" data-onstyle="success" data-offstyle="danger" data-on="on" data-off="off" data-size="small"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" align="right">Created: </label>
                        <div class="col-sm-10">
                            <s:input path="created" id="created" name="created"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-1 col-sm-4">
                            <button type="submit" class="btn btn-block btn-info"><i class="fas fa-save"></i> &nbsp;SUBMIT</button>
                            <s:input type="hidden" path="id"/>
                            <s:input type="hidden" path="account.id"/>
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
	        var created = document.f1.created.value;
	        if(name == "" || unitPrice == "" || quantity == "" || discount == "" || descript == "" || created == "") {
				alert("Input must be filled out");
				return false;
	        } else if(name == null || unitPrice == null || quantity == null || discount == null || descript == null || created == null) {
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
        $(function () {
            $("#datepicker").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
        
        $(document).ready(function () {
            CKEDITOR.replace('textDescription', {
                height:200,
                filebrowserUploadUrl:'/admin/user/upload_ckeditor',
                filebrowserBrowseUrl:'/admin/user/file_browser'
            });
        })
    </script>

