<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>VendorLTE | AccessDenied</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/dist/css/adminlte.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Error Page</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="">Home</a></li>
                            <li class="breadcrumb-item active">500 Error Page</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-danger">Access Denied</h2>
                <div class="error-content">
                    <h3><i class="fas fa-exclamation-triangle text-danger"></i> Oops! Something went wrong.</h3>
                    <p>
                        We will work on fixing that right away.
                        Meanwhile, you may <a href="${pageContext.request.contextPath}/vendor/dashboard">return to dashboard</a> or try using the search form.
                    </p>
                    <form class="search-form">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search">
                            <div class="input-group-append">
                                <button type="submit" name="submit" class="btn btn-danger">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/dist/js/adminlte.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/dist/js/demo.js"></script>
</body>
</html>
