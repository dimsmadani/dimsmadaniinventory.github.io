<?php 
    session_start();
    if( !isset($_SESSION["login"]))
    {
        header("Location: index.php");
        exit;
    }
    
    require 'functions.php';

    if($type != "Admin")
    {
        header("Location: index.php");
        exit;
    }

    if( isset($_POST["add"]))
    {
        // cek apakah data berhasil di tambahkan atau tidak
        if(add_account($_POST) > 0)
        {
            echo "
                <script>
                    alert('Akun berhasil ditambah!');
                    document.location.href = 'account-list.php';
                </script>
            ";
        }
        else
        {
            echo "
                <script>
                    alert('Akun gagal ditambah!');
                </script>
            ";
        }
    }

    if( isset($_POST["delete"]))
    {
        if(delete_account($_POST) > 0)
        {
            echo "
                <script>
                    alert('Akun berhasil dihapus!');
                    document.location.href = 'account-list.php';
                </script>
            ";
        }
        else
        {
            echo "
                <script>
                    alert('Akun gagal dihapus!');
                </script>
            ";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account List - Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/vendors/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/logo1.png" type="image/x-icon">
</head>

<body>
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="dashboard.php"><img src="assets/images/logo/logo1.png" alt="Logo" srcset=""></a>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="menu" id="navMenus">
                    <li class="sidebar-title">Menu</li>

                    <li class="sidebar-item">
                        <a href="dashboard.php" class="sidebar-link">
                            <i class="bi bi-grid-fill"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <?php
                        if($type != "manager")
                        {
                    ?>
                        <li class="sidebar-item">
                            <a href="suppliers.php" class="sidebar-link">
                                <i class="bi bi-truck-front-fill"></i>
                                <span>Suppliers</span>
                            </a>
                        </li>

                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-box-seam-fill"></i>
                                <span>Items</span>
                            </a>
                            <ul class="submenu">
                                <li class="submenu-item ">
                                    <a href="item-list.php">Item List</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="item-category.php">Item Category</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }
                        
                        if($type == "Admin")
                        {
                    ?>    
                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-archive-fill"></i>
                                <span>Stock</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="stock-item.php">Stock Item</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="incoming-stock.php">Incoming Stock</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="out-of-stock.php">Out of Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type == "Gudang")
                        {
                    ?>
                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-archive-fill"></i>
                                <span>Stock</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="stock-item.php">Stock Item</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="incoming-stock.php">Incoming Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type != "manager")
                        {
                    ?>
                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-file-text-fill"></i>
                                <span>Reports</span>
                            </a>
                            <ul class="submenu">
                                <li class="submenu-item ">
                                    <a href="reports-incoming.php">Incoming Stock</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="reports-out.php">Out of Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type == "manager")
                        {
                    ?>
                        <li class="sidebar-item has-sub">
                            <a href="#" class="sidebar-link">
                                <i class="bi bi-archive-fill"></i>
                                <span>Stock</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="stock-item.php">Stock Item</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="out-of-stock.php">Out of Stock</a>
                                </li>
                            </ul>
                        </li>
                    <?php    
                        }

                        if($type == "Admin")
                        {
                    ?>
                        <li class="sidebar-item active">
                            <a href="account-list.php" class="sidebar-link" onclick="active()">
                                <i class="bi bi-person-badge-fill"></i>
                                <span>Account</span>
                            </a>
                        </li>
                    <?php    
                        }
                    ?>
                    
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link" data-bs-toggle="modal" data-bs-target="#logoutModal">
                            <i class="bi bi-door-closed-fill"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>

    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Account List</h3>
                        <p class="text-subtitle text-muted">For user to check account list</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Account List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <button type="Add" class="btn btn-primary me-1 mb-1" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Add</button>
                    </div>
                    <div class="card-body">
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Account</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form class="form form-vertical" action="" method="post">
                                        <div class="modal-body">
                                            <!-- Basic Vertical form layout section start -->
                                                <div class="form-body">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="name">Name:</label>
                                                            <input type="text" id="name"
                                                                class="form-control" name="name"
                                                                placeholder="Input Name" autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="telephone">Username:</label>
                                                            <input type="text" id="username"
                                                                class="form-control" name="username"
                                                                placeholder="Input Username" autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="email">Email:</label>
                                                            <input type="text" id="email"
                                                                class="form-control" name="email"
                                                                placeholder="Input Email" autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="password">Password:</label>
                                                            <input type="password" id="password"
                                                                class="form-control" name="password"
                                                                placeholder="Input Password" autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="type">Account Type:</label>
                                                            <select id="type" class="form-control" name="type">
                                                                <option value="Admin">Admin</option>
                                                                <option value="Gudang">Gudang</option>
                                                                <option value="manager">manager</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            <!-- // Basic Vertical form layout section end -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="cancel" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">Cancel</button>
                                            <button type="submit" name="add" class="btn btn-primary me-1 mb-1">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped" id="table1" width="100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Username</th>
                                <th>Account Type</th>
                                <th colspan="2">Action</th>   
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $sSQL="";
                                $sSQL="SELECT * FROM tb_account order by id";
                                $result=mysqli_query($conn, $sSQL);
                                if (mysqli_num_rows($result) > 0) 
                                {
                                    $no = 0;
                                    while ($row=mysqli_fetch_assoc($result))
                                    {
                                        $id = $row['id'];
                                        $name = $row['name'];
                                        $email = $row['email'];
                                        $username = $row['username'];
                                        $type= $row['type'];
                                        $no = $no + 1;
                                        
                            ?>		
                                        <tr>
                                            <td width="4%"><?php echo $no;?></td>
                                            <td><?php echo $name;?></td>
                                            <td><?php echo $email;?></td>
                                            <td><?php echo $username;?></td>
                                            <td><?php echo $type;?></td>
                                            <td width="4%">
                                                <a href="update_account.php?id=<?php echo $row["id"] ?>"><button class='btn btn-primary'>UPDATE</button></a>
                                            </td>
                                            <td width="5%">
                                                <form action="" method="POST">
                                                    <input type="text" id="id" class="form-control" name="id" value="<?php echo $row["id"] ?>" hidden>
                                                    <button type="submit" name="delete" class="btn btn-danger">DELETE</button>
                                                </form>
                                            </td>
                                        </tr>   
                            <?php	   
                                    }
                                } 
                            ?>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
    </div>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Ready to Leave?</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button type="cancel" class="btn btn-light-secondary me-1 mb-1" data-bs-dismiss="modal">Cancel</button>
                    <a href="logout.php"><button type="submit" name="logout" class="btn btn-primary me-1 mb-1">Logout</button></a>
                </div>
            </div>
        </div>
    </div>

    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    
    <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
        function openForm() {
            document.getElementById("myForm").style.display = "block";
          }
          
          function closeForm() {
            document.getElementById("myForm").style.display = "none";
          }
    </script>

    <script>
        function konfirmasi()
        {
            if (!confirm('Yakin hapus member user ini ?'))
                return false;
            else
                return true;
        }
    </script>

    <script src="assets/js/main.js"></script>
</body>

</html>