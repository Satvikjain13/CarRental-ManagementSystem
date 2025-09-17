<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Car Rental Portal Management System</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <span class="logo-mini"><b><i class="fa fa-cab"></i></b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b><i class="fa fa-cab"></i> Car</b>Rental Portal</span>
        </a>

        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="../dist/img/avatar04.png" class="user-image" alt="User Image">
                            <span class="hidden-xs">Admin</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="../dist/img/avatar04.png" class="img-circle" alt="User Image">
                                <p>
                                    Admin
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-center">
                                    <a class="btn btn-danger" style="width: 100%" href="changePassword.jsp"><i
                                            class="fa fa-spinner fa-spin"></i> Change Password</a>
                                </div>
                                <div class="pull-center">
                                    <a class="btn btn-danger" style="width: 100%" href="../logout"><i
                                            class="fa fa-spinner fa-spin"></i>Log out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                </ul>
            </div>
        </nav>
    </header>

    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../dist/img/avatar04.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Admin</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Admin</a>
                </div>
            </div>
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">Admin Modules</li>
                <li>
                    <a href="dashboard.jsp">
                        <i class="fa fa-cab"></i> <span>Dashboard</span>
                    </a>
                </li>

                <li>
                    <a href="brands.jsp">
                        <i class="fa fa-laptop"></i> <span>Brands</span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>Vehicles</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="addVehicle.jsp"><i class="fa fa-circle-o"></i> Add Vehicle</a></li>
                        <li><a href="manageVehicle.jsp"><i class="fa fa-circle-o"></i> Manage Vehicle</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>Booking</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="newBooking.jsp"><i class="fa fa-circle-o"></i> New Booking</a></li>
                        <li><a href="confirmBooking.jsp"><i class="fa fa-circle-o"></i> Confirm Booking</a></li>
                        <li><a href="cancelBooking.jsp"><i class="fa fa-circle-o"></i> Cancel Booking</a></li>
                        <li><a href="allBooking.jsp"><i class="fa fa-circle-o"></i> All Booking</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i>
                        <span>Contact Query</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="unreadQuery.jsp"><i class="fa fa-circle-o"></i> Unread Query</a></li>
                        <li><a href="readQuery.jsp"><i class="fa fa-circle-o"></i> Read Query</a></li>
                    </ul>
                </li>
                <li>
                    <a href="regUser.jsp">
                        <i class="fa fa-cab"></i> <span>Reg Users</span>
                    </a>
                </li>
                <li>
                    <a href="search.jsp">
                        <i class="fa fa-search"></i> <span>Search</span>
                    </a>
                </li>

                <li>
                    <a href="betweendateReport.jsp">
                        <i class="fa fa-file-o"></i> <span>Between Date Report</span>
                    </a>
                </li>

                <li>
                    <a href="changePassword.jsp">
                        <i class="fa fa-money"></i> <span>Change Password</span>
                    </a>
                </li>
                <li>
                    <a href="../logout">
                        <i class="fa fa-power-off"></i> <span>Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    
       
</body>
</html>