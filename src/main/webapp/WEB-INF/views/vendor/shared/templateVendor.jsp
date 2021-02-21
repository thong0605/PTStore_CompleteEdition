<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Vendor | Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/dist/css/adminlte.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/css/ACE.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/vendor/css/select2.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/vendor/css/jquery-ui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/vendor/css/bootstrap-toggle.min.css" rel="stylesheet" />

	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	

</head>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">

    <div class="wrapper">
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-bell"></i>
                        <span class="badge badge-warning navbar-badge"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <span class="dropdown-item dropdown-header"> Notifications</span>
                        <div class="dropdown-divider"></div>
                        
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                    </div>
                </li>
               
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-user-circle"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">                       
                        <div class="dropdown-divider"></div>
                        <a href="${pageContext.request.contextPath}/vendor/profile/${sessionScope.vendor.id}" class="dropdown-item">
                            <i class="fas fa-edit"></i>
                            <span class="float-right text-muted text-sm">Profile</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/vendor/changepw" class="dropdown-item">
                            <i class="fas fa-exchange-alt"></i>
                            <span class="float-right text-muted text-sm">Change Password</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/vendor/logout" class="dropdown-item">
                            <i class="fas fa-sign-out-alt"></i>
                            <span class="float-right text-muted text-sm">Log out</span>
                        </a>
                    </div>
                </li>
               
       
            </ul>
        </nav>
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="${pageContext.request.contextPath }/vendor/dashboard" class="brand-link">
                <img src="${pageContext.request.contextPath}/resources/vendor/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                     style="opacity: .8">
                <span class="brand-text font-weight-light">Vendor</span>
            </a>
            <div class="sidebar">
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="${pageContext.request.contextPath}/upload/vendor/account/${sessionScope.vendor.photo }" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="${pageContext.request.contextPath}/vendor/profile/${sessionScope.vendor.id}" class="d-block">${sessionScope.vendor.username }</a>
                    </div>
                </div>
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                       
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath }/vendor/dashboard" class="nav-link item_menu">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                               
                                    Dashboard
                                
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath }/vendor/product" class="nav-link item_menu">
                                <i class="nav-icon fab fa-product-hunt"></i>
                              
                                    Product
                              
                            </a>
                        </li>
                    	<li class="nav-item">
                            <a href="${pageContext.request.contextPath }/vendor/order" class="nav-link item_menu">
                                <i class="nav-icon fab fa-jedi-order"></i>
                                
                                    Order New
                               
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath }/vendor/order/orderold" class="nav-link item_menu">
                                <i class="nav-icon fab fa-old-republic"></i>
                                    Order History
                            </a>
                        </li>
                   		<li class="nav-item">
                            <a href="${pageContext.request.contextPath }/vendor/quality" class="nav-link item_menu">
                                <i class="nav-icon fas fa-star-half-alt"></i>                              
                                    Product Quality 
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>

        <div class="content-wrapper">
            <tiles:insertAttribute name="contentvendor"></tiles:insertAttribute>
        </div>

        <footer class="main-footer">
           Copyright &copy; 2020 All rights reserved.       
        </footer>
    </div>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/dist/js/adminlte.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/dist/js/demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery-mapael/jquery.mapael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery-mapael/maps/usa_states.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/dist/js/pages/dashboard2.js"></script>

    <script src="${pageContext.request.contextPath}/resources/vendor/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/js/sweetalert2@9.js"></script>

    <script src="${pageContext.request.contextPath}/resources/vendor/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/js/bootstrap-toggle.min.js"></script>
 
    <script src="${pageContext.request.contextPath}/resources/vendor/js/ACE.js"></script>

    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/ckeditor/ckeditor.js"></script>
	
</body>
</html>
